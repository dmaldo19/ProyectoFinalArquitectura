import textwrap

"""
Decodificador en python PCebres
"""

"""
Tener cuidado con las direcciones de lectura y escritura del archivo.
Dependiendo de la computadora puede ser necesario ser más o menos
específico.
"""

# Abrir el archivo de texto donde están las instrucciones
with open('programa.txt', 'r') as archivo:
    instrucciones = archivo.readlines()

# Dividir cada línea del archivo en una instrucción
instrucciones = [linea.split('\n')[0] for linea in instrucciones]

##Diccionario para las instrucciones a utilizar:
opcode = {
    "add": "000000", "sub": "000000", "or": "000000", "and": "000000", "slt": "000000", "nop": "000000",
    "jr": "000000", "addi": "001000", "ori": "001101", "andi": "001100", "slti": "001010", "lw": "100011",
    "sw": "101011", "beq": "000100", "bne": "000101", "j": "000010", "jal": "000011"
}

shamt_function = {
    "add": "00000100000", "sub": "00000100010", "or": "00000100101", "and": "00000100100",
    "slt": "00000101010", "nop": "00000000000", "jr": "00000001000"
}

# Lista de instrucciones según su tipo:
r_instructions = ["add", "sub", "or", "and", "slt", "nop", "jr"]
i_instructions = ["addi", "ori", "andi", "slti"]
load_store_instructions = ["lw", "sw"]
branch_instructions = ["beq", "bne"]
jump_instructions = ["j", "jal"]

# Lista de instrucciones que se pasará al nuevo archivo txt
setInstrucciones = []

# Convertir de una instrucción ASM a una instrucción de 32'b
def crearInstruccion(instruccion):
    # Separar la instrucción en palabras
    palabras = instruccion.split()

    # Obtener la primera palabra
    operacion = palabras.pop(0).lower()

    if operacion == "nop":
        lineaInstruccion = "00000000000000000000000000000000"

    elif operacion in r_instructions:
        # Obtener los registros necesarios
        rd = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Registro destino
        rs = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 1
        rt = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 2

        # Convertir los registros a binario
        rd = decimal_a_binario(rd)
        rs = decimal_a_binario(rs)
        rt = decimal_a_binario(rt)

        # Crear la instrucción en binario
        lineaInstruccion = opcode[operacion] + rs + rt + rd + shamt_function[operacion]

    elif operacion in i_instructions:
        # Obtener los registros necesarios
        rt = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 1
        rs = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 2
        immediate = int(palabras.pop(0).replace('#', '').replace(',', ''))  # Valor

        # Convertir los registros a binario
        rs = decimal_a_binario(rs)
        rt = decimal_a_binario(rt)
        immediate = format(immediate, '0>16b')

        # Crear la instrucción en binario
        lineaInstruccion = opcode[operacion] + rs + rt + immediate

    elif operacion in load_store_instructions:
        # Obtener los registros necesarios
        rt = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 1

        # Crea un string con el valor del offset con el base pointer
        line = palabras.pop(0).replace('#', '').replace('(', ' ').replace('$', '').replace(')', '')
        # Separa el string en palabras
        offset_base = line.split()
        # Obtiene los valores necesarios para cada variable
        offset = int(offset_base.pop(0))
        base = int(offset_base.pop(0))

        # Convierte los valores a binario
        rt = decimal_a_binario(rt)
        base = decimal_a_binario(base)
        offset = format(offset, '0>16b')

        # Crea la instrucción
        lineaInstruccion = opcode[operacion] + base + rt + offset

    elif operacion in branch_instructions:
        # Obtener los registros necesarios
        rs = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 1
        rt = int(palabras.pop(0).replace('$', '').replace(',', ''))  # Register 2
        offset = int(palabras.pop(0).replace('#', '').replace(',', ''))  # Valor

        # Convertir los registros a binario
        rs = decimal_a_binario(rs)
        rt = decimal_a_binario(rt)
        offset = format(offset, '0>16b')

        # Crear la instrucción en binario
        lineaInstruccion = opcode[operacion] + rs + rt + offset

    elif operacion in jump_instructions:
        target = int(palabras.pop(0))
        target = format(target, '0>26b')
        lineaInstruccion = opcode[operacion] + target

    """
    Las instrucciones pueden ser escritas con o sin ','
    Es decir:
    Add $7, $3, $5
    Add $7 $3 $5
    Estos son los formatos válidos
    """

    # Agregar la instrucción a la lista con todas las instrucciones en binario
    setInstrucciones.append(lineaInstruccion)

# Convertir de base decimal a binario
def decimal_a_binario(n):
    binario = format(n, '0>5b')  # Hace que el valor tenga 5 bits siempre
    return binario

for i in range(len(instrucciones)):
    crearInstruccion(instrucciones[i])

# Abrir archivo en modo escritura
with open('Mem_Inst.txt', 'w') as archivo:
    for instruccion in setInstrucciones:
        # Convertir cada instrucción en una cadena y dividirla en líneas de 8 bits
        linea = '\n'.join(textwrap.wrap(instruccion, 8))
        # Escribir la línea en el archivo
        archivo.write(linea + '\n')

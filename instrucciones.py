import textwrap

"""
Decodificador en python PCebres
"""


"""
Tener cuidado con las direcciones de lectura y escritura del archivo.
Dependiendo de la computadora puede ser necesario ser mas o menos
especifico.
"""

##Abrir el archivo de texto donde estan las instrucciones##
with open('programa.txt', 'r') as archivo:
    instrucciones = archivo.readlines()

#Dividir cada linea del archivo en una instruccion
instrucciones = [linea.split('\n')[0] for linea in instrucciones];
archivo.close();

##Diccionario para las Instrucciones a utilizar:
opcode = {"add":"000000", "sub":"000000", "or":"000000", "and":"000000", "slt":"000000", "nop":"000000", "jr":"000000", "addi":"001000", "ori":"001101", "andi":"001100", "slti":"001010", "lw":"100011", "sw":"101011", "beq":"000100", "bne":"000101"};

shamt_function = {"add":"00000100000", "sub":"00000100010", "or":"00000100101", "and":"00000100100", "slt":"00000101010", "nop":"00000000000", "jr":"00000001000"};

#Lista de instrucciones segun su tipo:
r_instructions = ["add", "sub", "or", "and", "slt", "nop", "jr"];
i_instructions = ["addi", "ori", "andi", "slti"];
load_store_instructions = ["lw", "sw"]
branch_instructions = ["beq", "bne"]

#Lista de instrucciones que se pasara al nuevo archivo txt
setInstrucciones = [];

#Convertir de una instruccion ASM a una instruccion de 32'b
def crearInstruccion(instruccion):
    # separar la instrucción en palabras
    palabras = instruccion.split();

    # obtener la primera palabra
    operacion = palabras.pop(0);
    operacion = operacion.lower();

    if(operacion == "nop"):
        lineaInstruccion = "00000000000000000000000000000000"
    
    elif(operacion in r_instructions):
        #Obtener los registros necesarios
        rd = int(palabras.pop(0).replace('$', '').replace(',', '')); #registro destino
        rs = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 1
        rt = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 2
    
        #Convertir los registros a binario
        rd = decimal_a_binario(rd);
        rs = decimal_a_binario(rs);
        rt = decimal_a_binario(rt);
    
        #Crear la instruccion en binario
        lineaInstruccion = opcode[operacion] + rs + rt + rd + shamt_function[operacion];
    
    elif(operacion in i_instructions):
        #Obtener los registros necesarios
        rt = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 1
        rs = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 2
        immediate = int(palabras.pop(0).replace('#', '').replace(',', '')); #valor
    
        #Convertir los registros a binario
        rs = decimal_a_binario(rs);
        rt = decimal_a_binario(rt);
        immediate = format(immediate, '0>16b');
    
        #Crear la instruccion en binario
        lineaInstruccion = opcode[operacion] + rs + rt + immediate
        
    elif(operacion in load_store_instructions):
        #Obtener los registros necesarios
        rt = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 1
        
        #Crea un string con el valor del offset con el base pointer
        line = palabras.pop(0).replace('#', '').replace('(', ' ').replace('$', '').replace(')', '');
        #Separa el string en palabras
        offset_base = line.split();
        #Obtiene los valores necesarios para cada variable
        offset = int(offset_base.pop(0));
        base = int(offset_base.pop(0));
        
        #Convierte los valores a binario
        rt = decimal_a_binario(rt);
        base = decimal_a_binario(base);
        offset = format(offset, '0>16b');
        
        #Crea la instruccion
        lineaInstruccion = opcode[operacion] + base + rt + offset
        
    elif(operacion in branch_instructions):
        #Obtener los registros necesarios
        rs = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 1
        rt = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 2
        offset = int(palabras.pop(0).replace('#', '').replace(',', '')); #valor
    
        #Convertir los registros a binario
        rs = decimal_a_binario(rs);
        rt = decimal_a_binario(rt);
        offset = format(offset, '0>16b');
    
        #Crear la instruccion en binario
        lineaInstruccion = opcode[operacion] + rs + rt + offset
        

    """
    Las instrucciones pueden ser escritas con o sin ,
    Es decir:
    Add $7, $3, $5
    Add $7 $3 $5
    Estos son los formatos validos
    """

    #Agregar la instruccion a la lista con todas las instrucciones en binario
    setInstrucciones.append(lineaInstruccion);

#Convertir de base decimal a binario
def decimal_a_binario(n):
    binario = format(n, '0>5b'); #Hace que el valor tenga 5 bits siempre
    return binario;

for i in range(len(instrucciones)):
    crearInstruccion(instrucciones[i]);

# abrir archivo en modo escritura
with open('Mem_Inst.txt', 'w') as archivo:
    
    for instruccion in setInstrucciones:
        #Convertir cada instrucción en una cadena y dividirla en líneas de 8 bits
        linea = '\n'.join(textwrap.wrap(instruccion, 8));
        # escribir la línea en el archivo
        archivo.write(linea + '\n');
archivo.close();

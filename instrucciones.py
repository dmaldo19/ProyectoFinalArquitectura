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
opcode = {"add":"000000", "sub":"000000", "or":"000000", "and":"000000", "slt":"000000", "nop":"000000"}

shamt_function = {"add":"00000100000", "sub":"00000100010", "or":"00000100101", "and":"00000100100", "slt":"00000101010", "nop":"00000000000"}

#Lista de instrucciones que se pasara al nuevo archivo txt
setInstrucciones = [];

#Convertir de una instruccion ASM a una instruccion de 32'b
def crearInstruccion(instruccion):
    # separar la instrucción en palabras
    palabras = instruccion.split();

    # obtener la primera palabra
    operacion = palabras.pop(0);
    operacion = operacion.lower();

    #Obtener los registros necesarios
    rd = int(palabras.pop(0).replace('$', '').replace(',', '')); #registro destino
    rs = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 1
    rt = int(palabras.pop(0).replace('$', '').replace(',', '')); #register 2

    """
    Las instrucciones pueden ser escritas con o sin ,
    Es decir:
    Add $7, $3, $5
    Add $7 $3 $5
    Estos son los formatos validos
    """

    #Convertir los registros a binario
    rd = decimal_a_binario(rd);
    rs = decimal_a_binario(rs);
    rt = decimal_a_binario(rt);

    #Crear la instruccion en binario
    lineaInstruccion = opcode[operacion] + rs + rt + rd + shamt_function[operacion];
    #Agregar la instruccion a la lista con todas las instrucciones en binario
    setInstrucciones.append(lineaInstruccion);

#Convertir de base decimal a binario
def decimal_a_binario(n):
    binario = format(n, '0>5b'); #Hace que el valor tenga 5 bits siempre
    return binario;

#Agregar los valores a la lista con todas las instrucciones ya convertidas a binario
for i in range(len(instrucciones)):
    crearInstruccion(instrucciones[i]);

# abrir archivo en modo escritura
with open('instruccionesBinario.txt', 'w') as archivo:
    
    for instruccion in setInstrucciones:
        #Convertir cada instrucción en una cadena y dividirla en líneas de 8 bits
        linea = '\n'.join(textwrap.wrap(instruccion, 8));
        # escribir la línea en el archivo
        archivo.write(linea + '\n');
archivo.close();

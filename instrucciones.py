##Abrir el archivo de texto donde estan las instrucciones##
with open('programa.txt', 'r') as archivo:
    instrucciones = archivo.readlines();

instrucciones = [linea.split('\n')[0] for linea in instrucciones];
archivo.close();
print(instrucciones);

##Diccionario para las Instrucciones a utilizar:

opcode = {"add":"000000", "sub":"000000", "or":"000000", "and":"000000", "slt":"000000", "nop":"000000"}

shamt_function = {"add":"00000100000", "sub":"00000100010", "or":"00000100101", "and":"00000100100", "slt":"00000101010", "nop":"00000000000"}

print(shamt_function["nop"]);

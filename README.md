# Datapath
Este datapath incluye una unidad de registros, una unidad funcional, una memoria de datos y un multiplexor para seleccionar la salida de la unidad funcional o la memoria de datos. También incluye flip-flops para almacenar los bits de estado de la unidad funcional y retroalimentar el acarreo de entrada de la unidad funcional con el acarreo de salida.
El datapath es responsable de realizar operaciones aritméticas, lógicas, de desplazamiento, saltos, así como de almacenar y recuperar datos de la memoria.
El datapath se controla mediante señales de control que determinan qué operaciones se realizan y cómo se enrutan los datos. Además, el datapath incluye un multiplexor para seleccionar la entrada de la unidad funcional y otro para seleccionar la salida de la memoria de datos o la unidad funcional, lo que perimite varios modos de direccionamiento y acceso a datos:
- Inmediato, directo, indirecto y por registro.

Para el destino de la operación, se utiliza un registro de 8 bits que almacena el resultado de la operación realizada por la unidad funcional o el dato recuperado de la memoria de datos que se almacena en la Unidad de Registros por lo que solo hay un modo de direccionamiento para el destino de la operación, que es el registro de 8 bits. Para el origen 1 de la operación tiene 3 modos de direccionamiento: registro, directo e indirecto a memoria. Para el origen 2 de la operación tiene 2 modos de direccionamiento: registro e inmediato.

El datapath esta formado por los siguientes modulos:

## Unidad de Registros
La unidad de registros almacena 8 registros de 8 bits cada uno.
La unidad de registros tiene 3 señales de control de 3 bits cada una, DA, DB y DC, que seleccionan el registro de entrada C y los dos de salida A y B. Tiene una señal de control de 1 bit w, que indica si se debe escribir en el registro seleccionado.
La unidad de registros tiene una señal de reloj (clk), que sincroniza la escritura en los registros.
- 000 -> Reg0
- 001 -> Reg1
- 010 -> Reg2
- 011 -> Reg3
- 100 -> Reg4
- 101 -> Reg5
- 110 -> Reg6
- 111 -> Reg7

## Unidad Aritmetica
La unidad aritmetica realiza operaciones aritmeticas sobre dos operandos de 8 bits A y B, y una señal de control de 3 bits S para seleccionar la operación.
Las operaciones que realiza son:
- Suma
- Resta
- Incremento de A
- Decremento de A
- Transferencia de A
- Transferencia de B (Inmediato)
- Suma con acarreo
- Incremento de B
- La salida de la unidad aritmetica es R de 8 bits, y tieen 4 bits de estado que son: el acarreo de salida (c), el overflow (v), el signo (s) y el cero (z).

Para la unidad aritmetica y que los operandos A y B, y el acarreo de entrada (ci) hagan la operación seleccionada por la señal de control S, se obtuvieron las siguientes ecuaciones:
Ai = ¬S(1) ¬S(0) Ai + ¬S(2) A + S(1) ¬S(0) Ai
Bi = S(2) Bi + ¬S(2) ¬S(1) ¬S(0) Bi + ¬S(2) ¬S(1) S(0) ¬Bi + ¬S(2) S(1) S(0)
Ci = ¬S(2) S(1) ¬S(0) + S(2) S(1) S(0) + ¬S(2) ¬S(1) S(0) ci + ¬S(2) ¬S(1) ¬S(0)


## Unidad lógica
La unidad lógica realiza operaciones lógicas sobre dos operandos de 8 bits A y B, y una señal de control de 3 bits S.
Las operaciones que realiza son:
- Operación lógica AND
- Operación lógica OR
- Operación lógica XOR
- Operación lógica NAND
- Operación lógica NOR
- Operación lógica XNOR
- Negación de A
- Negación de B
- La salida de la unidad lógica es R de 8 bits y dos bits de estado que son: cero (z) y signo (s).

## Shifter
El Shifter realiza desplazamientos y rotaciones sobre un dato de 8 bits D, y una señal de control de 2 bits S.
Las operaciones que realiza son:
- 00 -> desplazamiento a la izquierda
- 01 -> desplazamiento a la derecha
- 10 -> rotación a la izquierda
- 11 -> rotación a la derecha
La salida del Shifter es Q de 8 bits, y pose un bit de estado que es el acarreo de salida (cout) que se genera en el desplazamiento a la izquierda y derecha, y mediante un mux se selecciona cual de los dos sera el acarreo de salida.

## Unidad Funcional
La unidad funcional realiza operaciones aritméticas, lógicas y de desplazamiento
sobre dos operandos de 8 bits A y B, y una señal de control de 5 bits S que selecciona las operaciones.

Las operaciones que realiza son:
- Suma
- Resta
- Incremento de A
- Decremento de A
- Transferencia de A
- Transferencia de B (Inmediato)
- Suma con acarreo
- Incremento de B
- Operación lógica AND
- Operación lógica OR
- Operación lógica XOR
- Operación lógica NAND
- Operación lógica NOR
- Operación lógica XNOR
- Negación de A
- Negación de B
- Desplazamiento a la izquierda
- Desplazamiento a la derecha
- Rotación a la izquierda
- Rotación a la derecha
- Salto si C = 1
- Salto si C = 0
- Salto si S = 1
- Salto si S = 0
- Salto incondicional
- Comparación
- Almacenamiento en memoria
- Carga desde memoria
- Salto si V = 1
- Salto si V = 0
- Salto si Z = 1
- Salto si Z = 0

## Memoria de 256 registros de 8 bits
Tiene una entrada de 8 bits, una dirección de 8 bits, una señal de escritura y una salida de 8 bits.

Con la dirección se selecciona el registro a escribir y la entrada se escribe en ese registro y solo la señal de escritura (w) es la que dice si se debe leer o escribir en la memoria.


# Unidad de control


## Decodificador
Este modulo se encarga de decodificar la instrucción de 25 bits que se encuentra en la memoria de codigo y generar el inmediato y las señales de control necesarias para el funcionamiento del datapath.
De los bits 24 a 20 se obtiene el opcode de la instrucción, de los bits 19 a 17 se obtiene la señal de control para el destino de la unidad de registros, de los bits 16 a 14 se obtiene la señal de control del origen 1 de la unidad de registros, de los bits 13 a 11 se obtiene la señal de control del origen 2 de la unidad de registros, de los bits 10 a 9 se obtiene el modo de direccionamiento del origen 1, el bit 8 se obtiene el modo de direccionamiento del origen 2, de los bits 7 a 0 se obtiene el inmediato de la instrucción.

Para el modo de direccionamiento del origen 1, se tiene el modo registro (00), el modo indirecto (01) y el modo directo (10). Para el modo de direccionamiento del origen 2, se tiene el modo registro (0) y el modo inmediato (1).

Para generar las señales de escritura de los flip-flops de los bits de estado, no se obtiene directamente de la instrucción, sino que se obtiene de la señal S, que es la señal de control de la unidad funcional. Estas señales se obtiene de los bits 24 a 20 de la instrucción. La señal S se utiliza para determinar el tipo de operación que se va a realizar en la unidad funcional y, en consecuencia, se utilizan las señales de escritura de los flip-flops de los bits de estado en base a los bits de estado que modifica cada operación.

La señal w de la palabra de control se obtiene de la señal S. La señal w se utiliza para habilitar la escritura en la unidad de registros en base a cual operación se va a realizar.

La señal wm de la palabra de control se obtiene de la señal S. La señal wm se utiliza para habilitar la escritura en la memoria de datos en base a cual operación se va a realizar.

La señal mdir se obtiene del modo de direccionamiento del origen 1. La señal mdir se utiliza para seleccionar el modo de acceso a la memoria de datos, ya sea directo o indirecto. De esta manera, se puede acceder a la memoria de datos de manera directa o indirecta, dependiendo del modo de direccionamiento que se utilice y también se utiliza para seleccionar la entrada de datos de la unidad de registros.

La señal mi se obtiene del modo de direccionamiento del origen 2. La señal mi se utiliza para seleccionar el modo de operación de la unidad funcional, ya sea registro o inmediato. De esta manera, se puede seleccionar el modo de operación de la unidad funcional dependiendo del modo de direccionamiento que se utilice.

## "Datapath" de la unidad de control del procesador
Este módulo se encarga de controlar el flujo de datos del datapath de la unidad de control del procesador, como el incremento del contador de programa (PC), comunicarse con el decodificador para obtener la instrucción a ejecutar y guardarla en el registro de 31 bits (CW), o comunicarse con la memoria de codigo para obtenenr la siguiente instruccion a ejecutar.

También genera dos señales para la unidad de control de la UC, una señal jump para indicar si se debe realizar un salto y una señal sv para indicar si el salto debe hacerse si se cumple la condición o tiene que saltar sin importar la condición.

## "Unidad de Control" de la unidad de control del procesador
Este módulo se encarga de controlar el flujo de datos del datapath de la unidad de control del procesador, generando las señales que se ejecutan en cada estado o ciclo de reloj.

Como se encarga de controlar el flujo de datos del datapath de la unidad de control del procesador, se necesita dos señales: jump y sv. La señal jump se utiliza para indicar si se debe realizar un salto o no, y la señal sv se utiliza para indicar si el salto debe hacerse si se cumple la condición o tiene que saltar sin importar la condición. Estas señales son necesarias ya que en base a estas señales se sabe a que estado se tiene que ir y que señales se tienen que activar para realizar la operación deseada.

## Unidad de salto
La señal de salto se activa cuando la instrucción es un salto.

La señal jump se activa en base a la operación de la señal S de la unidad funcional.

La señal sv se genera en base al tipo de salto que se desea realizar, ya sea en base a los bits de estado de la unidad funcional o si es un salto incondicional.

--Full Adder FA
--Las entradas son a, b y ci. Las salidas son co y r.
--Todos los puertos son de 1 bit.

--Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

--La entidad permite declarar la arquitectura del circuito.
--Observe que solo se definen las entrdas y salidas, que en 
--en este caso son conocidos como puertos.
 entity FA is
   port (a, b, ci: in std_logic;
         r, co: out std_logic);
 end FA;
 
--Ahora viene la organizacion la cual se declara en el
--modulo architecture
 architecture Ar_FA of FA is
 begin
   co <= (a and ci) or (a and b) or (b and ci);
   r <= (a and not(b) and not(ci)) or (not(a) and not(b) and ci) or (a and b and ci) or (not(a) and b and not(ci));
 end Ar_FA;
 
 
 
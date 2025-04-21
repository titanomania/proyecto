--Flip-Flop tipo D con se�al de escritura w.

library IEEE;
use IEEE.std_logic_1164.all;

 entity FFD is
   port (d, clk: in std_logic; 
         q: out std_logic);
 end FFD;

 architecture Ar_FFD of FFD is
 begin
   --Por sus caracteristicas tiene que ser secuencial
   process (d, clk)
   begin
     if (d = 'U') then 
       q <= '0';
     end if;
     if (clk'event and clk = '1') then
       q <= d;
     end if;
   end process;
 end Ar_FFD;
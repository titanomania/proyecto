--Flip-Flop tipo D con se�al de escritura w.

library IEEE;
use IEEE.std_logic_1164.all;

 entity FFDw is
   port (d, w, clk: in std_logic; 
         q: out std_logic);
 end FFDw;

 architecture Ar_FFDw of FFDw is
 begin
   --Por sus caracteristicas tiene que ser secuencial
   process (d, clk, w)
   begin
    if (d = 'U') then 
       q <= '0';
     end if;
     if (clk'event and clk = '1') then
       if (w = '1') then
         q <= d;
       end if;
     end if;
   end process;
 end Ar_FFDw;
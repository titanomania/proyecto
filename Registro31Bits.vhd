library IEEE;
use IEEE.std_logic_1164.all;

 entity Registro31Bits is
   port (D: in std_logic_vector (30 downto 0); 
         w, clk: in std_logic; 
         Q: out std_logic_vector (30 downto 0));
 end Registro31Bits;

 architecture Ar_Registro31Bits of Registro31Bits is
   component FFDw
     port (d, w, clk: in std_logic; 
           q: out std_logic);
   end component; 
 begin
    Bit0 : FFDw port map (D(0), w, clk, Q(0));
    Bit1 : FFDw port map (D(1), w, clk, Q(1));
    Bit2 : FFDw port map (D(2), w, clk, Q(2));
    Bit3 : FFDw port map (D(3), w, clk, Q(3));
    Bit4 : FFDw port map (D(4), w, clk, Q(4));
    Bit5 : FFDw port map (D(5), w, clk, Q(5));
    Bit6 : FFDw port map (D(6), w, clk, Q(6));
    Bit7 : FFDw port map (D(7), w, clk, Q(7));
    Bit8 : FFDw port map (D(8), w, clk, Q(8));
    Bit9 : FFDw port map (D(9), w, clk, Q(9));
    Bit10 : FFDw port map (D(10), w, clk, Q(10));
    Bit11 : FFDw port map (D(11), w, clk, Q(11));
    Bit12 : FFDw port map (D(12), w, clk, Q(12));
    Bit13 : FFDw port map (D(13), w, clk, Q(13));
    Bit14 : FFDw port map (D(14), w, clk, Q(14));
    Bit15 : FFDw port map (D(15), w, clk, Q(15));
    Bit16 : FFDw port map (D(16), w, clk, Q(16));
    Bit17 : FFDw port map (D(17), w, clk, Q(17));
    Bit18 : FFDw port map (D(18), w, clk, Q(18));
    Bit19 : FFDw port map (D(19), w, clk, Q(19));
    Bit20 : FFDw port map (D(20), w, clk, Q(20));
    Bit21 : FFDw port map (D(21), w, clk, Q(21));
    Bit22 : FFDw port map (D(22), w, clk, Q(22));
    Bit23 : FFDw port map (D(23), w, clk, Q(23));
    Bit24 : FFDw port map (D(24), w, clk, Q(24));
    Bit25 : FFDw port map (D(25), w, clk, Q(25));
    Bit26 : FFDw port map (D(26), w, clk, Q(26));
    Bit27 : FFDw port map (D(27), w, clk, Q(27));
    Bit28 : FFDw port map (D(28), w, clk, Q(28));
    Bit29 : FFDw port map (D(29), w, clk, Q(29));
    Bit30 : FFDw port map (D(30), w, clk, Q(30));
 end Ar_Registro31Bits;
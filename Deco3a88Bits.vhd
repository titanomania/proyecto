library IEEE;
use IEEE.std_logic_1164.all;

entity Deco3a88Bits is
  port (S: in std_logic_vector(2 downto 0);
        do0, do1, do2, do3, do4, do5, do6, do7: out std_logic_vector(7 downto 0));
end Deco3a88Bits;

architecture Ar_Deco3a88Bits of Deco3a88Bits is
  component Deco3a8 is
    port (S: in std_logic_vector(2 downto 0);
          do0, do1, do2, do3, do4, do5, do6, do7: out std_logic);
  end component;
begin

  




end Ar_Deco3a88Bits;
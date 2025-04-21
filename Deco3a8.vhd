library IEEE;
use IEEE.std_logic_1164.all;

entity Deco3a8 is
  port (S: in std_logic_vector(2 downto 0);
        do0, do1, do2, do3, do4, do5, do6, do7: out std_logic);
end Deco3a8;

architecture Ar_Deco3a8 of Deco3a8 is
begin
  do0 <= not(S(2)) and not(S(1)) and not(S(0));
  do1 <= not(S(2)) and not(S(1)) and S(0);
  do2 <= not(S(2)) and S(1) and not(S(0));
  do3 <= not(S(2)) and S(1) and S(0);
  do4 <= S(2) and not(S(1)) and not(S(0));
  do5 <= S(2) and not(S(1)) and S(0);
  do6 <= S(2) and S(1) and not(S(0));
  do7 <= S(2) and S(1) and S(0);

end Ar_Deco3a8;
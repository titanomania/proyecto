
library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8a18Bits is
    port (
        a, b, c, d, e, f, g, h: in std_logic_vector(7 downto 0);
        S: in std_logic_vector(2 downto 0);
        r: out std_logic_vector(7 downto 0)
    );
end Mux8a18Bits;


architecture Ar_Mux8a18Bits of Mux8a18Bits is
    component Mux8a1 is
        port (a, b, c, d, e, f, g, h: std_logic;
              S: in std_logic_vector (2 downto 0);
              r: out std_logic);
      end component;

begin
    Mux8a1_0: Mux8a1 port map (a(0), b(0), c(0), d(0), e(0), f(0), g(0), h(0), S, r(0));
    Mux8a1_1: Mux8a1 port map (a(1), b(1), c(1), d(1), e(1), f(1), g(1), h(1), S, r(1));
    Mux8a1_2: Mux8a1 port map (a(2), b(2), c(2), d(2), e(2), f(2), g(2), h(2), S, r(2));
    Mux8a1_3: Mux8a1 port map (a(3), b(3), c(3), d(3), e(3), f(3), g(3), h(3), S, r(3));
    Mux8a1_4: Mux8a1 port map (a(4), b(4), c(4), d(4), e(4), f(4), g(4), h(4), S, r(4));
    Mux8a1_5: Mux8a1 port map (a(5), b(5), c(5), d(5), e(5), f(5), g(5), h(5), S, r(5));
    Mux8a1_6: Mux8a1 port map (a(6), b(6), c(6), d(6), e(6), f(6), g(6), h(6), S, r(6));
    Mux8a1_7: Mux8a1 port map (a(7), b(7), c(7), d(7), e(7), f(7), g(7), h(7), S, r(7));
end Ar_Mux8a18Bits;
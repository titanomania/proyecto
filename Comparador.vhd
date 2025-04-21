library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador is
    port (
        A, B: in std_logic_vector(7 downto 0); --entradas
        S: out std_logic --salida
    );
end Comparador;

architecture Ar_Comparador of Comparador is
    signal S0, S1, S2, S3, S4, S5, S6, S7: std_logic;

begin
    -- Comparador de 8 bits, utilizando compuertas xor y and
    S0 <= not(A(0) xor B(0));
    S1 <= not(A(1) xor B(1));
    S2 <= not(A(2) xor B(2));
    S3 <= not(A(3) xor B(3));
    S4 <= not(A(4) xor B(4));
    S5 <= not(A(5) xor B(5));
    S6 <= not(A(6) xor B(6));
    S7 <= not(A(7) xor B(7));

    S <= S0 and S1 and S2 and S3 and S4 and S5 and S6 and S7;
end Ar_Comparador;
library IEEE;
use IEEE.std_logic_1164.all;

entity UnidadLogica is
    port (
        A, B: in std_logic_vector(7 downto 0);  -- Entrada de 8 bits
        S: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
        R: out std_logic_vector(7 downto 0);  -- Salida de 8 bits
        z: out std_logic;  -- cero
        sg: out std_logic  -- signo
    );
end UnidadLogica;


architecture Ar_UnidadLogica of UnidadLogica is
    component Mux8a18Bits is
        port (
            a, b, c, d, e, f, g, h: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            r: out std_logic_vector(7 downto 0)
        );
    end component;

    signal Ax, Bx, Rx: std_logic_vector(7 downto 0);
    signal ANDX, ORX, NOTAX, NOTBX, XORX: std_logic_vector(7 downto 0);
    signal NOTANDX, NOTORX, NOTXORX: std_logic_vector(7 downto 0);

begin

    -- AND
    ANDX <= A and B;
    -- OR
    ORX <= A or B;
    -- NOT A
    NOTAX <= not A;
    -- NOT B
    NOTBX <= not B;
    -- XOR
    XORX <= A xor B;
    -- NOT (A and B)
    NOTANDX <= not (A and B);
    -- NOT (A or B)
    NOTORX <= not (A or B);
    -- NOT (A xor B)
    NOTXORX <= not (A xor B);

    -- Multiplexor de 8 a 1
    Mux8a1: Mux8a18Bits port map (ANDX, ORX, NOTAX, NOTBX, XORX, NOTANDX, NOTORX, NOTXORX, S, Rx);

    R <= Rx;

    z <= not(Rx(0) or Rx(1) or Rx(2) or Rx(3) or Rx(4) or Rx(5) or Rx(6) or Rx(7));
    sg <= Rx(7);

end Ar_UnidadLogica;
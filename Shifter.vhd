library IEEE;
use IEEE.std_logic_1164.all;

entity Shifter is
    port (
        d: in std_logic_vector(7 downto 0);     -- Entrada de 8 bits
        S: in std_logic_vector(1 downto 0);     -- Señal de control
        q: out std_logic_vector(7 downto 0);    -- Salida de 8 bits
        c_shl: out std_logic;                   -- Acarreo por SHL
        c_shr: out std_logic                    -- Acarreo por SHR
    );
end Shifter;


architecture Ar_Shifter of Shifter is
    component Mux4a1 is
        port (a, b, c, d: std_logic;
              S: in std_logic_vector (1 downto 0);
              r: out std_logic);
    end component;

    -- 00 -> desplazamiento a la izquierda
    -- 01 -> desplazamiento a la derecha
    -- 10 -> rotación a la izquierda
    -- 11 -> rotación a la derecha
    begin
        Mux4a1_0: Mux4a1 port map ('0',  d(1), d(7), d(1), S, q(0));
        Mux4a1_1: Mux4a1 port map (d(0), d(2), d(0), d(6), S, q(1));
        Mux4a1_2: Mux4a1 port map (d(1), d(3), d(1), d(5), S, q(2));
        Mux4a1_3: Mux4a1 port map (d(2), d(4), d(2), d(4), S, q(3));
        Mux4a1_4: Mux4a1 port map (d(3), d(5), d(3), d(3), S, q(4));
        Mux4a1_5: Mux4a1 port map (d(4), d(6), d(4), d(2), S, q(5));
        Mux4a1_6: Mux4a1 port map (d(5), d(7), d(5), d(1), S, q(6));
        Mux4a1_7: Mux4a1 port map (d(6), '0',  d(6), d(0), S, q(7));

        c_shl <= d(7) and (not(S(1)) and not(S(0))); -- Acarreo por SHL
        
        c_shr <= d(0) and (not(S(1)) and S(0)); -- Acarreo por SHR
        


end Ar_Shifter;
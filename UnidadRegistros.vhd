library IEEE;
use IEEE.std_logic_1164.all;

entity UnidadRegistros is
    port (
        C: in std_logic_vector(7 downto 0);  -- Entrada de 8 bits
        DA: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
        DB: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
        DC: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
        w: in std_logic;  -- Señal de control de 1 bit
        clk: in std_logic;  -- Señal de reloj
        A, B: out std_logic_vector(7 downto 0)  -- Salida de 8 bits
    );
end UnidadRegistros;

architecture Ar_UnidadRegistros of UnidadRegistros is
    component Mux8a18Bits is
        port (
            a, b, c, d, e, f, g, h: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            r: out std_logic_vector(7 downto 0)
        );
    end component;
    component Deco3a8 is
        port (S: in std_logic_vector(2 downto 0);
              do0, do1, do2, do3, do4, do5, do6, do7: out std_logic);
    end component;

    component Registro8Bits is
        port (D: in std_logic_vector (7 downto 0); 
              w, clk: in std_logic; 
              Q: out std_logic_vector (7 downto 0));
    end component;

    signal Ax, Bx, Cx: std_logic_vector(7 downto 0);
    signal D0, D1, D2, D3, D4, D5, D6, D7: std_logic; -- señales de salida de Deco3a8
    signal D0w, D1w, D2w, D3w, D4w, D5w, D6w, D7w: std_logic; -- señales de salida de Registro8Bits
    signal Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x: std_logic_vector(7 downto 0); -- señales de salida de Registro8Bits


begin
    Deco0: Deco3a8 port map (DC, D0, D1, D2, D3, D4, D5, D6, D7);

    D0w <= D0 and w;
    D1w <= D1 and w;
    D2w <= D2 and w;
    D3w <= D3 and w;
    D4w <= D4 and w;
    D5w <= D5 and w;
    D6w <= D6 and w;
    D7w <= D7 and w;

    Reg0: Registro8Bits port map (C, D0w, clk, Reg0x);
    Reg1: Registro8Bits port map (C, D1w, clk, Reg1x);
    Reg2: Registro8Bits port map (C, D2w, clk, Reg2x);
    Reg3: Registro8Bits port map (C, D3w, clk, Reg3x);
    Reg4: Registro8Bits port map (C, D4w, clk, Reg4x);
    Reg5: Registro8Bits port map (C, D5w, clk, Reg5x);
    Reg6: Registro8Bits port map (C, D6w, clk, Reg6x);
    Reg7: Registro8Bits port map (C, D7w, clk, Reg7x);

    Mux8a_A: Mux8a18Bits port map (Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x, DA, Ax);
    Mux8a_B: Mux8a18Bits port map (Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x, DB, Bx);

    A <= Ax;
    B <= Bx;

end Ar_UnidadRegistros;

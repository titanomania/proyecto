library IEEE;
use IEEE.std_logic_1164.all;

entity UnidadControl_uc is
    port (
        sv: in std_logic;  -- Señal de control de la unidad funcional
        jump: in std_logic;  -- Señal de salto
        clk: in std_logic;  -- Señal de reloj
        mb: out std_logic;
        mpc: out std_logic;
        wir, wcw, wpc: out std_logic  -- Señales de control de escritura para los registros de 8, 22 y 31 bits
    );
end UnidadControl_uc;


architecture Ar_UnidadControl_uc of UnidadControl_uc is
    component FFD is
        port (d, clk: in std_logic; 
              q: out std_logic);
    end component;
    component Deco3a8 is
        port (S: in std_logic_vector(2 downto 0);
              do0, do1, do2, do3, do4, do5, do6, do7: out std_logic);
    end component;

    signal I, A, B, C, D, E, F, G: std_logic; -- señales del decodificador
    signal D2, D1, D0: std_logic; 
    signal F2, F1, F0: std_logic;
    signal SUC: std_logic_vector(2 downto 0); --señal de control de 3 bits
    
    signal mbx, mpcx, wirx, wcwx, wpcx: std_logic; -- señales de control de escritura para los registros de 8, 22 y 31 bits



begin
    D2 <=   (not(F2) and F1 and not(F0) and jump and not(sv)) or
            (not(F2) and F1 and not(F0) and jump and sv);


    D1 <=   (not(F2) and not(F1) and F0) or
            (not(F2) and F1 and not(F0) and not(jump));

    D0 <=   (not(F2) and not(F1) and not(F0)) or
            (not(F2) and F1 and not(F0) and not(jump)) or
            (not(F2) and F1 and not(F0) and jump and sv) or
            (not(F2) and F1 and F0) or
            (F2 and not(F1) and not(F0)) or
            (F2 and not(F1) and F0);

    FF0: FFD port map (D0, clk, F0);
    FF1: FFD port map (D1, clk, F1);
    FF2: FFD port map (D2, clk, F2);

    SUC(2) <= F2;
    SUC(1) <= F1;
    SUC(0) <= F0;

    deco3a8_0: Deco3a8 port map (SUC, I, A, B, C, D, E, F, G);

    wirx <= A;
    wcwx <= B;
    wpcx <= I or C or D or E;
    mbx <= C or D;
    mpcx <= I;

    wir <= wirx;
    wcw <= wcwx;
    wpc <= wpcx;
    mb <= mbx;
    mpc <= mpcx;

        


end Ar_UnidadControl_uc;



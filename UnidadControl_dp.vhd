library IEEE;
use IEEE.std_logic_1164.all;

entity UnidadControl_dp is
    port (
        mb: in std_logic;
        mpc: in std_logic;
        wir, wcw, wpc: in std_logic;  -- Señales de control de escritura para los registros de 8, 25 y 31 bits
        clk: in std_logic;  -- Señal de reloj
        c, v, sg, z: in std_logic;  -- Salidas de la unidad funcional
        word: out std_logic_vector(30 downto 0);
        jump, sv: out std_logic
    );
end UnidadControl_dp;


architecture Ar_UnidadControl_dp of UnidadControl_dp is
    component Registro8Bits is
        port (D: in std_logic_vector (7 downto 0); 
              w, clk: in std_logic; 
              Q: out std_logic_vector (7 downto 0));
    end component;
    component Mux8a1 is
        port (a, b, c, d, e, f, g, h: std_logic;
              S: in std_logic_vector (2 downto 0);
              r: out std_logic);
    end component;
    component Mux2a18Bits is
        port (A, B: in std_logic_vector (7 downto 0);
              s: in std_logic;
              R: out std_logic_vector (7 downto 0));
    end component;
    component Deco is 
        port (wordMem: in std_logic_vector (24 downto 0);  -- 25 bits de la memoria de instrucciones
            word: out std_logic_vector (30 downto 0); -- 31 bits de la memoria de instrucciones
            jump: out std_logic); -- señal de salto
    end component;

    component Registro25Bits is
        port (D: in std_logic_vector (24 downto 0); 
              w, clk: in std_logic; 
              Q: out std_logic_vector (24 downto 0));
    end component;

    component Registro31Bits is
        port (D: in std_logic_vector (30 downto 0); 
              w, clk: in std_logic; 
              Q: out std_logic_vector (30 downto 0));
    end component;

    component Sumador8Bits is
        port (A, B: in std_logic_vector (7 downto 0); 
            ci: in std_logic; -- acarreo de entrada
            R: out std_logic_vector (7 downto 0); 
            c: out std_logic; -- acarreo de salida
            v: out std_logic; -- overflow
            s: out std_logic; -- signo
            z: out std_logic -- cero
        );
    end component;

    component MemoriaCodigo is
        port (dir: in std_logic_vector(7 downto 0);
        clk: in std_logic; 
        Q: out std_logic_vector (24 downto 0));
    end component;

    signal irx, irx_out: std_logic_vector (24 downto 0);
    signal cwx, cwx_out: std_logic_vector (30 downto 0);
    signal pcx, pcx_out: std_logic_vector (7 downto 0);
    signal jumpx: std_logic;  -- Señal de salto
    signal inmediato: std_logic_vector (7 downto 0);  -- Inmediato de 8 bits

    signal mb_out: std_logic_vector (7 downto 0);  -- Salida del multiplexor de 8 bits
    signal mpc_out: std_logic_vector (7 downto 0);  -- Salida del registro de 8 bits para el PC
    signal sum_out: std_logic_vector (7 downto 0);  -- Salida del sumador de 8 bits

    signal svx : std_logic;
    signal mux_sv: std_logic_vector(2 downto 0);
    signal cx, cnx, vx, vnx, sgx, sgnx, zx, znx: std_logic;  -- Señales de control para el multiplexor de 8 bits
    signal Sx: std_logic_vector(4 downto 0);  -- Señal de control de la unidad funcional


begin

    Reg_IR: Registro25Bits port map (irx, wir, clk, irx_out);  -- Registro de 25 bits para la instrucción
    Deco0: Deco port map (irx_out, cwx, jumpx);  -- Decodificador de la instrucción
    Reg_CW: Registro31Bits port map (cwx, wcw, clk, cwx_out);  -- Registro de 31 bits para la señal de control

    inmediato <= cwx_out(7 downto 0);  -- Inmediato de 8 bits

    Mux_mb : Mux2a18Bits port map (inmediato, "00000001", mb, mb_out);  -- Multiplexor de 8 bits
    sumador: Sumador8Bits port map (pcx_out, mb_out, '0', sum_out);  -- Suma de 8 bits
    Mux_pc: Mux2a18Bits port map (sum_out, "00000000", mpc, mpc_out);  -- Multiplexor de 8 bits para el PC
    Reg_PC: Registro8Bits port map (mpc_out, wpc, clk, pcx_out);  -- Registro de 8 bits para el PC

    Memoria: MemoriaCodigo port map (pcx_out, clk, irx);  -- Memoria de instrucciones

    Sx <= cwx_out(30 downto 26);  -- Señal de control de la unidad funcional

    mux_sv(2) <= Sx(3);
    mux_sv(1) <= Sx(1);
    mux_sv(0) <= Sx(0);

    cx <= c;
    cnx <= not(c);
    vx <= v;
    vnx <= not(v);
    sgx <= sg;
    sgnx <= not(sg);
    zx <= z;
    znx <= not(z);


    mux_sv0: Mux8a1 port map (cx, cnx, vx, vnx, sgx, sgnx, zx, znx, mux_sv, svx);  -- Multiplexor de 8 a 1 para la señal sv

    word <= cwx_out;  -- Salida de la unidad de control
    -- las señales de escritura de los registros, flip-flops y memoria de datos, solo se activan cuando la unidad de control lo indica en el estado que corresponde
    word(16) <= wcw and cwx_out(16);
    word(12) <= wcw and cwx_out(12);
    word(11) <= wcw and cwx_out(11);
    word(10) <= wcw and cwx_out(10);
    word(9) <= wcw and cwx_out(9);
    word(8) <= wcw and cwx_out(8);
    sv <= svx or (Sx(4) and Sx(3) and not(Sx(2)) and not(Sx(1)) and not(Sx(0)));  -- Salida de la señal de control sv
    jump <= jumpx;  -- Salida de la señal de salto
    


end Ar_UnidadControl_dp;



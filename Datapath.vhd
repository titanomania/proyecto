library IEEE;
use IEEE.std_logic_1164.all;

-- Datapath

entity Datapath is
    port (
        DC: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits para seleccionar el registro de entrada de la UR
        DA, DB: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits para seleccionar los registros de salida de la UR
        w: in std_logic;  -- Señal de control de 1 bit para habilitar la escritura en la UR
        clk: in std_logic;  -- Señal de reloj
        S: in std_logic_vector(4 downto 0);  -- Señal de control de 5 bits para la unidad funcional
        wc, wv, wsg, wz: in std_logic;  -- Señales de control de los bits de estado
        mi: in std_logic;  -- Señal de control la entrada B de la unidad funcional
        mdir: in std_logic;  -- Señal de control para la entrada de la memoria de datos
        wm: in std_logic;  -- Señal de control para habilitar la escritura en la memoria de datos
        mm: in std_logic;  -- Señal de control para seleccionar la entrada de datos de la UR
        inmediato: in std_logic_vector(7 downto 0);  -- Inmediato de 8 bits
        c, v, sg, z: out std_logic  -- Salidas de la unidad funcional
    );
end Datapath;

architecture Ar_Datapath of Datapath is
    component Mux2a18Bits is
        port (A, B: in std_logic_vector (7 downto 0);
              s: in std_logic;
              R: out std_logic_vector (7 downto 0));
    end component;
    component UnidadFuncional is
        port(
            A, B: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(4 downto 0);
            cin: in std_logic;
            R: out std_logic_vector(7 downto 0);
            c: out std_logic;
            v: out std_logic;
            sg: out std_logic;
            z: out std_logic
        );
    end component;

    component UnidadRegistros is
        port (
            C: in std_logic_vector(7 downto 0);  -- Entrada de 8 bits
            DA: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
            DB: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
            DC: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
            w: in std_logic;  -- Señal de control de 1 bit
            clk: in std_logic;  -- Señal de reloj
            -- mc: in std_logic;  -- Señal de control de 1 bit
            A, B: out std_logic_vector(7 downto 0)  -- Salida de 8 bits
        );
    end component;

    component Memoria is
        port (dat: in std_logic_vector (7 downto 0);
              dir: in std_logic_vector(7 downto 0);
              w, clk: in std_logic; 
              Q: out std_logic_vector (7 downto 0));
    end component;

    component FFDw is
        port (d, w, clk: in std_logic; 
              q: out std_logic);
    end component;

    signal urC: std_logic_vector(7 downto 0); -- señal de entrada de la UR
    signal urA, urB: std_logic_vector(7 downto 0); -- señales de salida de la UR

    signal ufB: std_logic_vector(7 downto 0); -- señales de entrada de la UF

    signal memDir: std_logic_vector(7 downto 0); -- señal de entrada de la memoria de datos

    signal ufCx, ufSgx, ufVx, ufZx: std_logic; -- señales de salida de la UF
    signal ufC_ffd, ufV_ffd, ufSg_ffd, ufZ_ffd: std_logic; -- señales de salida de los flip-flops de la UF

    signal salidaUF: std_logic_vector(7 downto 0); -- salida de la UF

    signal salida: std_logic_vector(7 downto 0); -- salida de la memoria de datos


begin

    -- Unidad de registros
    UR: UnidadRegistros port map (urC, DA, DB, DC, w, clk, urA, urB);

    -- Multiplexor de 2 a 1 para seleccionar la entrada B de la unidad funcional o la entrada de datos de la memoria de datos
    Mux2a1_mi: Mux2a18Bits port map (urB, inmediato, mi, ufB);

    -- Multiplexor de 2 a 1 para seleccionar la entrada de la memoria de datos (direccion de memoria)
    Mux2a1_mdir: Mux2a18Bits port map (urA, inmediato, mdir, memDir);

    -- Unidad funcional
    UF: UnidadFuncional port map (urA, ufB, S, ufC_ffd, salidaUF, ufCx, ufVx, ufSgx, ufZx);
    
    FFDw_c: FFDw port map (ufCx, wc, clk, ufC_ffd);
    FFDw_v: FFDw port map (ufVx, wv, clk, ufV_ffd);
    FFDw_sg: FFDw port map (ufSgx, wsg, clk, ufSg_ffd);
    FFDw_z: FFDw port map (ufZx, wz, clk, ufZ_ffd);


    -- Memoria de datos
    MEM: Memoria port map (ufB, memDir, wm, clk, salida);

    -- Multiplexor de 2 a 1 para seleccionar la salida de la memoria de datos o la salida de la unidad funcional
    Mux2a1_mm: Mux2a18Bits port map (salidaUF, salida, mm, urC);

    -- Salidas de la unidad funcional
    c <= ufC_ffd;
    v <= ufV_ffd;
    sg <= ufSg_ffd;
    z <= ufZ_ffd;
    
end Ar_Datapath;





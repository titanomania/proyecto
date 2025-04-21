library IEEE;
use IEEE.std_logic_1164.all;

entity UnidadControl is
    port (
        clk: in std_logic;  -- Señal de reloj
        c, v, sg, z: in std_logic;  -- Salidas de la unidad funcional
        DC: out std_logic_vector(2 downto 0);  -- Señal de control de 3 bits para seleccionar el registro de entrada de la UR
        DA, DB: out std_logic_vector(2 downto 0);  -- Señal de control de 3 bits para seleccionar los registros de salida de la UR
        w: out std_logic;  -- Señal de control de 1 bit para habilitar la escritura en la UR
        S: out std_logic_vector(4 downto 0);  -- Señal de control de 5 bits para la unidad funcional
        wc, wv, wsg, wz: out std_logic;  -- Señales de control de los bits de estado
        mi: out std_logic;  -- Señal de control la entrada B de la unidad funcional
        mdir: out std_logic;  -- Señal de control para la entrada de la memoria de datos
        wm: out std_logic;  -- Señal de control para habilitar la escritura en la memoria de datos
        mm: out std_logic;  -- Señal de control para seleccionar la entrada de datos de la UR
        inmediato: out std_logic_vector(7 downto 0)  -- Inmediato de 8 bits
    );
end UnidadControl;


architecture Ar_UnidadControl of UnidadControl is
    component UnidadControl_dp is
        port (
            mb: in std_logic;
            mpc: in std_logic;
            wir, wcw, wpc: in std_logic;  -- Señales de control de escritura para los registros de 8, 22 y 31 bits
            clk: in std_logic;  -- Señal de reloj
            c, v, sg, z: in std_logic;  -- Salidas de la unidad funcional
            word: out std_logic_vector(30 downto 0);
            jump, sv: out std_logic
        );
    end component;

    component UnidadControl_uc is
        port (
            sv: in std_logic;  -- Señal de control de la unidad funcional
            jump: in std_logic;  -- Señal de salto
            clk: in std_logic;  -- Señal de reloj
            mb: out std_logic;
            mpc: out std_logic;
            wir, wcw, wpc: out std_logic  -- Señales de control de escritura para los registros de 8, 22 y 31 bits
        );
    end component;

    signal mbx, mpcx, wirx, wcwx, wpcx: std_logic; -- señales de control de escritura para los registros de 8, 22 y 31 bits
    signal jump, sv: std_logic;  -- Señales de control de salto y de la unidad funcional
    signal word: std_logic_vector(30 downto 0);  -- Señal de control de 5 bits para la unidad funcional
begin

    -- Instanciación de la unidad de control de datos
    UC_dp: UnidadControl_dp port map(mbx, mpcx, wirx, wcwx, wpcx, clk, c, v, sg, z, word, jump, sv);

    UC_uc: UnidadControl_uc port map(sv, jump, clk, mbx, mpcx, wirx, wcwx, wpcx);

    S <= word(30 downto 26);  -- Asignación de la señal de control de 5 bits para la unidad funcional
    DC <= word(25 downto 23);  -- Asignación de la señal de control de 3 bits para seleccionar el registro de entrada de la UR
    DA <= word(22 downto 20);  -- Asignación de la señal de control de 3 bits para seleccionar el registro de salida de la UR
    DB <= word(19 downto 17);  -- Asignación de la señal de control de 3 bits para seleccionar el registro de salida de la UR
    w <= word(16);  -- Asignación de la señal de control de 1 bit para habilitar la escritura en la UR
    mi <= word(15);  -- Asignación de la señal de control para la entrada B de la unidad funcional
    mdir <= word(14);  -- Asignación de la señal de control para la entrada de la memoria de datos
    mm <= word(13);  -- Asignación de la señal de control para seleccionar la entrada de datos de la UR
    wm <= word(12);  -- Asignación de la señal de control para habilitar la escritura en la memoria de datos
    wc <= word(11);  -- Asignación de la señal de control para habilitar la escritura en el registro de estado
    wv <= word(10);  -- Asignación de la señal de control para habilitar la escritura en el registro de estado
    wsg <= word(9);  -- Asignación de la señal de control para habilitar la escritura en el registro de estado
    wz <= word(8);  -- Asignación de la señal de control para habilitar la escritura en el registro de estado
    inmediato <= word(7 downto 0);  -- Asignación del inmediato de 8 bits


end Ar_UnidadControl;



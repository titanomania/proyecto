library IEEE;
use IEEE.std_logic_1164.all;

entity Circuito_tb is
end Circuito_tb;

architecture Ar_Circuito_tb of Circuito_tb is

    component Datapath is
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
    end component;

    component UnidadControl is
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
    end component;

    signal clk: std_logic := '0';  -- Señal de reloj
    signal Sx: std_logic_vector(4 downto 0);  -- Señal de control de 5 bits para la unidad funcional
    signal DAx, DBx, DCx: std_logic_vector(2 downto 0);  -- Señal de control de 3 bits para seleccionar los registros de salida de la UR
    signal wx: std_logic;  -- Señal de control de 1 bit para habilitar la escritura en la UR
    signal mix, mdirx, mmx: std_logic;
    signal wmx: std_logic;  -- Señal de control para habilitar la escritura en la memoria de datos
    signal wcx, wvx, wsgx, wzx: std_logic;  -- Señales de control de los bits de estado
    signal inmediatox: std_logic_vector(7 downto 0);  -- Inmediato de 8 bits

    signal c, v, sg, z: std_logic;  -- Salidas de la unidad funcional

begin
    -- Instanciación de los componentes
    DP: Datapath port map(DCx, DAx, DBx, wx, clk, Sx, wcx, wvx, wsgx, wzx, mix, mdirx, wmx, mmx, inmediatox, c, v, sg, z);
    UC: UnidadControl port map(clk, c, v, sg, z, DCx, DAx, DBx, wx, Sx, wcx, wvx, wsgx, wzx, mix, mdirx, wmx, mmx, inmediatox);


    process
    variable clk_count: integer := 0;  -- Contador para los flancos de reloj
    begin
        -- Generación del reloj
        while clk_count < 150 loop  -- Limitar flancos
            clk <= '1';
            wait for 5 ns;  -- Flanco de bajada
            clk <= '0';
            wait for 5 ns;  -- Flanco de subida
            clk_count := clk_count + 1;
        end loop;
        
        -- Fin de la simulación después de 20 flancos
        wait;
    end process;

process
    begin   
        

        wait for 10 ns;

        wait;

    end process;



end Ar_Circuito_tb;
library IEEE;
use IEEE.std_logic_1164.all;

-- Unidad Funcional
-- La unidad funcional realiza operaciones aritméticas, lógicas y de desplazamiento
-- sobre dos operandos de 8 bits A y B, y una señal de control de 5 bits S.
-- Las operaciones que realiza son:
-- 00000 -> A + B
-- 00001 -> A - B
-- 00010 -> A++
-- 00011 -> A--
-- 00100 -> B++
-- 00101 -> B--
-- 00110 -> TRANSFERENCIA A
-- 00111 -> TRANSFERENCIA B
-- 01000 -> A and B
-- 01001 -> A or B
-- 01010 -> not A
-- 01011 -> not B
-- 01100 -> A xor B
-- 01101 -> not (A and B)
-- 01110 -> not (A or B)
-- 01111 -> not (A xor B)
-- 10000 -> <-- desplazamiento a la izquierda
-- 10001 -> --> desplazamiento a la derecha
-- 10010 -> rotación a la izquierda
-- 10011 -> rotación a la derecha


entity UnidadFuncional is
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
end UnidadFuncional;

architecture Ar_UnidadFuncional of UnidadFuncional is 
    component ALU is
        port (
            A, B: in std_logic_vector(7 downto 0);
            cin: in std_logic;
            S: in std_logic_vector(4 downto 0);
            R: out std_logic_vector(7 downto 0);
            c: out std_logic;
            v: out std_logic;
            sg: out std_logic;
            z: out std_logic
        );
    end component;

    component Shifter is
        port (
            d: in std_logic_vector(7 downto 0);     -- Entrada de 8 bits
            S: in std_logic_vector(1 downto 0);     -- Señal de control
            q: out std_logic_vector(7 downto 0);    -- Salida de 8 bits
            c_shl: out std_logic;                   -- Acarreo por SHL
            c_shr: out std_logic                    -- Acarreo por SHR
        );
    end component;

    component Mux2a18Bits is
        port (A, B: in std_logic_vector (7 downto 0);
              s: in std_logic;
              R: out std_logic_vector (7 downto 0));
    end component;
    component Mux2a1 
     port (a, b, s: in std_logic;
           r: out std_logic);
    end component;

    signal RxALU, RxS, Rx: std_logic_vector(7 downto 0); -- señales de salida de ALU y Shifter, y salida de la UF
    signal cALU, vALU, sgALU, zALU: std_logic; -- señales de salida de ALU
    signal cIzqShifter, cDerShifter, cShifter: std_logic; -- señales de salida de Shifter
    signal cx: std_logic;

    signal c_shl, c_shr: std_logic; -- acarreos de Shifter

    signal SMaSg: std_logic; -- Bit mas significativo de la señal de control S
    signal S_ALU: std_logic_vector(4 downto 0); -- Señal de control de ALU
    signal S_Shifter: std_logic_vector(1 downto 0); -- Señal de control de Shifter

begin
    SMaSg <= S(4);
    S_ALU <= S;
    S_Shifter <= S(1 downto 0);

    ALU1: ALU port map(A, B, cin, S_ALU, RxALU, cALU, vALU, sgALU, zALU);
    Shifter1: Shifter port map(A, S_Shifter, RxS, cIzqShifter, cDerShifter);

    Mux2a18Bits1: Mux2a18Bits port map(RxALU, RxS, SMaSg, Rx); -- selecciona entre la salida de ALU y Shifter

    Mux2a1_1: Mux2a1 port map(cIzqShifter, cDerShifter, S_Shifter(0), cShifter); -- selecciona entre los acarreos de Shifter
    Mux2a1_2: Mux2a1 port map(cALU, cShifter, SMaSg, cx); -- selecciona entre el acarreo de ALU y Shifter
    
    R <= Rx;
    c <= cx;
    v <= vALU;
    sg <= sgALU;
    z <= zALU;

end Ar_UnidadFuncional;
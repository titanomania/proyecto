library IEEE;
use IEEE.std_logic_1164.all;

-- ALU
-- La ALU realiza operaciones aritméticas y lógicas
-- sobre dos operandos de 8 bits A y B, y una señal de control de 4 bits S.
-- Las operaciones que realiza son:
-- 0000 -> A + B
-- 0001 -> A - B
-- 0010 -> A++
-- 0011 -> A--
-- 0100 -> B++
-- 0101 -> B--
-- 0110 -> TRANSFERENCIA A
-- 0111 -> TRANSFERENCIA B
-- 1000 -> A and B
-- 1001 -> A or B
-- 1010 -> not A
-- 1011 -> not B
-- 1100 -> A xor B
-- 1101 -> not (A and B)
-- 1110 -> not (A or B)
-- 1111 -> not (A xor B)
-- La salida de la ALU es R de 8 bits, el acarreo de salida c,
-- el overflow v, el signo s y el cero z.

entity ALU is
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
end ALU;

architecture Ar_ALU of ALU is
    component UnidadAritmetica is
        port (
            A, B: in std_logic_vector(7 downto 0);  -- Entrada de 8 bits
            S: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
            cin: in std_logic;  -- acarreo de entrada
            R: out std_logic_vector(7 downto 0);  -- Salida de 8 bits
            c: out std_logic;  -- acarreo de salida
            v: out std_logic;  -- overflow
            sg: out std_logic;  -- signo
            z: out std_logic  -- cero
        );
    end component;
    component UnidadLogica is
        port (
            A, B: in std_logic_vector(7 downto 0);  -- Entrada de 8 bits
            S: in std_logic_vector(2 downto 0);  -- Señal de control de 3 bits
            R: out std_logic_vector(7 downto 0);  -- Salida de 8 bits
            z: out std_logic;  -- cero
            sg: out std_logic  -- signo
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

    signal RxUA, RxUL, Rx: std_logic_vector(7 downto 0);
    signal ZxUA, ZxUL, Zx: std_logic; -- señales de cero, para la unidad aritmética y lógica
    signal SgxUA, SgxUL, Sgx: std_logic; -- señales de signo, para la unidad aritmética y lógica

    signal cx, vx: std_logic; -- acarreo y overflow de la unidad aritmética

    signal S3: std_logic; -- Bit mas significativo de la señal de control S
    signal S2_0: std_logic_vector(2 downto 0); -- Bits menos significativos de la señal de control S

    signal Szx: std_logic; -- señal de cero
begin

    -- Separar la señal de control S, para poder usarla en las unidades aritmética y lógica más facilmente
    S3 <= S(3);
    S2_0(2) <= S(2);
    S2_0(1) <= S(1);
    S2_0(0) <= S(0);

    -- Unidad aritmética
    UA: UnidadAritmetica port map (A, B, S2_0, cin, RxUA, cx, vx, SgxUA, ZxUA);

    -- Unidad lógica
    UL: UnidadLogica port map (A, B, S2_0, RxUL, ZxUL, SgxUL);

    Szx <= S3 and not(S(4) and S(3) and not(S(2)) and not(S(1)) and S(0));

    -- Multiplexor de 2 a 1 para seleccionar entre la salida de la unidad aritmética y la unidad lógica
    Mux2a18: Mux2a18Bits port map    (RxUA, RxUL, S3, Rx); -- Seleccionar entre la salida de la UA y la UL 
    Mux2a1Bit_signo: Mux2a1 port map (SgxUA, SgxUL, S3, Sgx); -- Seleccionar entre el signo de la UA y la UL
    Mux2a1Bit_zero:  Mux2a1 port map (ZxUA, ZxUL, Szx, Zx); -- Seleccionar entre el cero de la UA y la UL

    R <= Rx;
    c <= cx;
    v <= vx;
    sg <= Sgx;
    z <= Zx;


end Ar_ALU;

library IEEE;
use IEEE.std_logic_1164.all;


-- Unidad Aritmetica
-- La unidad aritmetica realiza operaciones aritmeticas
-- sobre dos operandos de 8 bits A y B, y una señal de control de 3 bits S.
-- Las operaciones que realiza son:
-- 000 -> A + B
-- 001 -> A - B
-- 010 -> A++
-- 011 -> A--
-- 100 -> TRANSFERENCIA A
-- 101 -> TRANSFERENCIA B
-- 110 -> A + B + Acarreo
-- 111 -> B++
-- La salida de la unidad aritmetica es R de 8 bits, el acarreo de salida c,
-- el overflow v, el signo s y el cero z.



entity UnidadAritmetica is
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
end UnidadAritmetica;


architecture Ar_UnidadAritmetica of UnidadAritmetica is
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

    signal Ax, Bx, Rx: std_logic_vector(7 downto 0);
    signal Cinx, Coutx, vx, sx, zx: std_logic;

begin

    Cinx <= (not(S(2)) and S(1) and not(S(0)))      or
            (S(2) and S(1)      and S(0)) or
            (S(2)      and S(1) and not(S(0)) and cin) or
            (not(S(2)) and not(S(1)) and S(0));

    Ax(0) <= (not(S(1)) and not(S(0)) and A(0)) or (not(S(2)) and A(0)) or (S(1) and not(S(0)) and A(0));
    Ax(1) <= (not(S(1)) and not(S(0)) and A(1)) or (not(S(2)) and A(1)) or (S(1) and not(S(0)) and A(1));
    Ax(2) <= (not(S(1)) and not(S(0)) and A(2)) or (not(S(2)) and A(2)) or (S(1) and not(S(0)) and A(2));
    Ax(3) <= (not(S(1)) and not(S(0)) and A(3)) or (not(S(2)) and A(3)) or (S(1) and not(S(0)) and A(3));
    Ax(4) <= (not(S(1)) and not(S(0)) and A(4)) or (not(S(2)) and A(4)) or (S(1) and not(S(0)) and A(4));
    Ax(5) <= (not(S(1)) and not(S(0)) and A(5)) or (not(S(2)) and A(5)) or (S(1) and not(S(0)) and A(5));
    Ax(6) <= (not(S(1)) and not(S(0)) and A(6)) or (not(S(2)) and A(6)) or (S(1) and not(S(0)) and A(6));
    Ax(7) <= (not(S(1)) and not(S(0)) and A(7)) or (not(S(2)) and A(7)) or (S(1) and not(S(0)) and A(7));

    

    Bx(0) <= (S(2) and B(0)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(0)) or (not(S(2))  and not(S(1)) and S(0) and not(B(0))) or (not(S(2)) and S(1) and S(0));
    Bx(1) <= (S(2) and B(1)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(1)) or (not(S(2))  and not(S(1)) and S(0) and not(B(1))) or (not(S(2)) and S(1) and S(0));
    Bx(2) <= (S(2) and B(2)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(2)) or (not(S(2))  and not(S(1)) and S(0) and not(B(2))) or (not(S(2)) and S(1) and S(0));
    Bx(3) <= (S(2) and B(3)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(3)) or (not(S(2))  and not(S(1)) and S(0) and not(B(3))) or (not(S(2)) and S(1) and S(0));
    Bx(4) <= (S(2) and B(4)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(4)) or (not(S(2))  and not(S(1)) and S(0) and not(B(4))) or (not(S(2)) and S(1) and S(0));
    Bx(5) <= (S(2) and B(5)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(5)) or (not(S(2))  and not(S(1)) and S(0) and not(B(5))) or (not(S(2)) and S(1) and S(0));
    Bx(6) <= (S(2) and B(6)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(6)) or (not(S(2))  and not(S(1)) and S(0) and not(B(6))) or (not(S(2)) and S(1) and S(0));
    Bx(7) <= (S(2) and B(7)) or (not(S(2)) and not(S(1)) and not(S(0)) and B(7)) or (not(S(2))  and not(S(1)) and S(0) and not(B(7))) or (not(S(2)) and S(1) and S(0));




    
    Sumador0: Sumador8Bits port map (Ax, Bx, Cinx, Rx, Coutx, vx, sx, zx);

    R <= Rx;
    c <= Coutx;
    v <= vx;
    sg <= sx;
    z <= zx;

end Ar_UnidadAritmetica;
library IEEE;
use IEEE.std_logic_1164.all;

entity Deco is 
    port (wordMem: in std_logic_vector (24 downto 0);  -- 25 bits de la memoria de instrucciones
          word: out std_logic_vector (30 downto 0); -- 31 bits de la memoria de instrucciones
          jump: out std_logic); -- señal de salto
end Deco;

architecture Ar_Deco of Deco is
    signal DC, DA, DB: std_logic_vector (2 downto 0); 
    signal w: std_logic;
    signal S: std_logic_vector (4 downto 0);
    signal mi, mm, wm, mdir: std_logic;
    signal inmediato: std_logic_vector (7 downto 0);
    signal j: std_logic;
    signal wc, wv, wsg, wz: std_logic;

    -- modos de direccionamiento
    signal md1: std_logic_vector(1 downto 0);
    signal md2: std_logic;

begin

    S <= wordMem(24 downto 20);
    DC <= wordMem(19 downto 17);
    DA <= wordMem(16 downto 14);
    DB <= wordMem(13 downto 11);
    md1 <= wordMem(10 downto 9);
    md2 <= wordMem(8);
    inmediato <= wordMem(7 downto 0);
    

    mm <= md1(1) xor md1(0);
    mdir <= md1(1) and not(md1(0));
    mi <= md2 and not(mdir);

    wm <= S(4) and S(3) and not(S(2)) and S(1) and not(S(0));

    wc <= (not(S(4)) and not(S(3)) and not(S(2)) and not(S(0))) or (not(S(4)) and not(S(3)) and S(2) and S(1)) or (S(4) and not(S(3)) and not(S(2)) and not(S(1)));
    wsg <= (not(S(4)) and S(3)) or (not(S(4)) and not(S(2)) and S(0));
    wz <= (not(S(4)) and not(S(2))) or (not(S(4)) and S(1)) or (not(S(4)) and S(3)) or (S(3) and not(S(2)) and not(S(1)) and S(0));
    wv <= (not(S(4)) and not(S(3)) and not(S(2)));

    w <= (not(S(4))) or (S(4) and not(S(3)) and not(S(2))) or (S(4) and S(3) and not(S(2)) and S(1) and S(0));

    j <= (S(4) and S(2)) or (S(4) and S(3) and not(S(1)) and not(S(0)));

    -- Asignación de las señales de control a la salida word
    word(30 downto 26) <= S;
    word(25 downto 23) <= DC;
    word(22 downto 20) <= DA;
    word(19 downto 17) <= DB;
    word(16) <= w;
    word(15) <= mi;
    word(14) <= mdir;
    word(13) <= mm;
    word(12) <= wm;
    word(11) <= wc;
    word(10) <= wv;
    word(9) <= wsg;
    word(8) <= wz;
    word(7 downto 0) <= inmediato;

    jump <= j; -- Asignación de la señal de salto a la salida word
    
end Ar_Deco;
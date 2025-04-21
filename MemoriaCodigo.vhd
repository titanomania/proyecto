library IEEE;
use IEEE.std_logic_1164.all;

entity MemoriaCodigo is
  port (dir: in std_logic_vector(7 downto 0);
        clk: in std_logic; 
        Q: out std_logic_vector (24 downto 0));
end MemoriaCodigo;

architecture Ar_MemoriaCodigo of MemoriaCodigo is

  component Registro25Bits is
    port (D: in std_logic_vector (24 downto 0); 
          w, clk: in std_logic; 
          Q: out std_logic_vector (24 downto 0));
  end component;

  component Deco8a256 is
    port (
      S: in std_logic_vector(7 downto 0);
      d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15,
            d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31,
            d32, d33, d34, d35, d36, d37, d38, d39, d40, d41, d42, d43, d44, d45, d46, d47,
            d48, d49, d50, d51, d52, d53, d54, d55, d56, d57, d58, d59, d60, d61, d62, d63,
            d64, d65, d66, d67, d68, d69, d70, d71, d72, d73, d74, d75, d76, d77, d78, d79,
            d80, d81, d82, d83, d84, d85, d86, d87, d88, d89, d90, d91, d92, d93, d94, d95,
            d96, d97, d98, d99, d100, d101, d102, d103, d104, d105, d106, d107, d108, d109, d110, d111,
            d112, d113, d114, d115, d116, d117, d118, d119, d120, d121, d122, d123, d124, d125, d126, d127,
            d128, d129, d130, d131, d132, d133, d134, d135, d136, d137, d138, d139, d140, d141, d142, d143,
            d144, d145, d146, d147, d148, d149, d150, d151, d152, d153, d154, d155, d156, d157, d158, d159,
            d160, d161, d162, d163, d164, d165, d166, d167, d168, d169, d170, d171, d172, d173, d174, d175,
            d176, d177, d178, d179, d180, d181, d182, d183, d184, d185, d186, d187, d188, d189, d190, d191,
            d192, d193, d194, d195, d196, d197, d198, d199, d200, d201, d202, d203, d204, d205, d206, d207,
            d208, d209, d210, d211, d212, d213, d214, d215, d216, d217, d218, d219, d220, d221, d222, d223,
            d224, d225, d226, d227, d228, d229, d230, d231, d232, d233, d234, d235, d236, d237, d238, d239,
            d240, d241, d242, d243, d244, d245, d246, d247, d248, d249, d250, d251, d252, d253, d254, d255: out std_logic
    );
  end component;

  component Mux256a125Bits is
    port (
        d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15,
        d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31,
        d32, d33, d34, d35, d36, d37, d38, d39, d40, d41, d42, d43, d44, d45, d46, d47,
        d48, d49, d50, d51, d52, d53, d54, d55, d56, d57, d58, d59, d60, d61, d62, d63,
        d64, d65, d66, d67, d68, d69, d70, d71, d72, d73, d74, d75, d76, d77, d78, d79,
        d80, d81, d82, d83, d84, d85, d86, d87, d88, d89, d90, d91, d92, d93, d94, d95,
        d96, d97, d98, d99, d100, d101, d102, d103, d104, d105, d106, d107, d108, d109, d110, d111,
        d112, d113, d114, d115, d116, d117, d118, d119, d120, d121, d122, d123, d124, d125, d126, d127,
        d128, d129, d130, d131, d132, d133, d134, d135, d136, d137, d138, d139, d140, d141, d142, d143,
        d144, d145, d146, d147, d148, d149, d150, d151, d152, d153, d154, d155, d156, d157, d158, d159,
        d160, d161, d162, d163, d164, d165, d166, d167, d168, d169, d170, d171, d172, d173, d174, d175,
        d176, d177, d178, d179, d180, d181, d182, d183, d184, d185, d186, d187, d188, d189, d190, d191,
        d192, d193, d194, d195, d196, d197, d198, d199, d200, d201, d202, d203, d204, d205, d206, d207,
        d208, d209, d210, d211, d212, d213, d214, d215, d216, d217, d218, d219, d220, d221, d222, d223,
        d224, d225, d226, d227, d228, d229, d230, d231, d232, d233, d234, d235, d236, d237, d238, d239,
        d240, d241, d242, d243, d244, d245, d246, d247, d248, d249, d250, d251, d252, d253, d254, d255: in std_logic_vector(24 downto 0);
        S: in std_logic_vector(7 downto 0);
        r: out std_logic_vector(24 downto 0)
    );
  end component;


  signal Ax, Cx: std_logic_vector(24 downto 0);
  signal D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15,
    D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31,
    D32, D33, D34, D35, D36, D37, D38, D39, D40, D41, D42, D43, D44, D45, D46, D47,
    D48, D49, D50, D51, D52, D53, D54, D55, D56, D57, D58, D59, D60, D61, D62, D63,
    D64, D65, D66, D67, D68, D69, D70, D71, D72, D73, D74, D75, D76, D77, D78, D79,
    D80, D81, D82, D83, D84, D85, D86, D87, D88, D89, D90, D91, D92, D93, D94, D95,
    D96, D97, D98, D99, D100, D101, D102, D103, D104, D105, D106, D107, D108, D109, D110, D111,
    D112, D113, D114, D115, D116, D117, D118, D119, D120, D121, D122, D123, D124, D125, D126, D127,
    D128, D129, D130, D131, D132, D133, D134, D135, D136, D137, D138, D139, D140, D141, D142, D143,
    D144, D145, D146, D147, D148, D149, D150, D151, D152, D153, D154, D155, D156, D157, D158, D159,
    D160, D161, D162, D163, D164, D165, D166, D167, D168, D169, D170, D171, D172, D173, D174, D175,
    D176, D177, D178, D179, D180, D181, D182, D183, D184, D185, D186, D187, D188, D189, D190, D191,
    D192, D193, D194, D195, D196, D197, D198, D199, D200, D201, D202, D203, D204, D205, D206, D207,
    D208, D209, D210, D211, D212, D213, D214, D215, D216, D217, D218, D219, D220, D221, D222, D223,
    D224, D225, D226, D227, D228, D229, D230, D231, D232, D233, D234, D235, D236, D237, D238, D239,
    D240, D241, D242, D243, D244, D245, D246, D247, D248, D249, D250, D251, D252, D253, D254, D255: std_logic; -- señales de salida de Deco256a18Bits


  signal D0w, D1w, D2w, D3w, D4w, D5w, D6w, D7w, D8w, D9w, D10w, D11w, D12w, D13w, D14w, D15w,
      D16w, D17w, D18w, D19w, D20w, D21w, D22w, D23w, D24w, D25w, D26w, D27w, D28w, D29w, D30w, D31w,
      D32w, D33w, D34w, D35w, D36w, D37w, D38w, D39w, D40w, D41w, D42w, D43w, D44w, D45w, D46w, D47w,
      D48w, D49w, D50w, D51w, D52w, D53w, D54w, D55w, D56w, D57w, D58w, D59w, D60w, D61w, D62w, D63w,
      D64w, D65w, D66w, D67w, D68w, D69w, D70w, D71w, D72w, D73w, D74w, D75w, D76w, D77w, D78w, D79w,
      D80w, D81w, D82w, D83w, D84w, D85w, D86w, D87w, D88w, D89w, D90w, D91w, D92w, D93w, D94w, D95w,
      D96w, D97w, D98w, D99w, D100w, D101w, D102w, D103w, D104w, D105w, D106w, D107w, D108w, D109w, D110w, D111w,
      D112w, D113w, D114w, D115w, D116w, D117w, D118w, D119w, D120w, D121w, D122w, D123w, D124w, D125w, D126w, D127w,
      D128w, D129w, D130w, D131w, D132w, D133w, D134w, D135w, D136w, D137w, D138w, D139w, D140w, D141w, D142w, D143w,
      D144w, D145w, D146w, D147w, D148w, D149w, D150w, D151w, D152w, D153w, D154w, D155w, D156w, D157w, D158w, D159w,
      D160w, D161w, D162w, D163w, D164w, D165w, D166w, D167w, D168w, D169w, D170w, D171w, D172w, D173w, D174w, D175w,
      D176w, D177w, D178w, D179w, D180w, D181w, D182w, D183w, D184w, D185w, D186w, D187w, D188w, D189w, D190w, D191w,
      D192w, D193w, D194w, D195w, D196w, D197w, D198w, D199w, D200w, D201w, D202w, D203w, D204w, D205w, D206w, D207w,
      D208w, D209w, D210w, D211w, D212w, D213w, D214w, D215w, D216w, D217w, D218w, D219w, D220w, D221w, D222w, D223w,
      D224w, D225w, D226w, D227w, D228w, D229w, D230w, D231w, D232w, D233w, D234w, D235w, D236w, D237w, D238w, D239w,
      D240w, D241w, D242w, D243w, D244w, D245w, D246w, D247w, D248w, D249w, D250w, D251w, D252w, D253w, D254w, D255w: std_logic; -- señales de salida de Registro25Bits
  
  signal Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x, Reg8x, Reg9x, Reg10x, Reg11x, Reg12x, Reg13x, Reg14x, Reg15x,
      Reg16x, Reg17x, Reg18x, Reg19x, Reg20x, Reg21x, Reg22x, Reg23x, Reg24x, Reg25x, Reg26x, Reg27x, Reg28x, Reg29x, Reg30x, Reg31x,
      Reg32x, Reg33x, Reg34x, Reg35x, Reg36x, Reg37x, Reg38x, Reg39x, Reg40x, Reg41x, Reg42x, Reg43x, Reg44x, Reg45x, Reg46x, Reg47x,
      Reg48x, Reg49x, Reg50x, Reg51x, Reg52x, Reg53x, Reg54x, Reg55x, Reg56x, Reg57x, Reg58x, Reg59x, Reg60x, Reg61x, Reg62x, Reg63x,
      Reg64x, Reg65x, Reg66x, Reg67x, Reg68x, Reg69x, Reg70x, Reg71x, Reg72x, Reg73x, Reg74x, Reg75x, Reg76x, Reg77x, Reg78x, Reg79x,
      Reg80x, Reg81x, Reg82x, Reg83x, Reg84x, Reg85x, Reg86x, Reg87x, Reg88x, Reg89x, Reg90x, Reg91x, Reg92x, Reg93x, Reg94x, Reg95x,
      Reg96x, Reg97x, Reg98x, Reg99x, Reg100x, Reg101x, Reg102x, Reg103x, Reg104x, Reg105x, Reg106x, Reg107x, Reg108x, Reg109x, Reg110x, Reg111x,
      Reg112x, Reg113x, Reg114x, Reg115x, Reg116x, Reg117x, Reg118x, Reg119x, Reg120x, Reg121x, Reg122x, Reg123x, Reg124x, Reg125x, Reg126x, Reg127x,
      Reg128x, Reg129x, Reg130x, Reg131x, Reg132x, Reg133x, Reg134x, Reg135x, Reg136x, Reg137x, Reg138x, Reg139x, Reg140x, Reg141x, Reg142x, Reg143x,
      Reg144x, Reg145x, Reg146x, Reg147x, Reg148x, Reg149x, Reg150x, Reg151x, Reg152x, Reg153x, Reg154x, Reg155x, Reg156x, Reg157x, Reg158x, Reg159x,
      Reg160x, Reg161x, Reg162x, Reg163x, Reg164x, Reg165x, Reg166x, Reg167x, Reg168x, Reg169x, Reg170x, Reg171x, Reg172x, Reg173x, Reg174x, Reg175x,
      Reg176x, Reg177x, Reg178x, Reg179x, Reg180x, Reg181x, Reg182x, Reg183x, Reg184x, Reg185x, Reg186x, Reg187x, Reg188x, Reg189x, Reg190x, Reg191x,
      Reg192x, Reg193x, Reg194x, Reg195x, Reg196x, Reg197x, Reg198x, Reg199x, Reg200x, Reg201x, Reg202x, Reg203x, Reg204x, Reg205x, Reg206x, Reg207x,
      Reg208x, Reg209x, Reg210x, Reg211x, Reg212x, Reg213x, Reg214x, Reg215x, Reg216x, Reg217x, Reg218x, Reg219x, Reg220x, Reg221x, Reg222x, Reg223x,
      Reg224x, Reg225x, Reg226x, Reg227x, Reg228x, Reg229x, Reg230x, Reg231x, Reg232x, Reg233x, Reg234x, Reg235x, Reg236x, Reg237x, Reg238x, Reg239x,
      Reg240x, Reg241x, Reg242x, Reg243x, Reg244x, Reg245x, Reg246x, Reg247x, Reg248x, Reg249x, Reg250x, Reg251x, Reg252x, Reg253x, Reg254x, Reg255x: std_logic_vector(24 downto 0); -- señales de salida de Registro25Bits


  signal dat: std_logic_vector(24 downto 0); -- señal de salida de la memoria de instrucciones
    signal Dw: std_logic;

  begin
    Dw <= '1'; -- señal de escritura de la memoria de instrucciones
    
    
    
    dat <= "1100100000000000000000000"; -- Inicializa la señal de salida de la memoria de instrucciones
    Reg0: Registro25Bits port map ("0010100000000000100000011", Dw, clk, Reg0x); -- carga 3 en el registro 0
    Reg1: Registro25Bits port map ("0010100100000000100000011", Dw, clk, Reg1x); -- carga 3 en el registro 1
    Reg2: Registro25Bits port map ("1100100000000100000000000", Dw, clk, Reg2x); -- hace la comparacion de los registros 0 y 1
    Reg3: Registro25Bits port map ("1101000000000110000000000", Dw, clk, Reg3x); -- carga el valor del registro1 en la direccion [0x00] de la memoria de datos
    Reg4: Registro25Bits port map ("0000010000000100000000000", Dw, clk, Reg4x); -- hace la suma de los registros 0 y 1 y carga el resultado en el registro 4
    Reg5: Registro25Bits port map ("0010100100000000110000000", Dw, clk, Reg5x); -- carga 128 en el registro 1
    Reg6: Registro25Bits port map ("0000001000100000110000000", Dw, clk, Reg6x); -- hace la suma del registro 1 y 129 y carga el resultado en el registro 2
    Reg7: Registro25Bits port map ("1010000000000000100000011", Dw, clk, Reg7x); -- Si el acarreo es 1, salta a la direccion 0x0A
    Reg8: Registro25Bits port map ("0011001001000000100001111", Dw, clk, Reg8x); -- hace una suma con acarreo
    Reg9: Registro25Bits port map ("1100000000000000100000010", Dw, clk, Reg9x); -- hace un salto en +2 (al registro 11)
    Reg10: Registro25Bits port map ("1100000000000000111111110", Dw, clk, Reg10x); -- hace un salto en -2 (al registro 8)
    Reg11: Registro25Bits port map ("0010111000000000110000100", Dw, clk, Reg11x); -- carga 132 en el registro 6 
    Reg12: Registro25Bits port map ("1000011011000000000000000", Dw, clk, Reg12x); -- hace un desplazamiento a la izquierda sobre el registro 6
    Reg13: Registro25Bits port map ("1101000000011001000000000", Dw, clk, Reg13x); -- carga el valor del registro 6 en la direccion [Reg0] de la memoria de datos
    Reg14: Registro25Bits port map ("1101100100000010000000011", Dw, clk, Reg14x);
    Reg15: Registro25Bits port map (dat, Dw, clk, Reg15x);
    Reg16: Registro25Bits port map (dat, Dw, clk, Reg16x);
    Reg17: Registro25Bits port map (dat, Dw, clk, Reg17x);
    Reg18: Registro25Bits port map (dat, Dw, clk, Reg18x);
    Reg19: Registro25Bits port map (dat, Dw, clk, Reg19x);
    Reg20: Registro25Bits port map (dat, Dw, clk, Reg20x);
    Reg21: Registro25Bits port map (dat, Dw, clk, Reg21x);
    Reg22: Registro25Bits port map (dat, Dw, clk, Reg22x);
    Reg23: Registro25Bits port map (dat, Dw, clk, Reg23x);
    Reg24: Registro25Bits port map (dat, Dw, clk, Reg24x);
    Reg25: Registro25Bits port map (dat, Dw, clk, Reg25x);
    Reg26: Registro25Bits port map (dat, Dw, clk, Reg26x);
    Reg27: Registro25Bits port map (dat, Dw, clk, Reg27x);
    Reg28: Registro25Bits port map (dat, Dw, clk, Reg28x);
    Reg29: Registro25Bits port map (dat, Dw, clk, Reg29x);
    Reg30: Registro25Bits port map (dat, Dw, clk, Reg30x);
    Reg31: Registro25Bits port map (dat, Dw, clk, Reg31x);
    Reg32: Registro25Bits port map (dat, Dw, clk, Reg32x);
    Reg33: Registro25Bits port map (dat, Dw, clk, Reg33x);
    Reg34: Registro25Bits port map (dat, Dw, clk, Reg34x);
    Reg35: Registro25Bits port map (dat, Dw, clk, Reg35x);
    Reg36: Registro25Bits port map (dat, Dw, clk, Reg36x);
    Reg37: Registro25Bits port map (dat, Dw, clk, Reg37x);
    Reg38: Registro25Bits port map (dat, Dw, clk, Reg38x);
    Reg39: Registro25Bits port map (dat, Dw, clk, Reg39x);
    Reg40: Registro25Bits port map (dat, Dw, clk, Reg40x);
    Reg41: Registro25Bits port map (dat, Dw, clk, Reg41x);
    Reg42: Registro25Bits port map (dat, Dw, clk, Reg42x);
    Reg43: Registro25Bits port map (dat, Dw, clk, Reg43x);
    Reg44: Registro25Bits port map (dat, Dw, clk, Reg44x);
    Reg45: Registro25Bits port map (dat, Dw, clk, Reg45x);
    Reg46: Registro25Bits port map (dat, Dw, clk, Reg46x);
    Reg47: Registro25Bits port map (dat, Dw, clk, Reg47x);
    Reg48: Registro25Bits port map (dat, Dw, clk, Reg48x);
    Reg49: Registro25Bits port map (dat, Dw, clk, Reg49x);
    Reg50: Registro25Bits port map (dat, Dw, clk, Reg50x);
    Reg51: Registro25Bits port map (dat, Dw, clk, Reg51x);
    Reg52: Registro25Bits port map (dat, Dw, clk, Reg52x);
    Reg53: Registro25Bits port map (dat, Dw, clk, Reg53x);
    Reg54: Registro25Bits port map (dat, Dw, clk, Reg54x);
    Reg55: Registro25Bits port map (dat, Dw, clk, Reg55x);
    Reg56: Registro25Bits port map (dat, Dw, clk, Reg56x);
    Reg57: Registro25Bits port map (dat, Dw, clk, Reg57x);
    Reg58: Registro25Bits port map (dat, Dw, clk, Reg58x);
    Reg59: Registro25Bits port map (dat, Dw, clk, Reg59x);
    Reg60: Registro25Bits port map (dat, Dw, clk, Reg60x);
    Reg61: Registro25Bits port map (dat, Dw, clk, Reg61x);
    Reg62: Registro25Bits port map (dat, Dw, clk, Reg62x);
    Reg63: Registro25Bits port map (dat, Dw, clk, Reg63x);
    Reg64: Registro25Bits port map (dat, Dw, clk, Reg64x);
    Reg65: Registro25Bits port map (dat, Dw, clk, Reg65x);
    Reg66: Registro25Bits port map (dat, Dw, clk, Reg66x);
    Reg67: Registro25Bits port map (dat, Dw, clk, Reg67x);
    Reg68: Registro25Bits port map (dat, Dw, clk, Reg68x);
    Reg69: Registro25Bits port map (dat, Dw, clk, Reg69x);
    Reg70: Registro25Bits port map (dat, Dw, clk, Reg70x);
    Reg71: Registro25Bits port map (dat, Dw, clk, Reg71x);
    Reg72: Registro25Bits port map (dat, Dw, clk, Reg72x);
    Reg73: Registro25Bits port map (dat, Dw, clk, Reg73x);
    Reg74: Registro25Bits port map (dat, Dw, clk, Reg74x);
    Reg75: Registro25Bits port map (dat, Dw, clk, Reg75x);
    Reg76: Registro25Bits port map (dat, Dw, clk, Reg76x);
    Reg77: Registro25Bits port map (dat, Dw, clk, Reg77x);
    Reg78: Registro25Bits port map (dat, Dw, clk, Reg78x);
    Reg79: Registro25Bits port map (dat, Dw, clk, Reg79x);
    Reg80: Registro25Bits port map (dat, Dw, clk, Reg80x);
    Reg81: Registro25Bits port map (dat, Dw, clk, Reg81x);
    Reg82: Registro25Bits port map (dat, Dw, clk, Reg82x);
    Reg83: Registro25Bits port map (dat, Dw, clk, Reg83x);
    Reg84: Registro25Bits port map (dat, Dw, clk, Reg84x);
    Reg85: Registro25Bits port map (dat, Dw, clk, Reg85x);
    Reg86: Registro25Bits port map (dat, Dw, clk, Reg86x);
    Reg87: Registro25Bits port map (dat, Dw, clk, Reg87x);
    Reg88: Registro25Bits port map (dat, Dw, clk, Reg88x);
    Reg89: Registro25Bits port map (dat, Dw, clk, Reg89x);
    Reg90: Registro25Bits port map (dat, Dw, clk, Reg90x);
    Reg91: Registro25Bits port map (dat, Dw, clk, Reg91x);
    Reg92: Registro25Bits port map (dat, Dw, clk, Reg92x);
    Reg93: Registro25Bits port map (dat, Dw, clk, Reg93x);
    Reg94: Registro25Bits port map (dat, Dw, clk, Reg94x);
    Reg95: Registro25Bits port map (dat, Dw, clk, Reg95x);
    Reg96: Registro25Bits port map (dat, Dw, clk, Reg96x);
    Reg97: Registro25Bits port map (dat, Dw, clk, Reg97x);
    Reg98: Registro25Bits port map (dat, Dw, clk, Reg98x);
    Reg99: Registro25Bits port map (dat, Dw, clk, Reg99x);
    Reg100: Registro25Bits port map (dat, Dw, clk, Reg100x);
    Reg101: Registro25Bits port map (dat, Dw, clk, Reg101x);
    Reg102: Registro25Bits port map (dat, Dw, clk, Reg102x);
    Reg103: Registro25Bits port map (dat, Dw, clk, Reg103x);
    Reg104: Registro25Bits port map (dat, Dw, clk, Reg104x);
    Reg105: Registro25Bits port map (dat, Dw, clk, Reg105x);
    Reg106: Registro25Bits port map (dat, Dw, clk, Reg106x);
    Reg107: Registro25Bits port map (dat, Dw, clk, Reg107x);
    Reg108: Registro25Bits port map (dat, Dw, clk, Reg108x);
    Reg109: Registro25Bits port map (dat, Dw, clk, Reg109x);
    Reg110: Registro25Bits port map (dat, Dw, clk, Reg110x);
    Reg111: Registro25Bits port map (dat, Dw, clk, Reg111x);
    Reg112: Registro25Bits port map (dat, Dw, clk, Reg112x);
    Reg113: Registro25Bits port map (dat, Dw, clk, Reg113x);
    Reg114: Registro25Bits port map (dat, Dw, clk, Reg114x);
    Reg115: Registro25Bits port map (dat, Dw, clk, Reg115x);
    Reg116: Registro25Bits port map (dat, Dw, clk, Reg116x);
    Reg117: Registro25Bits port map (dat, Dw, clk, Reg117x);
    Reg118: Registro25Bits port map (dat, Dw, clk, Reg118x);
    Reg119: Registro25Bits port map (dat, Dw, clk, Reg119x);
    Reg120: Registro25Bits port map (dat, Dw, clk, Reg120x);
    Reg121: Registro25Bits port map (dat, Dw, clk, Reg121x);
    Reg122: Registro25Bits port map (dat, Dw, clk, Reg122x);
    Reg123: Registro25Bits port map (dat, Dw, clk, Reg123x);
    Reg124: Registro25Bits port map (dat, Dw, clk, Reg124x);
    Reg125: Registro25Bits port map (dat, Dw, clk, Reg125x);
    Reg126: Registro25Bits port map (dat, Dw, clk, Reg126x);
    Reg127: Registro25Bits port map (dat, Dw, clk, Reg127x);
    Reg128: Registro25Bits port map (dat, Dw, clk, Reg128x);
    Reg129: Registro25Bits port map (dat, Dw, clk, Reg129x);
    Reg130: Registro25Bits port map (dat, Dw, clk, Reg130x);
    Reg131: Registro25Bits port map (dat, Dw, clk, Reg131x);
    Reg132: Registro25Bits port map (dat, Dw, clk, Reg132x);
    Reg133: Registro25Bits port map (dat, Dw, clk, Reg133x);
    Reg134: Registro25Bits port map (dat, Dw, clk, Reg134x);
    Reg135: Registro25Bits port map (dat, Dw, clk, Reg135x);
    Reg136: Registro25Bits port map (dat, Dw, clk, Reg136x);
    Reg137: Registro25Bits port map (dat, Dw, clk, Reg137x);
    Reg138: Registro25Bits port map (dat, Dw, clk, Reg138x);
    Reg139: Registro25Bits port map (dat, Dw, clk, Reg139x);
    Reg140: Registro25Bits port map (dat, Dw, clk, Reg140x);
    Reg141: Registro25Bits port map (dat, Dw, clk, Reg141x);
    Reg142: Registro25Bits port map (dat, Dw, clk, Reg142x);
    Reg143: Registro25Bits port map (dat, Dw, clk, Reg143x);
    Reg144: Registro25Bits port map (dat, Dw, clk, Reg144x);
    Reg145: Registro25Bits port map (dat, Dw, clk, Reg145x);
    Reg146: Registro25Bits port map (dat, Dw, clk, Reg146x);
    Reg147: Registro25Bits port map (dat, Dw, clk, Reg147x);
    Reg148: Registro25Bits port map (dat, Dw, clk, Reg148x);
    Reg149: Registro25Bits port map (dat, Dw, clk, Reg149x);
    Reg150: Registro25Bits port map (dat, Dw, clk, Reg150x);
    Reg151: Registro25Bits port map (dat, Dw, clk, Reg151x);
    Reg152: Registro25Bits port map (dat, Dw, clk, Reg152x);
    Reg153: Registro25Bits port map (dat, Dw, clk, Reg153x);
    Reg154: Registro25Bits port map (dat, Dw, clk, Reg154x);
    Reg155: Registro25Bits port map (dat, Dw, clk, Reg155x);
    Reg156: Registro25Bits port map (dat, Dw, clk, Reg156x);
    Reg157: Registro25Bits port map (dat, Dw, clk, Reg157x);
    Reg158: Registro25Bits port map (dat, Dw, clk, Reg158x);
    Reg159: Registro25Bits port map (dat, Dw, clk, Reg159x);
    Reg160: Registro25Bits port map (dat, Dw, clk, Reg160x);
    Reg161: Registro25Bits port map (dat, Dw, clk, Reg161x);
    Reg162: Registro25Bits port map (dat, Dw, clk, Reg162x);
    Reg163: Registro25Bits port map (dat, Dw, clk, Reg163x);
    Reg164: Registro25Bits port map (dat, Dw, clk, Reg164x);
    Reg165: Registro25Bits port map (dat, Dw, clk, Reg165x);
    Reg166: Registro25Bits port map (dat, Dw, clk, Reg166x);
    Reg167: Registro25Bits port map (dat, Dw, clk, Reg167x);
    Reg168: Registro25Bits port map (dat, Dw, clk, Reg168x);
    Reg169: Registro25Bits port map (dat, Dw, clk, Reg169x);
    Reg170: Registro25Bits port map (dat, Dw, clk, Reg170x);
    Reg171: Registro25Bits port map (dat, Dw, clk, Reg171x);
    Reg172: Registro25Bits port map (dat, Dw, clk, Reg172x);
    Reg173: Registro25Bits port map (dat, Dw, clk, Reg173x);
    Reg174: Registro25Bits port map (dat, Dw, clk, Reg174x);
    Reg175: Registro25Bits port map (dat, Dw, clk, Reg175x);
    Reg176: Registro25Bits port map (dat, Dw, clk, Reg176x);
    Reg177: Registro25Bits port map (dat, Dw, clk, Reg177x);
    Reg178: Registro25Bits port map (dat, Dw, clk, Reg178x);
    Reg179: Registro25Bits port map (dat, Dw, clk, Reg179x);
    Reg180: Registro25Bits port map (dat, Dw, clk, Reg180x);
    Reg181: Registro25Bits port map (dat, Dw, clk, Reg181x);
    Reg182: Registro25Bits port map (dat, Dw, clk, Reg182x);
    Reg183: Registro25Bits port map (dat, Dw, clk, Reg183x);
    Reg184: Registro25Bits port map (dat, Dw, clk, Reg184x);
    Reg185: Registro25Bits port map (dat, Dw, clk, Reg185x);
    Reg186: Registro25Bits port map (dat, Dw, clk, Reg186x);
    Reg187: Registro25Bits port map (dat, Dw, clk, Reg187x);
    Reg188: Registro25Bits port map (dat, Dw, clk, Reg188x);
    Reg189: Registro25Bits port map (dat, Dw, clk, Reg189x);
    Reg190: Registro25Bits port map (dat, Dw, clk, Reg190x);
    Reg191: Registro25Bits port map (dat, Dw, clk, Reg191x);
    Reg192: Registro25Bits port map (dat, Dw, clk, Reg192x);
    Reg193: Registro25Bits port map (dat, Dw, clk, Reg193x);
    Reg194: Registro25Bits port map (dat, Dw, clk, Reg194x);
    Reg195: Registro25Bits port map (dat, Dw, clk, Reg195x);
    Reg196: Registro25Bits port map (dat, Dw, clk, Reg196x);
    Reg197: Registro25Bits port map (dat, Dw, clk, Reg197x);
    Reg198: Registro25Bits port map (dat, Dw, clk, Reg198x);
    Reg199: Registro25Bits port map (dat, Dw, clk, Reg199x);
    Reg200: Registro25Bits port map (dat, Dw, clk, Reg200x);
    Reg201: Registro25Bits port map (dat, Dw, clk, Reg201x);
    Reg202: Registro25Bits port map (dat, Dw, clk, Reg202x);
    Reg203: Registro25Bits port map (dat, Dw, clk, Reg203x);
    Reg204: Registro25Bits port map (dat, Dw, clk, Reg204x);
    Reg205: Registro25Bits port map (dat, Dw, clk, Reg205x);
    Reg206: Registro25Bits port map (dat, Dw, clk, Reg206x);
    Reg207: Registro25Bits port map (dat, Dw, clk, Reg207x);
    Reg208: Registro25Bits port map (dat, Dw, clk, Reg208x);
    Reg209: Registro25Bits port map (dat, Dw, clk, Reg209x);
    Reg210: Registro25Bits port map (dat, Dw, clk, Reg210x);
    Reg211: Registro25Bits port map (dat, Dw, clk, Reg211x);
    Reg212: Registro25Bits port map (dat, Dw, clk, Reg212x);
    Reg213: Registro25Bits port map (dat, Dw, clk, Reg213x);
    Reg214: Registro25Bits port map (dat, Dw, clk, Reg214x);
    Reg215: Registro25Bits port map (dat, Dw, clk, Reg215x);
    Reg216: Registro25Bits port map (dat, Dw, clk, Reg216x);
    Reg217: Registro25Bits port map (dat, Dw, clk, Reg217x);
    Reg218: Registro25Bits port map (dat, Dw, clk, Reg218x);
    Reg219: Registro25Bits port map (dat, Dw, clk, Reg219x);
    Reg220: Registro25Bits port map (dat, Dw, clk, Reg220x);
    Reg221: Registro25Bits port map (dat, Dw, clk, Reg221x);
    Reg222: Registro25Bits port map (dat, Dw, clk, Reg222x);
    Reg223: Registro25Bits port map (dat, Dw, clk, Reg223x);
    Reg224: Registro25Bits port map (dat, Dw, clk, Reg224x);
    Reg225: Registro25Bits port map (dat, Dw, clk, Reg225x);
    Reg226: Registro25Bits port map (dat, Dw, clk, Reg226x);
    Reg227: Registro25Bits port map (dat, Dw, clk, Reg227x);
    Reg228: Registro25Bits port map (dat, Dw, clk, Reg228x);
    Reg229: Registro25Bits port map (dat, Dw, clk, Reg229x);
    Reg230: Registro25Bits port map (dat, Dw, clk, Reg230x);
    Reg231: Registro25Bits port map (dat, Dw, clk, Reg231x);
    Reg232: Registro25Bits port map (dat, Dw, clk, Reg232x);
    Reg233: Registro25Bits port map (dat, Dw, clk, Reg233x);
    Reg234: Registro25Bits port map (dat, Dw, clk, Reg234x);
    Reg235: Registro25Bits port map (dat, Dw, clk, Reg235x);
    Reg236: Registro25Bits port map (dat, Dw, clk, Reg236x);
    Reg237: Registro25Bits port map (dat, Dw, clk, Reg237x);
    Reg238: Registro25Bits port map (dat, Dw, clk, Reg238x);
    Reg239: Registro25Bits port map (dat, Dw, clk, Reg239x);
    Reg240: Registro25Bits port map (dat, Dw, clk, Reg240x);
    Reg241: Registro25Bits port map (dat, Dw, clk, Reg241x);
    Reg242: Registro25Bits port map (dat, Dw, clk, Reg242x);
    Reg243: Registro25Bits port map (dat, Dw, clk, Reg243x);
    Reg244: Registro25Bits port map (dat, Dw, clk, Reg244x);
    Reg245: Registro25Bits port map (dat, Dw, clk, Reg245x);
    Reg246: Registro25Bits port map (dat, Dw, clk, Reg246x);
    Reg247: Registro25Bits port map (dat, Dw, clk, Reg247x);
    Reg248: Registro25Bits port map (dat, Dw, clk, Reg248x);
    Reg249: Registro25Bits port map (dat, Dw, clk, Reg249x);
    Reg250: Registro25Bits port map (dat, Dw, clk, Reg250x);
    Reg251: Registro25Bits port map (dat, Dw, clk, Reg251x);
    Reg252: Registro25Bits port map (dat, Dw, clk, Reg252x);
    Reg253: Registro25Bits port map (dat, Dw, clk, Reg253x);
    Reg254: Registro25Bits port map (dat, Dw, clk, Reg254x);
    Reg255: Registro25Bits port map (dat, Dw, clk, Reg255x);

    
    -- Salidas
    MuxR: Mux256a125Bits port map (Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x,
                                 Reg8x, Reg9x, Reg10x, Reg11x, Reg12x, Reg13x, Reg14x, Reg15x,
                                 Reg16x, Reg17x, Reg18x, Reg19x, Reg20x, Reg21x, Reg22x, Reg23x,
                                 Reg24x, Reg25x, Reg26x, Reg27x, Reg28x, Reg29x, Reg30x, Reg31x,
                                  Reg32x, Reg33x, Reg34x, Reg35x, Reg36x, Reg37x, Reg38x, Reg39x,
                                  Reg40x, Reg41x, Reg42x, Reg43x, Reg44x, Reg45x, Reg46x, Reg47x,
                                  Reg48x, Reg49x, Reg50x, Reg51x, Reg52x, Reg53x, Reg54x, Reg55x,
                                  Reg56x, Reg57x, Reg58x, Reg59x, Reg60x, Reg61x, Reg62x, Reg63x,
                                  Reg64x, Reg65x, Reg66x, Reg67x, Reg68x, Reg69x, Reg70x, Reg71x,
                                  Reg72x, Reg73x, Reg74x, Reg75x, Reg76x, Reg77x, Reg78x, Reg79x,
                                  Reg80x, Reg81x, Reg82x, Reg83x, Reg84x, Reg85x, Reg86x, Reg87x,
                                  Reg88x, Reg89x, Reg90x, Reg91x, Reg92x, Reg93x, Reg94x, Reg95x,
                                  Reg96x, Reg97x, Reg98x, Reg99x, Reg100x, Reg101x, Reg102x, Reg103x,
                                  Reg104x, Reg105x, Reg106x, Reg107x, Reg108x, Reg109x, Reg110x, Reg111x,
                                  Reg112x, Reg113x, Reg114x, Reg115x, Reg116x, Reg117x, Reg118x, Reg119x,
                                  Reg120x, Reg121x, Reg122x, Reg123x, Reg124x, Reg125x, Reg126x, Reg127x,
                                  Reg128x, Reg129x, Reg130x, Reg131x, Reg132x, Reg133x, Reg134x, Reg135x,
                                  Reg136x, Reg137x, Reg138x, Reg139x, Reg140x, Reg141x, Reg142x, Reg143x,
                                  Reg144x, Reg145x, Reg146x, Reg147x, Reg148x, Reg149x, Reg150x, Reg151x,
                                  Reg152x, Reg153x, Reg154x, Reg155x, Reg156x, Reg157x, Reg158x, Reg159x,
                                  Reg160x, Reg161x, Reg162x, Reg163x, Reg164x, Reg165x, Reg166x, Reg167x,
                                  Reg168x, Reg169x, Reg170x, Reg171x, Reg172x, Reg173x, Reg174x, Reg175x,
                                  Reg176x, Reg177x, Reg178x, Reg179x, Reg180x, Reg181x, Reg182x, Reg183x,
                                  Reg184x, Reg185x, Reg186x, Reg187x, Reg188x, Reg189x, Reg190x, Reg191x,
                                  Reg192x, Reg193x, Reg194x, Reg195x, Reg196x, Reg197x, Reg198x, Reg199x,
                                  Reg200x, Reg201x, Reg202x, Reg203x, Reg204x, Reg205x, Reg206x, Reg207x,
                                  Reg208x, Reg209x, Reg210x, Reg211x, Reg212x, Reg213x, Reg214x, Reg215x,
                                  Reg216x, Reg217x, Reg218x, Reg219x, Reg220x, Reg221x, Reg222x, Reg223x,
                                  Reg224x, Reg225x, Reg226x, Reg227x, Reg228x, Reg229x, Reg230x, Reg231x,
                                  Reg232x, Reg233x, Reg234x, Reg235x, Reg236x, Reg237x, Reg238x, Reg239x,
                                  Reg240x, Reg241x, Reg242x, Reg243x, Reg244x, Reg245x, Reg246x, Reg247x,
                                  Reg248x, Reg249x, Reg250x, Reg251x, Reg252x, Reg253x, Reg254x, Reg255x,
                      dir, Ax);


  Q <= Ax;


end architecture;




    
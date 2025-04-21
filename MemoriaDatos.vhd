library IEEE;
use IEEE.std_logic_1164.all;

entity Memoria is
  port (dat: in std_logic_vector (7 downto 0);
        dir: in std_logic_vector(7 downto 0);
        w, clk: in std_logic; 
        Q: out std_logic_vector (7 downto 0));
end Memoria;

architecture Ar_Memoria of Memoria is
  component Registro8Bits is
      port (D: in std_logic_vector (7 downto 0); 
            w, clk: in std_logic; 
            Q: out std_logic_vector (7 downto 0));
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

  component Mux256a18Bits is
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
          d240, d241, d242, d243, d244, d245, d246, d247, d248, d249, d250, d251, d252, d253, d254, d255: in std_logic_vector(7 downto 0);
          S: in std_logic_vector(7 downto 0);
          r: out std_logic_vector(7 downto 0)
      );
  end component;


  signal Ax, Cx: std_logic_vector(7 downto 0);
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
      D240w, D241w, D242w, D243w, D244w, D245w, D246w, D247w, D248w, D249w, D250w, D251w, D252w, D253w, D254w, D255w: std_logic; -- señales de salida de Registro8Bits
  
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
      Reg240x, Reg241x, Reg242x, Reg243x, Reg244x, Reg245x, Reg246x, Reg247x, Reg248x, Reg249x, Reg250x, Reg251x, Reg252x, Reg253x, Reg254x, Reg255x: std_logic_vector(7 downto 0); -- señales de salida de Registro8Bits

  begin

    
    Deco: Deco8a256 port map (dir, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15,
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
      D240, D241, D242, D243, D244, D245, D246, D247, D248, D249, D250, D251, D252, D253, D254, D255);

    
    D0w <= D0 and w;
    D1w <= D1 and w;
    D2w <= D2 and w;
    D3w <= D3 and w;
    D4w <= D4 and w;
    D5w <= D5 and w;
    D6w <= D6 and w;
    D7w <= D7 and w;
    D8w <= D8 and w;
    D9w <= D9 and w;
    D10w <= D10 and w;
    D11w <= D11 and w;
    D12w <= D12 and w;
    D13w <= D13 and w;
    D14w <= D14 and w;
    D15w <= D15 and w;
    D16w <= D16 and w;
    D17w <= D17 and w;
    D18w <= D18 and w;
    D19w <= D19 and w;
    D20w <= D20 and w;
    D21w <= D21 and w;
    D22w <= D22 and w;
    D23w <= D23 and w;
    D24w <= D24 and w;
    D25w <= D25 and w;
    D26w <= D26 and w;
    D27w <= D27 and w;
    D28w <= D28 and w;
    D29w <= D29 and w;
    D30w <= D30 and w;
    D31w <= D31 and w;
    D32w <= D32 and w;
    D33w <= D33 and w;
    D34w <= D34 and w;
    D35w <= D35 and w;
    D36w <= D36 and w;
    D37w <= D37 and w;
    D38w <= D38 and w;
    D39w <= D39 and w;
    D40w <= D40 and w;
    D41w <= D41 and w;
    D42w <= D42 and w;
    D43w <= D43 and w;
    D44w <= D44 and w;
    D45w <= D45 and w;
    D46w <= D46 and w;
    D47w <= D47 and w;
    D48w <= D48 and w;
    D49w <= D49 and w;
    D50w <= D50 and w;
    D51w <= D51 and w;
    D52w <= D52 and w;
    D53w <= D53 and w;
    D54w <= D54 and w;
    D55w <= D55 and w;
    D56w <= D56 and w;
    D57w <= D57 and w;
    D58w <= D58 and w;
    D59w <= D59 and w;
    D60w <= D60 and w;
    D61w <= D61 and w;
    D62w <= D62 and w;
    D63w <= D63 and w;
    D64w <= D64 and w;
    D65w <= D65 and w;
    D66w <= D66 and w;
    D67w <= D67 and w;
    D68w <= D68 and w;
    D69w <= D69 and w;
    D70w <= D70 and w;
    D71w <= D71 and w;
    D72w <= D72 and w;
    D73w <= D73 and w;
    D74w <= D74 and w;
    D75w <= D75 and w;
    D76w <= D76 and w;
    D77w <= D77 and w;
    D78w <= D78 and w;
    D79w <= D79 and w;
    D80w <= D80 and w;
    D81w <= D81 and w;
    D82w <= D82 and w;
    D83w <= D83 and w;
    D84w <= D84 and w;
    D85w <= D85 and w;
    D86w <= D86 and w;
    D87w <= D87 and w;
    D88w <= D88 and w;
    D89w <= D89 and w;
    D90w <= D90 and w;
    D91w <= D91 and w;
    D92w <= D92 and w;
    D93w <= D93 and w;
    D94w <= D94 and w;
    D95w <= D95 and w;
    D96w <= D96 and w;
    D97w <= D97 and w;
    D98w <= D98 and w;
    D99w <= D99 and w;
    D100w <= D100 and w;
    D101w <= D101 and w;
    D102w <= D102 and w;
    D103w <= D103 and w;
    D104w <= D104 and w;
    D105w <= D105 and w;
    D106w <= D106 and w;
    D107w <= D107 and w;
    D108w <= D108 and w;
    D109w <= D109 and w;
    D110w <= D110 and w;
    D111w <= D111 and w;
    D112w <= D112 and w;
    D113w <= D113 and w;
    D114w <= D114 and w;
    D115w <= D115 and w;
    D116w <= D116 and w;
    D117w <= D117 and w;
    D118w <= D118 and w;
    D119w <= D119 and w;
    D120w <= D120 and w;
    D121w <= D121 and w;
    D122w <= D122 and w;
    D123w <= D123 and w;
    D124w <= D124 and w;
    D125w <= D125 and w;
    D126w <= D126 and w;
    D127w <= D127 and w;
    D128w <= D128 and w;
    D129w <= D129 and w;
    D130w <= D130 and w;
    D131w <= D131 and w;
    D132w <= D132 and w;
    D133w <= D133 and w;
    D134w <= D134 and w;
    D135w <= D135 and w;
    D136w <= D136 and w;
    D137w <= D137 and w;
    D138w <= D138 and w;
    D139w <= D139 and w;
    D140w <= D140 and w;
    D141w <= D141 and w;
    D142w <= D142 and w;
    D143w <= D143 and w;
    D144w <= D144 and w;
    D145w <= D145 and w;
    D146w <= D146 and w;
    D147w <= D147 and w;
    D148w <= D148 and w;
    D149w <= D149 and w;
    D150w <= D150 and w;
    D151w <= D151 and w;
    D152w <= D152 and w;
    D153w <= D153 and w;
    D154w <= D154 and w;
    D155w <= D155 and w;
    D156w <= D156 and w;
    D157w <= D157 and w;
    D158w <= D158 and w;
    D159w <= D159 and w;
    D160w <= D160 and w;
    D161w <= D161 and w;
    D162w <= D162 and w;
    D163w <= D163 and w;
    D164w <= D164 and w;
    D165w <= D165 and w;
    D166w <= D166 and w;
    D167w <= D167 and w;
    D168w <= D168 and w;
    D169w <= D169 and w;
    D170w <= D170 and w;
    D171w <= D171 and w;
    D172w <= D172 and w;
    D173w <= D173 and w;
    D174w <= D174 and w;
    D175w <= D175 and w;
    D176w <= D176 and w;
    D177w <= D177 and w;
    D178w <= D178 and w;
    D179w <= D179 and w;
    D180w <= D180 and w;
    D181w <= D181 and w;
    D182w <= D182 and w;
    D183w <= D183 and w;
    D184w <= D184 and w;
    D185w <= D185 and w;
    D186w <= D186 and w;
    D187w <= D187 and w;
    D188w <= D188 and w;
    D189w <= D189 and w;
    D190w <= D190 and w;
    D191w <= D191 and w;
    D192w <= D192 and w;
    D193w <= D193 and w;
    D194w <= D194 and w;
    D195w <= D195 and w;
    D196w <= D196 and w;
    D197w <= D197 and w;
    D198w <= D198 and w;
    D199w <= D199 and w;
    D200w <= D200 and w;
    D201w <= D201 and w;
    D202w <= D202 and w;
    D203w <= D203 and w;
    D204w <= D204 and w;
    D205w <= D205 and w;
    D206w <= D206 and w;
    D207w <= D207 and w;
    D208w <= D208 and w;
    D209w <= D209 and w;
    D210w <= D210 and w;
    D211w <= D211 and w;
    D212w <= D212 and w;
    D213w <= D213 and w;
    D214w <= D214 and w;
    D215w <= D215 and w;
    D216w <= D216 and w;
    D217w <= D217 and w;
    D218w <= D218 and w;
    D219w <= D219 and w;
    D220w <= D220 and w;
    D221w <= D221 and w;
    D222w <= D222 and w;
    D223w <= D223 and w;
    D224w <= D224 and w;
    D225w <= D225 and w;
    D226w <= D226 and w;
    D227w <= D227 and w;
    D228w <= D228 and w;
    D229w <= D229 and w;
    D230w <= D230 and w;
    D231w <= D231 and w;
    D232w <= D232 and w;
    D233w <= D233 and w;
    D234w <= D234 and w;
    D235w <= D235 and w;
    D236w <= D236 and w;
    D237w <= D237 and w;
    D238w <= D238 and w;
    D239w <= D239 and w;
    D240w <= D240 and w;
    D241w <= D241 and w;
    D242w <= D242 and w;
    D243w <= D243 and w;
    D244w <= D244 and w;
    D245w <= D245 and w;
    D246w <= D246 and w;
    D247w <= D247 and w;
    D248w <= D248 and w;
    D249w <= D249 and w;
    D250w <= D250 and w;
    D251w <= D251 and w;
    D252w <= D252 and w;
    D253w <= D253 and w;
    D254w <= D254 and w;
    D255w <= D255 and w;
    

    Reg0: Registro8Bits port map (dat, D0w, clk, Reg0x);
    Reg1: Registro8Bits port map (dat, D1w, clk, Reg1x);
    Reg2: Registro8Bits port map (dat, D2w, clk, Reg2x);
    Reg3: Registro8Bits port map (dat, D3w, clk, Reg3x);
    Reg4: Registro8Bits port map (dat, D4w, clk, Reg4x);
    Reg5: Registro8Bits port map (dat, D5w, clk, Reg5x);
    Reg6: Registro8Bits port map (dat, D6w, clk, Reg6x);
    Reg7: Registro8Bits port map (dat, D7w, clk, Reg7x);
    Reg8: Registro8Bits port map (dat, D8w, clk, Reg8x);
    Reg9: Registro8Bits port map (dat, D9w, clk, Reg9x);
    Reg10: Registro8Bits port map (dat, D10w, clk, Reg10x);
    Reg11: Registro8Bits port map (dat, D11w, clk, Reg11x);
    Reg12: Registro8Bits port map (dat, D12w, clk, Reg12x);
    Reg13: Registro8Bits port map (dat, D13w, clk, Reg13x);
    Reg14: Registro8Bits port map (dat, D14w, clk, Reg14x);
    Reg15: Registro8Bits port map (dat, D15w, clk, Reg15x);
    Reg16: Registro8Bits port map (dat, D16w, clk, Reg16x);
    Reg17: Registro8Bits port map (dat, D17w, clk, Reg17x);
    Reg18: Registro8Bits port map (dat, D18w, clk, Reg18x);
    Reg19: Registro8Bits port map (dat, D19w, clk, Reg19x);
    Reg20: Registro8Bits port map (dat, D20w, clk, Reg20x);
    Reg21: Registro8Bits port map (dat, D21w, clk, Reg21x);
    Reg22: Registro8Bits port map (dat, D22w, clk, Reg22x);
    Reg23: Registro8Bits port map (dat, D23w, clk, Reg23x);
    Reg24: Registro8Bits port map (dat, D24w, clk, Reg24x);
    Reg25: Registro8Bits port map (dat, D25w, clk, Reg25x);
    Reg26: Registro8Bits port map (dat, D26w, clk, Reg26x);
    Reg27: Registro8Bits port map (dat, D27w, clk, Reg27x);
    Reg28: Registro8Bits port map (dat, D28w, clk, Reg28x);
    Reg29: Registro8Bits port map (dat, D29w, clk, Reg29x);
    Reg30: Registro8Bits port map (dat, D30w, clk, Reg30x);
    Reg31: Registro8Bits port map (dat, D31w, clk, Reg31x);
    Reg32: Registro8Bits port map (dat, D32w, clk, Reg32x);
    Reg33: Registro8Bits port map (dat, D33w, clk, Reg33x);
    Reg34: Registro8Bits port map (dat, D34w, clk, Reg34x);
    Reg35: Registro8Bits port map (dat, D35w, clk, Reg35x);
    Reg36: Registro8Bits port map (dat, D36w, clk, Reg36x);
    Reg37: Registro8Bits port map (dat, D37w, clk, Reg37x);
    Reg38: Registro8Bits port map (dat, D38w, clk, Reg38x);
    Reg39: Registro8Bits port map (dat, D39w, clk, Reg39x);
    Reg40: Registro8Bits port map (dat, D40w, clk, Reg40x);
    Reg41: Registro8Bits port map (dat, D41w, clk, Reg41x);
    Reg42: Registro8Bits port map (dat, D42w, clk, Reg42x);
    Reg43: Registro8Bits port map (dat, D43w, clk, Reg43x);
    Reg44: Registro8Bits port map (dat, D44w, clk, Reg44x);
    Reg45: Registro8Bits port map (dat, D45w, clk, Reg45x);
    Reg46: Registro8Bits port map (dat, D46w, clk, Reg46x);
    Reg47: Registro8Bits port map (dat, D47w, clk, Reg47x);
    Reg48: Registro8Bits port map (dat, D48w, clk, Reg48x);
    Reg49: Registro8Bits port map (dat, D49w, clk, Reg49x);
    Reg50: Registro8Bits port map (dat, D50w, clk, Reg50x);
    Reg51: Registro8Bits port map (dat, D51w, clk, Reg51x);
    Reg52: Registro8Bits port map (dat, D52w, clk, Reg52x);
    Reg53: Registro8Bits port map (dat, D53w, clk, Reg53x);
    Reg54: Registro8Bits port map (dat, D54w, clk, Reg54x);
    Reg55: Registro8Bits port map (dat, D55w, clk, Reg55x);
    Reg56: Registro8Bits port map (dat, D56w, clk, Reg56x);
    Reg57: Registro8Bits port map (dat, D57w, clk, Reg57x);
    Reg58: Registro8Bits port map (dat, D58w, clk, Reg58x);
    Reg59: Registro8Bits port map (dat, D59w, clk, Reg59x);
    Reg60: Registro8Bits port map (dat, D60w, clk, Reg60x);
    Reg61: Registro8Bits port map (dat, D61w, clk, Reg61x);
    Reg62: Registro8Bits port map (dat, D62w, clk, Reg62x);
    Reg63: Registro8Bits port map (dat, D63w, clk, Reg63x);
    Reg64: Registro8Bits port map (dat, D64w, clk, Reg64x);
    Reg65: Registro8Bits port map (dat, D65w, clk, Reg65x);
    Reg66: Registro8Bits port map (dat, D66w, clk, Reg66x);
    Reg67: Registro8Bits port map (dat, D67w, clk, Reg67x);
    Reg68: Registro8Bits port map (dat, D68w, clk, Reg68x);
    Reg69: Registro8Bits port map (dat, D69w, clk, Reg69x);
    Reg70: Registro8Bits port map (dat, D70w, clk, Reg70x);
    Reg71: Registro8Bits port map (dat, D71w, clk, Reg71x);
    Reg72: Registro8Bits port map (dat, D72w, clk, Reg72x);
    Reg73: Registro8Bits port map (dat, D73w, clk, Reg73x);
    Reg74: Registro8Bits port map (dat, D74w, clk, Reg74x);
    Reg75: Registro8Bits port map (dat, D75w, clk, Reg75x);
    Reg76: Registro8Bits port map (dat, D76w, clk, Reg76x);
    Reg77: Registro8Bits port map (dat, D77w, clk, Reg77x);
    Reg78: Registro8Bits port map (dat, D78w, clk, Reg78x);
    Reg79: Registro8Bits port map (dat, D79w, clk, Reg79x);
    Reg80: Registro8Bits port map (dat, D80w, clk, Reg80x);
    Reg81: Registro8Bits port map (dat, D81w, clk, Reg81x);
    Reg82: Registro8Bits port map (dat, D82w, clk, Reg82x);
    Reg83: Registro8Bits port map (dat, D83w, clk, Reg83x);
    Reg84: Registro8Bits port map (dat, D84w, clk, Reg84x);
    Reg85: Registro8Bits port map (dat, D85w, clk, Reg85x);
    Reg86: Registro8Bits port map (dat, D86w, clk, Reg86x);
    Reg87: Registro8Bits port map (dat, D87w, clk, Reg87x);
    Reg88: Registro8Bits port map (dat, D88w, clk, Reg88x);
    Reg89: Registro8Bits port map (dat, D89w, clk, Reg89x);
    Reg90: Registro8Bits port map (dat, D90w, clk, Reg90x);
    Reg91: Registro8Bits port map (dat, D91w, clk, Reg91x);
    Reg92: Registro8Bits port map (dat, D92w, clk, Reg92x);
    Reg93: Registro8Bits port map (dat, D93w, clk, Reg93x);
    Reg94: Registro8Bits port map (dat, D94w, clk, Reg94x);
    Reg95: Registro8Bits port map (dat, D95w, clk, Reg95x);
    Reg96: Registro8Bits port map (dat, D96w, clk, Reg96x);
    Reg97: Registro8Bits port map (dat, D97w, clk, Reg97x);
    Reg98: Registro8Bits port map (dat, D98w, clk, Reg98x);
    Reg99: Registro8Bits port map (dat, D99w, clk, Reg99x);
    Reg100: Registro8Bits port map (dat, D100w, clk, Reg100x);
    Reg101: Registro8Bits port map (dat, D101w, clk, Reg101x);
    Reg102: Registro8Bits port map (dat, D102w, clk, Reg102x);
    Reg103: Registro8Bits port map (dat, D103w, clk, Reg103x);
    Reg104: Registro8Bits port map (dat, D104w, clk, Reg104x);
    Reg105: Registro8Bits port map (dat, D105w, clk, Reg105x);
    Reg106: Registro8Bits port map (dat, D106w, clk, Reg106x);
    Reg107: Registro8Bits port map (dat, D107w, clk, Reg107x);
    Reg108: Registro8Bits port map (dat, D108w, clk, Reg108x);
    Reg109: Registro8Bits port map (dat, D109w, clk, Reg109x);
    Reg110: Registro8Bits port map (dat, D110w, clk, Reg110x);
    Reg111: Registro8Bits port map (dat, D111w, clk, Reg111x);
    Reg112: Registro8Bits port map (dat, D112w, clk, Reg112x);
    Reg113: Registro8Bits port map (dat, D113w, clk, Reg113x);
    Reg114: Registro8Bits port map (dat, D114w, clk, Reg114x);
    Reg115: Registro8Bits port map (dat, D115w, clk, Reg115x);
    Reg116: Registro8Bits port map (dat, D116w, clk, Reg116x);
    Reg117: Registro8Bits port map (dat, D117w, clk, Reg117x);
    Reg118: Registro8Bits port map (dat, D118w, clk, Reg118x);
    Reg119: Registro8Bits port map (dat, D119w, clk, Reg119x);
    Reg120: Registro8Bits port map (dat, D120w, clk, Reg120x);
    Reg121: Registro8Bits port map (dat, D121w, clk, Reg121x);
    Reg122: Registro8Bits port map (dat, D122w, clk, Reg122x);
    Reg123: Registro8Bits port map (dat, D123w, clk, Reg123x);
    Reg124: Registro8Bits port map (dat, D124w, clk, Reg124x);
    Reg125: Registro8Bits port map (dat, D125w, clk, Reg125x);
    Reg126: Registro8Bits port map (dat, D126w, clk, Reg126x);
    Reg127: Registro8Bits port map (dat, D127w, clk, Reg127x);
    Reg128: Registro8Bits port map (dat, D128w, clk, Reg128x);
    Reg129: Registro8Bits port map (dat, D129w, clk, Reg129x);
    Reg130: Registro8Bits port map (dat, D130w, clk, Reg130x);
    Reg131: Registro8Bits port map (dat, D131w, clk, Reg131x);
    Reg132: Registro8Bits port map (dat, D132w, clk, Reg132x);
    Reg133: Registro8Bits port map (dat, D133w, clk, Reg133x);
    Reg134: Registro8Bits port map (dat, D134w, clk, Reg134x);
    Reg135: Registro8Bits port map (dat, D135w, clk, Reg135x);
    Reg136: Registro8Bits port map (dat, D136w, clk, Reg136x);
    Reg137: Registro8Bits port map (dat, D137w, clk, Reg137x);
    Reg138: Registro8Bits port map (dat, D138w, clk, Reg138x);
    Reg139: Registro8Bits port map (dat, D139w, clk, Reg139x);
    Reg140: Registro8Bits port map (dat, D140w, clk, Reg140x);
    Reg141: Registro8Bits port map (dat, D141w, clk, Reg141x);
    Reg142: Registro8Bits port map (dat, D142w, clk, Reg142x);
    Reg143: Registro8Bits port map (dat, D143w, clk, Reg143x);
    Reg144: Registro8Bits port map (dat, D144w, clk, Reg144x);
    Reg145: Registro8Bits port map (dat, D145w, clk, Reg145x);
    Reg146: Registro8Bits port map (dat, D146w, clk, Reg146x);
    Reg147: Registro8Bits port map (dat, D147w, clk, Reg147x);
    Reg148: Registro8Bits port map (dat, D148w, clk, Reg148x);
    Reg149: Registro8Bits port map (dat, D149w, clk, Reg149x);
    Reg150: Registro8Bits port map (dat, D150w, clk, Reg150x);
    Reg151: Registro8Bits port map (dat, D151w, clk, Reg151x);
    Reg152: Registro8Bits port map (dat, D152w, clk, Reg152x);
    Reg153: Registro8Bits port map (dat, D153w, clk, Reg153x);
    Reg154: Registro8Bits port map (dat, D154w, clk, Reg154x);
    Reg155: Registro8Bits port map (dat, D155w, clk, Reg155x);
    Reg156: Registro8Bits port map (dat, D156w, clk, Reg156x);
    Reg157: Registro8Bits port map (dat, D157w, clk, Reg157x);
    Reg158: Registro8Bits port map (dat, D158w, clk, Reg158x);
    Reg159: Registro8Bits port map (dat, D159w, clk, Reg159x);
    Reg160: Registro8Bits port map (dat, D160w, clk, Reg160x);
    Reg161: Registro8Bits port map (dat, D161w, clk, Reg161x);
    Reg162: Registro8Bits port map (dat, D162w, clk, Reg162x);
    Reg163: Registro8Bits port map (dat, D163w, clk, Reg163x);
    Reg164: Registro8Bits port map (dat, D164w, clk, Reg164x);
    Reg165: Registro8Bits port map (dat, D165w, clk, Reg165x);
    Reg166: Registro8Bits port map (dat, D166w, clk, Reg166x);
    Reg167: Registro8Bits port map (dat, D167w, clk, Reg167x);
    Reg168: Registro8Bits port map (dat, D168w, clk, Reg168x);
    Reg169: Registro8Bits port map (dat, D169w, clk, Reg169x);
    Reg170: Registro8Bits port map (dat, D170w, clk, Reg170x);
    Reg171: Registro8Bits port map (dat, D171w, clk, Reg171x);
    Reg172: Registro8Bits port map (dat, D172w, clk, Reg172x);
    Reg173: Registro8Bits port map (dat, D173w, clk, Reg173x);
    Reg174: Registro8Bits port map (dat, D174w, clk, Reg174x);
    Reg175: Registro8Bits port map (dat, D175w, clk, Reg175x);
    Reg176: Registro8Bits port map (dat, D176w, clk, Reg176x);
    Reg177: Registro8Bits port map (dat, D177w, clk, Reg177x);
    Reg178: Registro8Bits port map (dat, D178w, clk, Reg178x);
    Reg179: Registro8Bits port map (dat, D179w, clk, Reg179x);
    Reg180: Registro8Bits port map (dat, D180w, clk, Reg180x);
    Reg181: Registro8Bits port map (dat, D181w, clk, Reg181x);
    Reg182: Registro8Bits port map (dat, D182w, clk, Reg182x);
    Reg183: Registro8Bits port map (dat, D183w, clk, Reg183x);
    Reg184: Registro8Bits port map (dat, D184w, clk, Reg184x);
    Reg185: Registro8Bits port map (dat, D185w, clk, Reg185x);
    Reg186: Registro8Bits port map (dat, D186w, clk, Reg186x);
    Reg187: Registro8Bits port map (dat, D187w, clk, Reg187x);
    Reg188: Registro8Bits port map (dat, D188w, clk, Reg188x);
    Reg189: Registro8Bits port map (dat, D189w, clk, Reg189x);
    Reg190: Registro8Bits port map (dat, D190w, clk, Reg190x);
    Reg191: Registro8Bits port map (dat, D191w, clk, Reg191x);
    Reg192: Registro8Bits port map (dat, D192w, clk, Reg192x);
    Reg193: Registro8Bits port map (dat, D193w, clk, Reg193x);
    Reg194: Registro8Bits port map (dat, D194w, clk, Reg194x);
    Reg195: Registro8Bits port map (dat, D195w, clk, Reg195x);
    Reg196: Registro8Bits port map (dat, D196w, clk, Reg196x);
    Reg197: Registro8Bits port map (dat, D197w, clk, Reg197x);
    Reg198: Registro8Bits port map (dat, D198w, clk, Reg198x);
    Reg199: Registro8Bits port map (dat, D199w, clk, Reg199x);
    Reg200: Registro8Bits port map (dat, D200w, clk, Reg200x);
    Reg201: Registro8Bits port map (dat, D201w, clk, Reg201x);
    Reg202: Registro8Bits port map (dat, D202w, clk, Reg202x);
    Reg203: Registro8Bits port map (dat, D203w, clk, Reg203x);
    Reg204: Registro8Bits port map (dat, D204w, clk, Reg204x);
    Reg205: Registro8Bits port map (dat, D205w, clk, Reg205x);
    Reg206: Registro8Bits port map (dat, D206w, clk, Reg206x);
    Reg207: Registro8Bits port map (dat, D207w, clk, Reg207x);
    Reg208: Registro8Bits port map (dat, D208w, clk, Reg208x);
    Reg209: Registro8Bits port map (dat, D209w, clk, Reg209x);
    Reg210: Registro8Bits port map (dat, D210w, clk, Reg210x);
    Reg211: Registro8Bits port map (dat, D211w, clk, Reg211x);
    Reg212: Registro8Bits port map (dat, D212w, clk, Reg212x);
    Reg213: Registro8Bits port map (dat, D213w, clk, Reg213x);
    Reg214: Registro8Bits port map (dat, D214w, clk, Reg214x);
    Reg215: Registro8Bits port map (dat, D215w, clk, Reg215x);
    Reg216: Registro8Bits port map (dat, D216w, clk, Reg216x);
    Reg217: Registro8Bits port map (dat, D217w, clk, Reg217x);
    Reg218: Registro8Bits port map (dat, D218w, clk, Reg218x);
    Reg219: Registro8Bits port map (dat, D219w, clk, Reg219x);
    Reg220: Registro8Bits port map (dat, D220w, clk, Reg220x);
    Reg221: Registro8Bits port map (dat, D221w, clk, Reg221x);
    Reg222: Registro8Bits port map (dat, D222w, clk, Reg222x);
    Reg223: Registro8Bits port map (dat, D223w, clk, Reg223x);
    Reg224: Registro8Bits port map (dat, D224w, clk, Reg224x);
    Reg225: Registro8Bits port map (dat, D225w, clk, Reg225x);
    Reg226: Registro8Bits port map (dat, D226w, clk, Reg226x);
    Reg227: Registro8Bits port map (dat, D227w, clk, Reg227x);
    Reg228: Registro8Bits port map (dat, D228w, clk, Reg228x);
    Reg229: Registro8Bits port map (dat, D229w, clk, Reg229x);
    Reg230: Registro8Bits port map (dat, D230w, clk, Reg230x);
    Reg231: Registro8Bits port map (dat, D231w, clk, Reg231x);
    Reg232: Registro8Bits port map (dat, D232w, clk, Reg232x);
    Reg233: Registro8Bits port map (dat, D233w, clk, Reg233x);
    Reg234: Registro8Bits port map (dat, D234w, clk, Reg234x);
    Reg235: Registro8Bits port map (dat, D235w, clk, Reg235x);
    Reg236: Registro8Bits port map (dat, D236w, clk, Reg236x);
    Reg237: Registro8Bits port map (dat, D237w, clk, Reg237x);
    Reg238: Registro8Bits port map (dat, D238w, clk, Reg238x);
    Reg239: Registro8Bits port map (dat, D239w, clk, Reg239x);
    Reg240: Registro8Bits port map (dat, D240w, clk, Reg240x);
    Reg241: Registro8Bits port map (dat, D241w, clk, Reg241x);
    Reg242: Registro8Bits port map (dat, D242w, clk, Reg242x);
    Reg243: Registro8Bits port map (dat, D243w, clk, Reg243x);
    Reg244: Registro8Bits port map (dat, D244w, clk, Reg244x);
    Reg245: Registro8Bits port map (dat, D245w, clk, Reg245x);
    Reg246: Registro8Bits port map (dat, D246w, clk, Reg246x);
    Reg247: Registro8Bits port map (dat, D247w, clk, Reg247x);
    Reg248: Registro8Bits port map (dat, D248w, clk, Reg248x);
    Reg249: Registro8Bits port map (dat, D249w, clk, Reg249x);
    Reg250: Registro8Bits port map (dat, D250w, clk, Reg250x);
    Reg251: Registro8Bits port map (dat, D251w, clk, Reg251x);
    Reg252: Registro8Bits port map (dat, D252w, clk, Reg252x);
    Reg253: Registro8Bits port map (dat, D253w, clk, Reg253x);
    Reg254: Registro8Bits port map (dat, D254w, clk, Reg254x);
    Reg255: Registro8Bits port map (dat, D255w, clk, Reg255x);

    
    -- Salidas
    MuxR: Mux256a18Bits port map (Reg0x, Reg1x, Reg2x, Reg3x, Reg4x, Reg5x, Reg6x, Reg7x,
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
    



  Q <= Ax;


end architecture;




    

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux256a1 is
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
        d240, d241, d242, d243, d244, d245, d246, d247, d248, d249, d250, d251, d252, d253, d254, d255: in std_logic;
        S: in std_logic_vector (7 downto 0);
        r: out std_logic
    );
end Mux256a1;

architecture Ar_Mux256a1 of Mux256a1 is
    begin 
        -- r and(D(0)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0))) or) or
        --     (D(1)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0)) or 
        --     (D(2)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0))) or 
        --     (D(3)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0)) or 
        --     (D(4)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and     S(2)  and not(S(1)) and not(S(0))) or 
        --     (D(5)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and     S(2)  and not(S(1)) and      S(0)) or 
        --     (D(6)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and     S(2)  and     S(1)  and not(S(0))) or
        --     (D(7)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and     S(2)  and     S(1)  and      S(0)) or
        --     (D(8)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and     S(3)  and not(S(2)) and not(S(1)) and not(S(0))) or
        --     (D(9)  and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and     S(3)  and not(S(2)) and not(S(1)) and      S(0)) or
        --     (D(10) and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and     S(3)  and not(S(2)) and     S(1)  and not(S(0))) or
        --     (D(11) and not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and     S(3)  and not(S(2)) and     S(1)  and      S(0)) or

    r <= (d0   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d1   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d2   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d3   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d4   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d5   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d6   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d7   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d8   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d9   and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d10  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d11  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d12  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d13  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d14  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d15  and (not(S(7)) and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d16  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d17  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d18  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d19  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d20  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d21  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d22  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d23  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d24  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d25  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d26  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d27  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d28  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d29  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d30  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d31  and (not(S(7)) and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d32  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d33  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d34  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d35  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d36  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d37  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d38  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d39  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d40  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d41  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d42  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d43  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d44  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d45  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d46  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d47  and (not(S(7)) and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d48  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d49  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d50  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d51  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d52  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d53  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d54  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d55  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d56  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d57  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d58  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d59  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d60  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d61  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d62  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d63  and (not(S(7)) and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d64  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d65  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d66  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d67  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d68  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d69  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d70  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d71  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d72  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d73  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d74  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d75  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d76  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d77  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d78  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d79  and (not(S(7)) and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d80  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d81  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d82  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d83  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d84  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d85  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d86  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d87  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d88  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d89  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d90  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d91  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d92  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d93  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d94  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d95  and (not(S(7)) and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d96  and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d97  and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d98  and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d99  and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d100 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d101 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d102 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d103 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d104 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d105 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d106 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d107 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d108 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d109 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d110 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d111 and (not(S(7)) and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d112 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d113 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d114 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d115 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d116 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d117 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d118 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d119 and (not(S(7)) and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d120 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d121 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d122 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d123 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d124 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d125 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d126 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d127 and (not(S(7)) and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d128 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d129 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d130 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d131 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d132 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d133 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d134 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d135 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d136 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d137 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d138 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d139 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d140 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d141 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d142 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d143 and (S(7)      and not(S(6)) and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d144 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d145 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d146 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d147 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d148 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d149 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d150 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d151 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d152 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d153 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d154 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d155 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d156 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d157 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d158 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d159 and (S(7)      and not(S(6)) and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d160 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d161 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d162 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d163 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d164 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d165 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d166 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d167 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d168 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d169 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d170 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d171 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d172 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d173 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d174 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d175 and (S(7)      and not(S(6)) and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d176 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d177 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d178 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d179 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d180 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d181 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d182 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d183 and (S(7)      and not(S(6)) and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d184 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d185 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d186 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d187 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d188 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d189 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d190 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d191 and (S(7)      and not(S(6)) and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d192 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d193 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d194 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d195 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d196 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d197 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d198 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d199 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d200 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d201 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d202 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d203 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d204 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d205 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d206 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d207 and (S(7)      and S(6)      and not(S(5)) and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d208 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d209 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d210 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d211 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d212 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d213 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d214 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d215 and (S(7)      and S(6)      and not(S(5)) and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d216 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d217 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d218 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d219 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d220 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d221 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d222 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d223 and (S(7)      and S(6)      and not(S(5)) and S(4)      and S(3)      and S(2)      and S(1)      and S(0))) or
         (d224 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d225 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d226 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d227 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d228 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d229 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d230 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d231 and (S(7)      and S(6)      and S(5)      and not(S(4)) and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d232 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d233 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d234 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d235 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d236 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d237 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d238 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d239 and (S(7)      and S(6)      and S(5)      and not(S(4)) and S(3)      and S(2)      and S(1)      and S(0))) or
         (d240 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d241 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and not(S(1)) and S(0))) or
         (d242 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and not(S(0)))) or
         (d243 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and not(S(2)) and S(1)      and S(0))) or
         (d244 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and not(S(0)))) or
         (d245 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and not(S(1)) and S(0))) or
         (d246 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and not(S(0)))) or
         (d247 and (S(7)      and S(6)      and S(5)      and S(4)      and not(S(3)) and S(2)      and S(1)      and S(0))) or
         (d248 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and not(S(0)))) or
         (d249 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and not(S(1)) and S(0))) or
         (d250 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and not(S(0)))) or
         (d251 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and not(S(2)) and S(1)      and S(0))) or
         (d252 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and not(S(0)))) or
         (d253 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and not(S(1)) and S(0))) or
         (d254 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and not(S(0)))) or
         (d255 and (S(7)      and S(6)      and S(5)      and S(4)      and S(3)      and S(2)      and S(1)      and S(0)));

end architecture Ar_Mux256a1;

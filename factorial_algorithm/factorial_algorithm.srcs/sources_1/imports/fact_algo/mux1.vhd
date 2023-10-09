library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1 is
    port(   inp1,inp2 : in std_logic_vector(2 downto 0);
            sel : in std_logic;
            outp : out std_logic_vector(2 downto 0));
end mux1;

architecture Behavioral of mux1 is
begin
    with (sel) select
        outp <= inp1 when '0',
                inp2 when '1',
                "000" when others;

end Behavioral;

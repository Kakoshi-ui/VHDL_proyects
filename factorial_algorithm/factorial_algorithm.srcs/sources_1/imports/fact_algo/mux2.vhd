library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    port(   inp1,inp2 : in std_logic_vector(15 downto 0);
            sel : in std_logic;
            outp : out std_logic_vector(15 downto 0));
end mux2;

architecture Behavioral of mux2 is
begin
    with (sel) select
        outp <= inp1 when '0',
                inp2 when '1',
                X"0000" when others;

end Behavioral;

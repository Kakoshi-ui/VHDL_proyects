library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity doorlock is
    port(   clk : in std_logic;
            clr : in std_logic;
            code_c : in std_logic_vector (7 downto 0);
            input : in std_logic_vector (2 downto 0);
            pass : out std_logic;
            fail : out std_logic);
end doorlock;

architecture Behavioral of doorlock is
signal input_fix: std_logic_vector (1 downto 0);
signal code : std_logic_vector (7 downto 0);

begin
    with (input) select
        input_fix <=    "00" when "001",
                        "01" when "010",
                        "10" when "100",
                        "11" when others;
    process (input_fix)
    begin
        
    end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_tb is
end comparator_tb;

architecture Behavioral of comparator_tb is
signal inp1,inp2 : std_logic_vector (2 downto 0);
signal g,e,l : std_logic;

begin
    uut: entity work.comparator port map(inp1,inp2,g,e,l);
    
    stimulus: process
    begin
        inp1 <= "111";
        inp2 <= "001";
        wait for 20 us;
        
        inp1 <= "001";
        wait for 20 us;
        
        inp1 <= "000";
        wait for 20 us;
    end process;

end Behavioral;

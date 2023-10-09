library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity substractor_tb is
end substractor_tb;

architecture Behavioral of substractor_tb is
signal x,out_subs : std_logic_vector (2 downto 0);

begin
    uut: entity work.substractor port map(x,out_subs);
    
    stimulus: process
    begin
        x <= "111";
        wait for 20 us;
        
        x <= "110";
        wait for 20 us;
    end process;

end Behavioral;

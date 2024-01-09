library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dvd_image120x120_tb is
end dvd_image120x120_tb;

architecture Behavioral of dvd_image120x120_tb is
signal addr: std_logic_vector (15 downto 0);
signal clk: std_logic;
signal dout: std_logic_vector (11 downto 0);

begin
    uut: entity work.dvd_image120x120_wrapper port map(addr, clk, dout);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        
        clk <= '1';
        wait for 20 ns;
    end process clock;
    
    stimulus: process
    begin
        addr <= (others => '0');
        wait for 200 us;
        
        addr <= "0000000000000001";
        wait for 200 us;
        
        addr <= "0000000000000010";
        wait for 200 us;
        
        addr <= "0000000000000011";
        wait for 200 us;
        
        addr <= "0000000000000100";
        wait for 200 us;
    end process;
end Behavioral;

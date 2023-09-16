library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockpulse_tb is
end clockpulse_tb;

architecture Behavioral of clockpulse_tb is
signal cclk : std_logic;
signal clr : std_logic;
signal inp : std_logic_vector (2 downto 0);
signal outp : std_logic;

begin
uut: 
entity work.clockpulse port map(cclk,clr,inp,outp);

clock: process
    begin
    cclk <= '0';
    wait for 3 ms;
    
    cclk <= '1';
    wait for 3 ms;
end process clock;

stimulus: process
    begin
    clr <= '1';
    wait for 500 ns;
    
    clr <= '0';
    inp <= "000";
    wait for 50 ms;
    
    clr <= '0';
    inp <= "001";
    wait for 50 ms;
    inp <= "000";
    wait for 50 ms;
    
    clr <= '0';
    inp <= "010";
    wait for 50 ms;
    inp <= "000";
    wait for 50 ms;
    
    clr <= '0';
    inp <= "100";
    wait for 50 ms;
    inp <= "000";
    wait for 50 ms;
    
    clr <= '1';
    inp <= "100";
    wait for 50 ms;
    inp <= "000";
    wait for 50 ms;
end process stimulus;

end Behavioral;

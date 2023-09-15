library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_7seg_tb is
end mux_7seg_tb;

architecture Behavioral of mux_7seg_tb is
signal clk : std_logic;
signal rst : std_logic;
signal in_mux3 : std_logic_vector (6 downto 0);
signal in_bcd_lett : std_logic_vector (6 downto 0);
signal s_to_disp : std_logic_vector (6 downto 0);
signal an : std_logic_vector (3 downto 0);
 
begin 
uut: 
entity work.mux_7seg port map(clk,rst,in_mux3,in_bcd_lett,s_to_disp,an);

clock: process
    begin
    clk <= '0';
    wait for 10 ns;
    
    clk <= '1';
    wait for 10 ns;
end process clock;

stimulus: process
    begin
    rst <= '1';
    in_mux3 <= "0000000";
    in_bcd_lett <= "0000000";
    wait for 20 ns;
    
    rst <= '0';
    in_mux3 <= "0011010";
    in_bcd_lett <= "0011110";
    wait for 1000 ms;
    
end process stimulus;

end Behavioral;

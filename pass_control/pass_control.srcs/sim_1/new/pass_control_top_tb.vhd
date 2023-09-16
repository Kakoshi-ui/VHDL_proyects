library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pass_control_top_tb is
end pass_control_top_tb;

architecture Behavioral of pass_control_top_tb is
signal CLK : std_logic;
signal CLR : std_logic;
signal PASSWORD : std_logic_vector (7 downto 0);
signal IN_BTNS : std_logic_vector (2 downto 0);
signal FAIL : std_logic;
signal PASS : std_logic;

begin
uut:
entity work.pass_control_top port map(CLK,CLR,PASSWORD,IN_BTNS,FAIL,PASS);

clock: process
    begin
    CLK <= '0';
    wait for 5 ns;
    CLK <= '1';
    wait for 5 ns;
end process clock;

stimulus: process
    begin
    
    PASSWORD <= "00010110";
    
    CLR <= '1';
    IN_BTNS <= "000";
    wait for 50 ms;
-- Caso incorrecto:
    CLR <= '0';
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "100";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    
--Caso corecto:
    CLR <= '1';
    IN_BTNS <= "000";
    wait for 50 ms;
    
    CLR <= '0';
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "001";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "100";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    
-- Ruta correcta pero fallo al final:
    CLR <= '1';
    IN_BTNS <= "000";
    wait for 50 ms;
    
    CLR <= '0';
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "001";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "001";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    
--huecos de espera:
    CLR <= '1';
    IN_BTNS <= "000";
    wait for 50 ms;
    
    CLR <= '0';
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "001";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 100 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 200 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "010";
    wait for 50 ms;
    
    IN_BTNS <= "000";
    wait for 50 ms;
    IN_BTNS <= "100";
    wait for 50 ms;
end process stimulus;
end Behavioral;

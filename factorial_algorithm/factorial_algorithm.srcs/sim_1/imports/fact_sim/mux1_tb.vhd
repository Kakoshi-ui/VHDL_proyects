library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1_tb is
end mux1_tb;

architecture Behavioral of mux1_tb is
signal inp1,inp2 : std_logic_vector (2 downto 0);
signal sel: std_logic;
signal outp : std_logic_vector (2 downto 0);

begin
    uut: entity work.mux1 port map(inp1,inp2,sel,outp);
    
    stimulus: process
    begin
        inp1 <= "100";
        inp2 <= "111";
        sel <= '0';
        wait for 10 us;
        
        sel <= '1';
        wait for 10 us;
    end process;
end Behavioral;

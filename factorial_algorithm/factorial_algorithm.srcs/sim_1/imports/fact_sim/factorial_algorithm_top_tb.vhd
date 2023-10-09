library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity factorial_algorithm_top_tb is
end factorial_algorithm_top_tb;

architecture Behavioral of factorial_algorithm_top_tb is
signal CLK : std_logic;
signal CLR : std_logic;
signal GO : std_logic;
signal X : std_logic_vector (2 downto 0);
signal A_TO_G : std_logic_vector (6 downto 0);
signal AN : std_logic_vector (3 downto 0);

begin
    uut: entity work.factorial_algorithm_top port map(CLK,CLR,GO,X,A_TO_G,AN);
    
    clock: process
    begin
        CLK <= '0';
        wait for 5 ns;
        CLK <= '1';
        wait for 5 ns;
    end process;
    
    stimulus: process
    begin
        --Test con numero 0
        CLR <= '1';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        CLR <= '0';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        GO <= '1';
        wait for 30 ms;
        GO <= '0';
        wait for 200 ms;
    
        --Test con numero 1
        CLR <= '1';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        CLR <= '0';
        GO <= '0';
        X <= "001";
        wait for 20 ms;
        
        GO <= '1';
        wait for 30 ms;
        GO <= '0';
        wait for 200 ms;
        
        --Test con numero 2
        CLR <= '1';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        CLR <= '0';
        GO <= '0';
        X <= "010";
        wait for 20 ms;
        
        GO <= '1';
        wait for 30 ms;
        GO <= '0';
        wait for 200 ms;
        
        --Test con numero 3
        CLR <= '1';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        CLR <= '0';
        GO <= '0';
        X <= "011";
        wait for 20 ms;
        
        GO <= '1';
        wait for 30 ms;
        GO <= '0';
        wait for 200 ms;
        
        --Test con numero 4
        CLR <= '1';
        GO <= '0';
        X <= "000";
        wait for 20 ms;
        
        CLR <= '0';
        GO <= '0';
        X <= "100";
        wait for 20 ms;
        
        GO <= '1';
        wait for 30 ms;
        GO <= '0';
        wait for 200 ms;
    end process;
end Behavioral;

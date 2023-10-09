library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_tb is
end mux2_tb;

architecture Behavioral of mux2_tb is
signal inp1,inp2,outp : std_logic_vector (15 downto 0);
signal sel : std_logic;

begin
    uut: entity work.mux2 port map(inp1,inp2,sel,outp);
    
    stimulus: process
    begin
        inp1 <= X"0015";
        inp2 <= X"0014";
        sel <= '0';
        wait for 10 us;
        
        sel <= '1';
        wait for 10 us;
    end process;

end Behavioral;

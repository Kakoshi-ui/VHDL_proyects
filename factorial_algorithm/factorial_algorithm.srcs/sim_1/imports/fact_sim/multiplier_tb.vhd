library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_tb is
end multiplier_tb;

architecture Behavioral of multiplier_tb is
signal clk : std_logic;
signal clr_mult : std_logic;
signal go_mult : std_logic;
signal multiplicando : std_logic_vector (15 downto 0);
signal multiplicador : std_logic_vector (2 downto 0);
signal done_mult : std_logic;
signal producto : std_logic_vector (15 downto 0);

begin
    uut: entity work.multiplier port map(clk,clr_mult,go_mult,multiplicando,multiplicador,done_mult,producto);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;
    
    stimulus: process
    begin
        clr_mult <= '1';
        multiplicando <= X"0001";
        multiplicador <= "111";
        go_mult <= '0';
        wait for 50 ns;
        
        clr_mult <= '0';
        go_mult <= '1';
        wait for 1000 ns;
        go_mult <= '0';
        wait for 1000 ns;
        
    end process;
end Behavioral;

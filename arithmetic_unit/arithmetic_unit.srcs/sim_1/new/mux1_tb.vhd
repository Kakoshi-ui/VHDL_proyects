library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux1_tb is
end mux1_tb;

architecture Behavioral of mux1_tb is
signal in_sum : std_logic_vector (7 downto 0);
signal in_res : std_logic_vector (7 downto 0);
signal in_b : std_logic_vector (7 downto 0);
signal sel : std_logic_vector (2 downto 0);
signal s_mux : std_logic_vector (7 downto 0);

begin
uut:
entity work.mux1 port map(in_sum,in_res,in_b,sel,s_mux);

stimulus:
process
    begin
    in_sum <= "00011001";
    in_res <= "00111101";
    in_b <= "00001001";
    sel <= "000";
    wait for 10 ns;
    
    in_sum <= "00011001";
    in_res <= "00111101";
    in_b <= "00001011";
    sel <= "001";
    wait for 10 ns;
    
    in_sum <= "00011001";
    in_res <= "00111101";
    in_b <= "00001011";
    sel <= "010";
    wait for 10 ns;
    
end process;
end Behavioral;

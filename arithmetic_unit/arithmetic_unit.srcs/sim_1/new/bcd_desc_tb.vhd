library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_desc_tb is
end bcd_desc_tb;

architecture Behavioral of bcd_desc_tb is
signal s_mux2 : std_logic_vector (3 downto 0);
signal s_bcd_dec : std_logic_vector (6 downto 0);

begin
uut:
entity work.bcd_desc port map(s_mux2,s_bcd_dec);

stimulus:
process
    begin
    s_mux2 <= "0000";
    wait for 10 ns;
    
    s_mux2 <= "0001";
    wait for 10 ns;
    
    s_mux2 <= "0010";
    wait for 10 ns;
    
    s_mux2 <= "0011";
    wait for 10 ns;
    
    s_mux2 <= "0100";
    wait for 10 ns;
    
    s_mux2 <= "0101";
    wait for 10 ns;
    
    s_mux2 <= "0110";
    wait for 10 ns;
    
    s_mux2 <= "0111";
    wait for 10 ns;
    
    s_mux2 <= "1000";
    wait for 10 ns;
    
    s_mux2 <= "1001";
    wait for 10 ns;
    
    s_mux2 <= "1011";
    wait for 10 ns;
    
    s_mux2 <= "1111";
    wait for 10 ns;
end process;

end Behavioral;

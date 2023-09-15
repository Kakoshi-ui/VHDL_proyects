library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;    

entity bcd_unit_tb is
end bcd_unit_tb;

architecture Behavioral of bcd_unit_tb is
signal s_mux1 : std_logic_vector (3 downto 0);
signal s_bcd_unit : std_logic_vector (6 downto 0);

begin
uut:
entity work.bcd_unit port map(s_mux1,s_bcd_unit);

stimulus:
process
    begin
    
    s_mux1 <= "0000";
    wait for 10 ns;
    
    s_mux1 <= "0001";
    wait for 10 ns;
    
    s_mux1 <= "0010";
    wait for 10 ns;
    
    s_mux1 <= "0011";
    wait for 10 ns;
    
    s_mux1 <= "0100";
    wait for 10 ns;
    
    s_mux1 <= "0101";
    wait for 10 ns;
    
    s_mux1 <= "0110";
    wait for 10 ns;
    
    s_mux1 <= "0111";
    wait for 10 ns;
    
    s_mux1 <= "1000";
    wait for 10 ns;
    
    s_mux1 <= "1001";
    wait for 10 ns;
end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux3_tb is
end mux3_tb;

architecture Behavioral of mux3_tb is
signal in_bcd_unit : std_logic_vector (6 downto 0);
signal in_bcd_lett : std_logic_vector (6 downto 0);
signal sel : std_logic_vector (2 downto 0);
signal sal_mux : std_logic_vector (6 downto 0);

begin
uut:
entity work.mux3 port map(in_bcd_unit,in_bcd_lett,sel,sal_mux);

stimulus:
process
    begin
    in_bcd_unit <= "0110001";
    in_bcd_lett <= "1110001";
    sel <= "000";
    wait for 10 ns;
    
    in_bcd_unit <= "0110001";
    in_bcd_lett <= "1110001";
    sel <= "001";
    wait for 10 ns;
    
    in_bcd_unit <= "0110001";
    in_bcd_lett <= "1110001";
    sel <= "010";
    wait for 10 ns;
    
    in_bcd_unit <= "0110001";
    in_bcd_lett <= "1110001";
    sel <= "100";
    wait for 10 ns;
end process;

end Behavioral;

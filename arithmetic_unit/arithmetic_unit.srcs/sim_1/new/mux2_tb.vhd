library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2_tb is
end mux2_tb;

architecture Behavioral of mux2_tb is
signal in_desc : std_logic_vector (3 downto 0);
signal in_a : std_logic_vector (3 downto 0);
signal sel : std_logic_vector (2 downto 0);
signal s_mux2 : std_logic_vector (3 downto 0);

begin
uut:
entity work.mux2 port map(in_desc,in_a,sel,s_mux2);

stimulus:
process
    begin
    in_desc <= "0011";
    in_a <= "0111";
    sel <= "000";
    wait for 10 ns;
    
    in_desc <= "0011";
    in_a <= "0111";
    sel <= "001";
    wait for 10 ns;
    
    in_desc <= "0011";
    in_a <= "0111";
    sel <= "010";
    wait for 10 ns;
    
    in_desc <= "0011";
    in_a <= "0111";
    sel <= "100";
    wait for 10 ns;
    
    wait for 10 ns;
end process;

end Behavioral;

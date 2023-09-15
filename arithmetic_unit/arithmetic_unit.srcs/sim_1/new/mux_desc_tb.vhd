library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_desc_tb is
end mux_desc_tb;

architecture Behavioral of mux_desc_tb is

signal selec: std_logic_vector (2 downto 0);
signal i_dec_dec: std_logic_vector (6 downto 0);
signal i_dec_bcd: std_logic_vector (6 downto 0);
signal s_disp_desc: std_logic_vector (6 downto 0);

begin
uut:
entity work.mux_desc port map(selec,i_dec_dec,i_dec_bcd,s_disp_desc);

stimulus:
process
	begin
	i_dec_dec <= "0000001";
	i_dec_bcd <= "0000010";
	selec <= "000";
	wait for 10 ns;
	
	i_dec_dec <= "0000001";
	i_dec_bcd <= "0000010";
	selec <= "001";
	wait for 10 ns;
	
	i_dec_dec <= "0000001";
	i_dec_bcd <= "0000010";
	selec <= "010";
	wait for 10 ns;
	
	i_dec_dec <= "0000001";
	i_dec_bcd <= "0000010";
	selec <= "100";
	wait for 10 ns;
end process;


end Behavioral;

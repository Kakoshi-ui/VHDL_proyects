library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity substractor is
	port(	a: in std_logic_vector (3 downto 0);
			b: in std_logic_vector (3 downto 0);
			s: out std_logic_vector (7 downto 0));
end substractor;

architecture Behavioral of substractor is
signal resta: std_logic_vector (4 downto 0);
signal comp_b: std_logic_vector (3 downto 0);
signal brw : std_logic;
signal temp : std_logic_vector (4 downto 0);
signal complete : std_logic_vector (7 downto 0);

begin
	comp_b <= (not b)+1;
	resta <= ('0'&a)+comp_b;
	brw <= '1' when (resta(4) = '0') else '0';
	temp <= ((not resta)+1) when brw = '1' else resta;
	complete <= '1'&brw&'1'&temp;
	s <= complete;
	
end Behavioral;

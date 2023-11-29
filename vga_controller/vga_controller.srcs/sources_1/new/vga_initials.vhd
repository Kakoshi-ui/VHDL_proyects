library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity vga_initials is
	port(	vidon : in std_logic;
			hc : in std_logic_vector(10 downto 0);
			vc : in std_logic_vector(9 downto 0);
			M : in std_logic_vector (0 to 39);
			sw : in std_logic_vector (7 downto 0);
			rom_addr4 : out std_logic_vector(3 downto 0);
			red : out std_logic_vector(3 downto 0);
			green : out std_logic_vector(3 downto 0);
			blue : out std_logic_vector(3 downto 0));
end vga_initials;

architecture Behavioral of vga_initials is
constant hbp : std_logic_vector (9 downto 0) := "0011110000";
--hbp = SP+BP=80+160=240
constant vbp : std_logic_vector (9 downto 0) := "0000011000";
--vbp = SP+BP=3+21=24

--iniciales**************************************************
constant w: integer := 40;
--ancho
constant h: integer := 16;
--alto
signal C1, R1: std_logic_vector(10 downto 0);
--Columna, renglon de posicion superior-izq
signal rom_addr, rom_pix: std_logic_vector(10 downto 0);
--renglon columna del bit en la pantalla
signal spriteon: std_logic;
--determina si esta en la region 16x40
signal r, g, b: std_logic;

begin
	--columna y renglon con los switches
	C1 <= "00" & sw(3 downto 0) & "00001";
	R1 <= "00" & sw(7 downto 4) & "00001";
	rom_addr <= vc - vbp - R1;
	rom_pix <= hc - hbp - C1;
	rom_addr4 <= rom_addr (3 downto 0);
	--spriteon = "1" si esta en el area de la imagen
	spriteon <= '1' when (((hc >= C1 + hbp) and (hc < C1 + hbp + w))
	and ((vc >= R1 + vbp) and (vc < R1 +vbp + h))) else '0';
	
	process (spriteon, vidon, rom_pix, M, r, g, b)
	variable j: integer;
	begin
		red <= "0000";
		green <= "0000";
		blue <= "0000";
		if(spriteon = '1' and vidon = '1') then
			j := conv_integer(rom_pix);
			r <= M(j);
			g <= M(j);
			b <= M(j);
			red <= r & r & r & r;
			green <= g & g & g & g;
			blue <= b & b & b & b;
		end if;
	end process;
end Behavioral;

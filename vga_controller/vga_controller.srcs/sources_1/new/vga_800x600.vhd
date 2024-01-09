library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity vga_800x600 is
	port ( 	clk, clr : in std_logic;
			hsync : out std_logic;
			vsync : out std_logic;
			hc : out std_logic_vector(10 downto 0);
			vc : out std_logic_vector(9 downto 0);
			vidon : out std_logic);
end vga_800x600;

architecture Behavioral of vga_800x600 is
--Horizontal timing--
constant hbp : std_logic_vector(9 downto 0) := "0011011000"; --HBP = SP+BP = 128+88 = 216
constant hfp : std_logic_vector(9 downto 0) := "1111111000"; --HFP = HBP+HV = 216+800 = 1040
constant hpixels : std_logic_vector(10 downto 0) := "10000100000"; --quantity of pixels on Horizontal
--line = SP+BP+HV+FP = 128+88+800+40 = 1056

--Vertical timing--
constant vbp : std_logic_vector(9 downto 0) := "0000011011"; --VBP = SP+BP = 4+23 = 27
constant vfp : std_logic_vector(9 downto 0) := "1001110011"; --VFP = VBP+VV = 27+600 = 627
constant vlines : std_logic_vector(9 downto 0) := "1001110100"; --quantity of vertical
--lines on display = SP+BP+VV+FP = 4+23+600+1 = 628

signal hcs: std_logic_vector (10 downto 0);
signal vcs : std_logic_vector(9 downto 0); --horizontal and vertical counters
signal vsenable: std_logic; --vertical counter enable

begin
	--horizontal counter syncronization signal 
	process(clk,clr)
	begin
		if(clr = '1') then
			hcs <= "00000000000";
		elsif (rising_edge(clk)) then
			if(hcs = hpixels - 1) then --counter has reached end of count ?
				hcs <= "00000000000"; --reset
				vsenable <= '1'; --set flag to go vertical counter
			else
				hcs <= hcs + 1; --increment horizontal counter
				vsenable <= '0'; --clear vertical counter flag
			end if;
		end if;
	end process;
	hsync <= '0' when (hcs < 216) else '1';

	--vertical counter syncronization signal
	process (clk, clr, vsenable)
	begin
		if(clr = '1') then
			vcs <= "0000000000";
		elsif(rising_edge(clk) and (vsenable = '1')) then
			if(vcs = vlines - 1) then
				vcs <= "0000000000"; --reset
			else
				vcs <= vcs + 1; --increment vertical counter
			end if;
		end if;
	end process;
	vsync <= '0' when (vcs < 27) else '1'; --SP=0 when vc<2 lines
	vidon <= '1' when (((hcs < hfp) and (hcs >= hbp)) and ((vcs < vfp) and (vcs >=vbp))) else '0';
	--set video on when visible area
	
	--horizontal and vertical counters update
	hc <= hcs;
	vc <= vcs;
end Behavioral;
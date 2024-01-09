library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.std_logic_arith.ALL;

entity vga_initials_tb is
end vga_initials_tb;

architecture Behavioral of vga_initials_tb is
signal vidon: std_logic;
signal hc: std_logic_vector(10 downto 0);
signal vc: std_logic_vector(9 downto 0);
signal M: std_logic_vector(0 to 39);
signal sw: std_logic_vector(7 downto 0);
signal rom_addr4: std_logic_vector(3 downto 0);
signal red: std_logic_vector(3 downto 0);
signal green: std_logic_vector(3 downto 0);
signal blue: std_logic_vector(3 downto 0);
signal clk: std_logic;
signal vsenable: std_logic;

begin
    uut: entity work.vga_initials port map(vidon, hc, vc, M, sw, rom_addr4, red, green, blue);

    clock: process
    begin
        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        wait for 10 ns;
    end process;

    
end Behavioral;

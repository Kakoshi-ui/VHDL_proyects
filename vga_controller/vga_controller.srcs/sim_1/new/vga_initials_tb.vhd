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
    uut: entity work.vga_initials port map(
        vidon,
        hc,
        vc,
        M,
        sw,
        rom_addr4,
        red,
        green,
        blue
    );

    clock: process
    begin
        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        wait for 10 ns;
    end process;

    horizontal_count: process(clk)
    begin
        if (rising_edge(clk)) then
            if(hc = "10000011111") then
                hc <= "00000000000";
                vsenable <= '1';
            else
                hc <= hc + 1;
            end if;
        end if;
    end process;

    vertical_count: process(clk, vsenable)
    begin
        if(rising_edge(clk) and vsenable = '1') then
            if(vc = "1001101111") then
                vc <= "0000000000";
            else
                vc <= vc + 1;
            end if;
        end if;
    end process;

    vidon <= '1' when (((hc < "10000010000")and(hc > "0011110000"))
    and((vc < "1001110011")and(vc > "0000011011")));

    stimulus: process
    begin
        sw <= "00000000";
        M <= x"038300C1F8";

        sw <= "00000000";
        M <= x"038380C3F3";

    end process;
end Behavioral;

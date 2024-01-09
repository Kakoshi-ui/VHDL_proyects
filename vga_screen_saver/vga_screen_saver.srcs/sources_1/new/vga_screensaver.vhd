library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_screensaver is
    port(   M:      in std_logic_vector (11 downto 0);
            hc:     in std_logic_vector (9 downto 0);
            vc:     in std_logic_vector (9 downto 0);
            vidon:  in std_logic;
            C1:     in std_logic_vector (9 downto 0);
            R1:     in std_logic_vector (9 downto 0);
            addr:   out std_logic_vector(15 downto 0);
            red:    out std_logic_vector (3 downto 0);
            green:  out std_logic_vector (3 downto 0);
            blue:   out std_logic_vector (3 downto 0));
end vga_screensaver;

architecture Behavioral of vga_screensaver is
--video timing:
constant hbp: std_logic_vector(9 downto 0) := "0010010000";
constant vbp:std_logic_vector(9 downto 0) := "0000011001";

--Image dimensions, image=240x240
constant im_width: std_logic_vector (9 downto 0):= "0011110000";
constant im_height: std_logic_vector (9 downto 0):= "0011110000";

--memory control signals:
signal rom_addr: std_logic_vector (15 downto 0);
signal rom_pix: std_logic_vector (11 downto 0);

--color:
signal r: std_logic_vector (3 downto 0);
signal g: std_logic_vector (3 downto 0);
signal b: std_logic_vector (3 downto 0);

--video show enable
signal spriteon: std_logic;

begin

    rom_addr <= vc+
    
    spriteon <= '1' when ((hc>=(C1+hbp))and(hc<(C1+hbp+im_width))) and 
                        ((vc>=(R1+vbp))and(vc<=(R1+vbp+im_height))) else '0';
    
    process(vidon, spriteon)
    variable j: integer;
    begin
        if(vidon = '1' and spriteon = '1') then
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_driver is
    port(   clk_25M: in std_logic;
            clr: in std_logic;
            hsync: out std_logic;
            vsync: out std_logic;
            hc: out std_logic_vector (9 downto 0);
            vc: out std_logic_vector (9 downto 0);
            vid_enable: out std_logic);
end vga_driver;

architecture Behavioral of vga_driver is
--tiempo horizontal
constant h_bp: std_logic_vector (9 downto 0) := "0010010000"; -- h_bp=sp+bp = 96+48 = 144
constant h_vis: std_logic_vector (9 downto 0) := "1010000000"; -- area visible horizontal = 640
constant h_line: std_logic_vector (9 downto 0) := "1100100000"; --Tiempo total para una linea vertical: sp+bp+h_vis+fp
-- Linea total: 96+48+640+16 = 800

--tiempo vertical
constant v_bp: std_logic_vector (9 downto 0) := "0000011001"; -- v_bp=sp+bp=2+33=25
constant v_vis: std_logic_vector (9 downto 0) := "0111100000"; -- area visible vertical = 480
constant v_line: std_logic_vector (9 downto 0) := "1000001101"; -- tiempo total para todas las lineas: sp+bp+v_vis+fp
-- Linea total: 2+33+480+10=525

-- Contadores
signal hor_count: std_logic_vector (9 downto 0);
signal ver_count: std_logic_vector (9 downto 0);
signal v_en: std_logic;

begin
-- contador horizontal
    process (clk_25M, clr, hor_count)
    begin
        if(clr = '1') then              
            hor_count <= (others => '0');
        elsif(rising_edge(clk_25M)) then
            if(hor_count = h_line) then
                hor_count <= (others => '0');
                v_en <= '1';
            else
                hor_count <= hor_count + 1;
                v_en <= '0';
            end if;
        end if;
    end process;
    hsync <= '0' when ((hor_count < h_bp) or (hor_count > (h_bp + h_vis))) else '1';
    
-- contador vertical
    process(clk_25M, clr, v_en)
    begin
        if(clr = '1') then
            ver_count <= (others => '0');
        elsif(rising_edge(clk_25M) and (v_en = '1')) then
            if(ver_count = v_line) then
                ver_count <= (others => '0');
            else
                ver_count <= ver_count + 1;
            end if;
        end if;
    end process;
    
    vsync <= '0' when ((ver_count < v_bp) or (ver_count >= (v_bp + v_vis))) else '1';
    vid_enable <= '1' when ((hor_count > h_bp) and (hor_count < (h_bp + h_vis))
                            and (ver_count > v_bp) and (ver_count < (v_bp + v_vis))) else '0';
    
    hc <= hor_count;
    vc <= ver_count;
    
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_7seg is
    port(   clk : in std_logic;
            rst : in std_logic;
            in_mux3 : in std_logic_vector (6 downto 0);
            in_bcd_lett : in std_logic_vector (6 downto 0);
            s_to_disp : out std_logic_vector (6 downto 0);
            an : out std_logic_vector (3 downto 0));
end mux_7seg;

architecture Behavioral of mux_7seg is
signal clk190 : std_logic := '0';
signal counter1 : std_logic_vector (17 downto 0);

begin
    --Divisor de frecuencia
    clock: process(clk,rst)
        begin
        if (rst = '1') then
            counter1 <= (others => '0');
        elsif (clk'event and clk = '1') then
            counter1 <= counter1+1;
            if (counter1(17) = '1') then
                clk190 <= not clk190;
                counter1 <= (others => '0');
            end if;
        end if;
    end process clock;
    
    with (clk190) select
        s_to_disp <=    in_mux3 when '0',
                        in_bcd_lett when '1',
                        "1111111" when others;
    
    with (clk190) select
        an <=   "1110" when '0',
                "1101" when '1',
                "1111" when others;

end Behavioral;

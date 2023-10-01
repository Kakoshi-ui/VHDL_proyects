library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity gcd3 is
    port(   clk : in std_logic;
            clr : in std_logic;
            go : in std_logic;
            xin : in std_logic_vector (3 downto 0);
            yin : in std_logic_vector (3 downto 0);
            done : out std_logic;
            gcd : out std_logic_vector (15 downto 0));
end gcd3;

architecture Behavioral of gcd3 is
    signal x,y : std_logic_vector (3 downto 0);
begin
    algoritmo_gcd: process(clk,clr)
    variable calc, donev : std_logic;
    begin
        if (clr = '1') then
            x <= (others => '0');
            y <= (others => '0');
            gcd <= (others => '0');
            donev := '0';
            calc := '0';
        elsif (rising_edge(clk)) then
            donev := '0';
            if (go = '1') then
                x <= xin;
                y <= yin;
                calc := '1';
            elsif (calc = '1') then
                if (x = y) then
                    gcd <= X"000"&x;
                    donev := '1';
                    calc := '0';
                elsif (x < y ) then
                    y <= y-x;
                else
                    x <= x-y;
                end if;
            end if;
        end if;
        done <= donev;
    end process algoritmo_gcd;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplier is
    port(   clk : in std_logic;
            clr_mult : in std_logic;
            go_mult : in std_logic;
            multiplicando: in std_logic_vector (15 downto 0);
            multiplicador: in std_logic_vector (2 downto 0);
            done_mult : out std_logic;
            producto : out std_logic_vector (15 downto 0)
        );
end multiplier;

architecture Behavioral of multiplier is
signal x,res : std_logic_vector (15 downto 0);
signal y : std_logic_vector (2 downto 0);

begin
    multiplication: process(clk,clr_mult)
    variable calc,donev : std_logic;
    begin
        if (clr_mult = '1') then
            x <= (others => '0');
            y <= (others => '0');
            res <= (others => '0');
            calc := '0';
            donev := '0';
        elsif (rising_edge(clk)) then
            donev := '0';
            if (go_mult = '1') then
                x <= multiplicando;
                y <= multiplicador;
                calc := '1';
            elsif (calc = '1') then
                if (y > "000") then
                    res <= res+x;
                    y <= y-"001";
                elsif (y = "000") then
                    producto <= res;
                    donev := '1';
                    calc := '1';
                else
                    producto <= (others => '0');
                end if;
            end if;
        end if;
        done_mult <= donev;
    end process multiplication;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debounce4 is
    port(   cclk,clr : std_logic;
            inp : in std_logic;
            outp : out std_logic);
end debounce4;

architecture Behavioral of debounce4 is
signal delay1, delay2, delay3 : std_logic;

begin
process(cclk,clr)
    begin
    if clr = '1' then
        delay1 <= '0';
        delay2 <= '0';
        delay3 <= '0';
    elsif rising_edge(cclk) then
        delay1 <= inp;
        delay2 <= delay1;
    end if;
end process;
outp <= delay1 and delay2 and delay3;
end Behavioral;
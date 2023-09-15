library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_pulse is
    port(   inp,cclk,clr: in std_logic;
            outp: out std_logic);
end clock_pulse;

architecture Behavioral of clock_pulse is
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
            delay3 <= delay2;
        end if;
    end process;
    outp <= delay1 and delay2 and (not delay3);
end Behavioral;

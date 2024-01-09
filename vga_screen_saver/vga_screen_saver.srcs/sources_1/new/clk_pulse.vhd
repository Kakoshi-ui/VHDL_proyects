library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_pulse is
    port(   clk : in std_logic;
            clr : in std_logic;
            inp : in std_logic;
            outp : out std_logic);
end clk_pulse;

architecture Behavioral of clk_pulse is
signal delay1, delay2, delay3 : std_logic;

begin 
    pulse: process(clk, clr)
    begin
        if (clr = '1') then
            delay1 <= '0';
            delay2 <= '0';
            delay3 <= '0';
        elsif (rising_edge(clk)) then
            delay1 <= inp;
            delay2 <= delay1;
            delay3 <= delay2;
        end if;
    end process pulse;
    outp <= delay1 and delay2 and (not delay3);
end Behavioral;

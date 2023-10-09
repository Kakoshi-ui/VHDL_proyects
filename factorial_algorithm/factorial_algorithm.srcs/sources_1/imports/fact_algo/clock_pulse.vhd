library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_pulse is
    port(   go_start : in std_logic;
            go_mult : in std_logic;
--            clr_mult : in std_logic;
            clk : in std_logic;
            clr : in std_logic;
            go_str_out: out std_logic;
            go_outp : out std_logic
--            clr_m_outp : out std_logic
            );
end clock_pulse;

architecture Behavioral of clock_pulse is
signal delay1,delay2,delay3,delay4,delay5,delay6 : std_logic;
signal delay7,delay8,delay9 : std_logic;

begin
    go_mult_pulse: process (clk,clr)
    begin
        if (clr = '1') then
            delay1 <= '0';
            delay2 <= '0';
            delay3 <= '0';
        elsif (rising_edge(clk)) then
            delay1 <= go_mult;
            delay2 <= delay1;
            delay3 <= delay2;
        end if;
    end process go_mult_pulse;
    go_outp <= delay1 and delay2 and (not delay3);
    
--    clr_mult_pulse: process(clk,clr)
--    begin
--        if (clr = '1') then
--            delay4 <= '0';
--            delay5 <= '0';
--            delay6 <= '0';
--        elsif (rising_edge(clk)) then
--            delay4 <= clr_mult;
--            delay5 <= delay4;
--            delay6 <= delay5;
--        end if;
--    end process;
--    clr_m_outp <= delay4 and delay5 and (not delay6);
    
    start_pulse: process (clk,clr)
    begin
        if (clr = '1') then
            delay7 <= '0';
            delay8 <= '0';
            delay9 <= '0';
        elsif (rising_edge(clk)) then
            delay7 <= go_start;
            delay8 <= delay7;
            delay9 <= delay8;
        end if;
    end process;
    go_str_out <= delay7 and delay8 and (not delay9);
end Behavioral;
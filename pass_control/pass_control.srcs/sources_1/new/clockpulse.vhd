library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockpulse is
    port(   cclk : in std_logic;
            clr : in std_logic;
            inp : in std_logic_vector (2 downto 0);
            outp : out std_logic);
end clockpulse;

architecture Behavioral of clockpulse is
signal inpp : std_logic;
signal delay1, delay2, delay3 : std_logic;

begin
    inpp <= inp(2) or inp(1) or inp(0);

process(cclk,clr)
    begin
    if(clr = '1') then
        delay1 <= '0';
        delay2 <= '0';
        delay3 <= '0';
    elsif (rising_edge(cclk)) then
        delay1 <= inpp;
        delay2 <= delay1;
        delay3 <= delay2;
        outp <= delay1 and delay2 and (not delay3);
    end if;
end process;
end Behavioral;

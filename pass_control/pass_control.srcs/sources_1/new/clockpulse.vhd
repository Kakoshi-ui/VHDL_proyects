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

begin
    inpp <= inp(2) or inp(1) or inp(0);

clock_pulse: process(cclk,clr)
    begin
    if(clr = '1') then
        outp <= '0';
    elsif (inpp = '1') then
        outp <= cclk;
    end if;
end process clock_pulse;
end Behavioral;

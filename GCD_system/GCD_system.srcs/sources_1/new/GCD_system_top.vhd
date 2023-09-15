library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GCD_system_top is
    port(   CLK : in std_logic;
            CLR : in std_logic;
            INP : in std_logic;
            XIN : in std_logic_vector (3 downto 0);
            YIN : in std_logic_vector (3 downto 0);
            A_TO_G : out std_logic_vector (6 downto 0);
            AN : out std_logic_vector (3 downto 0));
end GCD_system_top;

architecture Behavioral of GCD_system_top is
signal out_clk190 : std_logic;
signal out_clk25 : std_logic;
signal outp_debounce : std_logic;

begin
U1 : entity work.clockdiv port map(
        clk => CLK,
        clr => CLR,
        clk190 => out_clk190,
        clk25 => out_clk25
);

U2: entity work.debounce4 port map(
        cclk => CLK,
        clr => CLR,
        inp => INP,
        outp => outp_debounce
);

U3: entity work.clock_pulse port map(
        cclk => out_clk25,
        clr => CLR,
        
);


end Behavioral;

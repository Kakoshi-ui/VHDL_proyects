library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pass_control_top is
    port(   CLK : in std_logic;
            CLR : in std_logic;
            PASSWORD : in std_logic_vector (7 downto 0);
            IN_BTNS : in std_logic_vector (2 downto 0);
            FAIL : out std_logic;
            PASS : out std_logic);
end pass_control_top;

architecture Behavioral of pass_control_top is
signal out_clk190 : std_logic;
signal pulse : std_logic;

begin
U1: entity work.clockdiv port map(
        clk => CLK,
        clr => CLR,
        clk190 => out_clk190
);

U2: entity work.clockpulse port map(
        cclk => out_clk190,
        clr => CLR,
        inp => IN_BTNS,
        outp =>  pulse
);

U3: entity work.doorlock port map(
        clk => pulse,
        clr => CLR,
        code_control => PASSWORD,
        input => IN_BTNS,
        output(1) => PASS,
        output(0) => FAIL 
);
end Behavioral;

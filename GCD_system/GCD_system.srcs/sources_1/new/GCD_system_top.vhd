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
signal pulse : std_logic;
signal don : std_logic;
signal in_7seg : std_logic_vector (15 downto 0);

begin
U1 : entity work.clockdiv port map(
        clk => CLK,
        clr => CLR,
        clk190 => out_clk190,
        clk25 => out_clk25
);

U2: entity work.debounce4 port map(
        cclk => out_clk190,
        clr => CLR,
        inp => INP,
        outp => outp_debounce
);

U3: entity work.clock_pulse port map(
        cclk => out_clk25,
        clr => CLR,
        inp => outp_debounce,
        outp => pulse
);

U4: entity work.gcd3 port map(
        clk => out_clk25,
        go => pulse,
        clr => CLR,
        xin => XIN,
        yin => YIN,
        done => don,
        gcd => in_7seg 
);

U5: entity work.X7segb port map(
        x => in_7seg,
        cclk => out_clk190,
        clr => CLR,
        a_to_g => A_TO_G,
        an => AN
);

end Behavioral;
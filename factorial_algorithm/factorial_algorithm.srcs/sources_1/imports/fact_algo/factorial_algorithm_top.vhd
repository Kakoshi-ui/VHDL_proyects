library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity factorial_algorithm_top is
    port(   CLK : in STD_LOGIC;
            CLR : in STD_LOGIC;
            GO : in std_logic;
            X : in std_logic_vector (2 downto 0);
            A_TO_G : out std_logic_vector (6 downto 0);
            AN : out std_logic_vector (3 downto 0)
    );
end factorial_algorithm_top;

architecture Behavioral of factorial_algorithm_top is
signal clk_25 : std_logic;
signal clk_190 : std_logic;
signal bin_one : std_logic_vector (2 downto 0) := "001";
signal hex_one : std_logic_vector (15 downto 0) := X"0001";
signal out_mux1 : std_logic_vector (2 downto 0);
signal out_mux2 : std_logic_vector (15 downto 0);
signal out_x_reg : std_logic_vector (2 downto 0);
signal out_result_reg : std_logic_vector (15 downto 0);
signal go_start_output : std_logic;
signal go_output : std_logic;
signal clr_multiplier_output : std_logic;
signal out_comparator : std_logic_vector (2 downto 0);
signal out_substractor : std_logic_vector (2 downto 0);
signal done_multiplier : std_logic;
signal product_multiplier : std_logic_vector (15 downto 0);
signal load_out : std_logic;
signal output_register : std_logic_vector (15 downto 0);
signal x_selector : std_logic;
signal res_selector : std_logic;
signal load_x : std_logic;
signal load_result : std_logic;
signal go_multiplier : std_logic;
signal clr_multiplier : std_logic;

begin
U1: entity work.clock_div port map(
        clk => CLK,
        clr => CLR,
        clk25 => clk_25,
        clk190 => clk_190
);

U2: entity work.mux1 port map(
        inp1 => X,
        inp2 => out_substractor,
        sel => x_selector,
        outp => out_mux1
);

U3: entity work.mux2 port map(
        inp1 => hex_one,
        inp2 => product_multiplier,
        sel => res_selector,
        outp => out_mux2
);

U4: entity work.x_reg port map(
        inp_data => out_mux1,
        clk => clk_25,
        clr => CLR,
        ld_x => load_x,
        out_data => out_x_reg
);

U5: entity work.res_reg port map(
        inp_data => out_mux2,
        clk => clk_25,
        clr => CLR,
        ld_res => load_result,
        out_data => out_result_reg
);

U6: entity work.clock_pulse port map(
        go_start => GO,
        go_mult => go_multiplier,
--        clr_mult => clr_multiplier,
        clk => clk_25,
        clr => CLR,
        go_str_out => go_start_output,
        go_outp => go_output
--        clr_m_outp => clr_multiplier_output
        
);

U7: entity work.comparator port map(
        inp1 => out_x_reg,
        inp2 => bin_one,
        g => out_comparator(2),
        e => out_comparator(1),
        l => out_comparator(0)
);

U8: entity work.substractor port map(
        x => out_x_reg,
        out_subs => out_substractor
);

U9: entity work.multiplier port map(
        clk => CLK,
        clr_mult => clr_multiplier,
        go_mult => go_output,
        multiplicando => out_result_reg,
        multiplicador => out_x_reg,
        done_mult => done_multiplier,
        producto => product_multiplier
);

U10: entity work.out_reg port map(
        inp_data => out_result_reg,
        clk => clk_25,
        clr => CLR,
        ld_out => load_out,
        out_data => output_register
);

U11: entity work.control_unit port map(
        go => go_start_output,
        clk => clk_25,
        clr => CLR,
        comp_in => out_comparator,
        done_mult => done_multiplier,
        x_sel => x_selector,
        res_sel => res_selector,
        ld_x => load_x,
        ld_res => load_result,
        ld_out => load_out,
        go_mult => go_multiplier,
        clr_mult => clr_multiplier
);

U12: entity work.X7segb port map(
        x => output_register,
        cclk => clk_190,
        clr => CLR,
        a_to_g => A_TO_G,
        an => AN
);

end Behavioral;

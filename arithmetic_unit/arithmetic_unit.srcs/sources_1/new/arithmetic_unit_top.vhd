library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_unit_top is
	port(	A: in std_logic_vector (3 downto 0);
			B: in std_logic_vector (3 downto 0);
			CLK: in std_logic;
			RST : in std_logic;
			SEL: in std_logic_vector (2 downto 0);
			SAL_DISP: out std_logic_vector (6 downto 0);
			SAL_AN: out std_logic_vector (3 downto 0));
end arithmetic_unit_top;

architecture Behavioral of arithmetic_unit_top is
--Señales para conexion interna:
signal s_sum : std_logic_vector (7 downto 0);
signal s_res : std_logic_vector (7 downto 0);
signal s_comp : std_logic_vector (2 downto 0);
signal fix_b : std_logic_vector (7 downto 0);
signal sal_mux1 : std_logic_vector (7 downto 0);
signal sal_mux2 : std_logic_vector (3 downto 0);
signal sal_bcd_unit : std_logic_vector (6 downto 0);
signal sal_bcd_dec : std_logic_vector (6 downto 0);
signal sal_bcd_lett : std_logic_vector (6 downto 0);
signal sal_mux3 : std_logic_vector (6 downto 0);


begin
fix_b <= "0000"&B;

U1: entity work.adder port map(
        a => A,
        b => B,
        s => s_sum        
);

U2: entity work.substractor port map(
        a => A,
        b => B,
        s => s_res
);

U3: entity work.comparator port map(
        a => A,
        b => B,
        e => s_comp(2),
        g => s_comp(1),
        l => s_comp(0)
);

U4: entity work.mux1 port map(
        in_sum => s_sum,
        in_res => s_res,
        in_b => fix_b,
        sel => SEL,
        s_mux1 => sal_mux1
);

U5: entity work.mux2 port map(
        in_desc(0) => sal_mux1(4),
        in_desc(1) => sal_mux1(5),
        in_desc(2) => sal_mux1(6),
        in_desc(3) => sal_mux1(7),
        in_a => A,
        sel => SEL,
        s_mux2 => sal_mux2
);

U6: entity work.bcd_unit port map(
        s_mux1(0) => sal_mux1(0),
        s_mux1(1) => sal_mux1(1),
        s_mux1(2) => sal_mux1(2),
        s_mux1(3) => sal_mux1(3),
        s_bcd_unit => sal_bcd_unit
);

U7: entity work.bcd_desc port map(
        s_mux2 => sal_mux2,
        s_bcd_dec => sal_bcd_dec
);

U8: entity work.bcd_lett port map(
        in_comp => s_comp,
        s_bcd_lett => sal_bcd_lett
);

U9: entity work.mux3 port map(
        in_bcd_unit => sal_bcd_unit,
        in_bcd_lett => sal_bcd_lett,
        sel => SEL,
        sal_mux => sal_mux3
);

U10: entity work.mux_7seg port map(
        clk => CLK,
        rst => RST,
        in_mux3 => sal_mux3,
        in_bcd_lett => sal_bcd_dec,
        s_to_disp => SAL_DISP,
        an => SAL_AN
);
end Behavioral;

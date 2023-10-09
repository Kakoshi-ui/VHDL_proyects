library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_unit is
    port(   go : in std_logic;
            clk : in std_logic;
            clr : in std_logic;
            comp_in : in std_logic_vector (2 downto 0);
            done_mult : in std_logic;
            x_sel : out std_logic;
            res_sel : out std_logic;
            ld_x : out std_logic;
            ld_res : out std_logic;
            ld_out : out std_logic;
            go_mult : out std_logic;
            clr_mult : out std_logic
);
end control_unit;

architecture Behavioral of control_unit is
type state_type is (q0, q1, q2, q3, q4,q5);
signal present_state, next_state : state_type;

begin

    --Registro de los estados
    state_register: process(clk,clr)
    begin
        if(clr = '1') then
            present_state <= q0;
        elsif(rising_edge(clk)) then
            present_state <= next_state;
        end if;
    end process state_register;

    --Proceso combinacional de estados
    C1: process(present_state,go,comp_in,done_mult)
    begin
        case(present_state) is
            when q0 =>
                if (go <= '0') then
                    next_state <= q0;
                else
                    next_state <= q1;
                end if;
            when q1 =>
                    next_state <= q2;
            when q2 =>
                if (comp_in = "001") then
                    next_state <= q5;
                elsif (comp_in = "010") then
                    next_state <= q5;
                else
                    next_state <= q3;
                end if;
            when q3 =>
                if (done_mult = '1') then
                    next_state <= q4;
                else 
                    next_state <= q3;
                end if;
            when q4 => 
                next_state <= q2;
            when q5 => 
                next_state <= q0;
            when others =>
                null;
        end case;
    end process C1;

    --Registro de las salidas
    C2: process(present_state)
    begin
        if (present_state = q0) then
            x_sel <= '0';
            res_sel <= '0';
            ld_x <= '0';
            ld_res <= '0';
            ld_out <= '0';
            go_mult <= '0';
            clr_mult <= '0';
        elsif (present_state = q1) then
            x_sel <= '0';
            res_sel <= '0';
            ld_x <= '1';
            ld_res <= '1';
            ld_out <= '0';
            go_mult <= '0';
            clr_mult <= '0';
        elsif (present_state = q2) then
            x_sel <= '1';
            res_sel <= '1';
            ld_x <= '0';
            ld_res <= '0';
            ld_out <= '0';
            go_mult <= '0';
            clr_mult <= '1';
        elsif (present_state = q3) then
            x_sel <= '1';
            res_sel <= '1';
            ld_x <= '0';
            ld_res <= '0';
            ld_out <= '0';
            go_mult <= '1';
            clr_mult <= '0';
        elsif (present_state = q4) then
            x_sel <= '1';
            res_sel <= '1';
            ld_x <= '1';
            ld_res <= '1';
            ld_out <= '0';
            go_mult <= '0';
            clr_mult <= '0';
        elsif (present_state = q5) then
            x_sel <= '0';
            res_sel <= '0';
            ld_x <= '0';
            ld_res <= '0';
            ld_out <= '1';
            go_mult <= '0';
            clr_mult <= '1';
        end if;
    end process;

end Behavioral;

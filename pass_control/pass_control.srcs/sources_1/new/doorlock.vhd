library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity doorlock is
    port(   clk : in std_logic;
            clr : in std_logic;
            code_control : in std_logic_vector (7 downto 0);
            input : in std_logic_vector (2 downto 0);
            output : out std_logic_vector (1 downto 0));
end doorlock;

architecture Behavioral of doorlock is
type state_type is (q0, q1, q2, q3, q4, q5, q6, q7, q8);
signal present_state, next_state : state_type;
signal input_fix: std_logic_vector (1 downto 0);
signal digit0, digit1, digit2, digit3 : std_logic_vector (1 downto 0);

begin
--Programacion del código de la cerradura   
    digit3 <= code_control(7) & code_control(6);
    digit2 <= code_control(5) & code_control(4);
    digit1 <= code_control(3) & code_control(2);                     
    digit0 <= code_control(1) & code_control(0);
--Arreglo para las entradas de los botones
with input select
    input_fix <=    "00" when "001",
                    "01" when "010",
                    "10" when "100",
                    "11" when others;
--Registro de estados
state_register: process(clk,clr)
    begin
    if (clr = '1') then
        present_state <= q0;
    elsif (rising_edge(clk)) then
        present_state <= next_state;
    end if;
end process state_register;
-- Proceso Combinacional de estados
C1: process(present_state,input_fix)
    begin
    case (present_state) is
        when q0 =>
            if (input_fix = digit3) then
                next_state <= q1;
            elsif (input_fix = "11") then    
                next_state <= q0;
            else 
                next_state <= q5;
            end if;
        when q1 => 
            if (input_fix = digit2) then
                next_state <= q2;
            elsif (input_fix = "11") then
                next_state <= q1;
            else
                next_state <= q6;
            end if;
        when q2 => 
            if (input_fix = digit1) then
                next_state <= q3;
            elsif (input_fix = "11") then
                next_state <= q2;
            else
                next_state <= q7;
            end if;
        when q3 => 
            if (input_fix = digit0) then
                next_state <= q4;
            elsif (input_fix = "11") then
                next_state <= q3;
            else
                next_state <= q8;
            end if;
        when q4 => 
            if (input_fix = ("00" or "01" or "10")) then
                next_state <= q0;
            else
                next_state <= q4;
            end if;
        when q5 => 
            if (input_fix = ("00" or "01" or "10")) then
                next_state <= q6;
            elsif (input_fix = "11") then
                next_state <= q5;
            end if;
        when q6 =>
            if (input_fix = ("00" or "01" or "10")) then
                next_state <= q7;
            elsif (input_fix = "11") then
                next_state <= q6;
            end if;
        when q7 => 
            if (input_fix = ("00" or "01" or "10")) then
                next_state <= q8;
            elsif (input_fix = "11") then
                next_state <= q7;
            end if;
        when q8 => 
            if (input_fix = ("00" or "01" or "10")) then
                next_state <= q0;
            elsif (input_fix = "11") then
                next_state <= q8;
            end if;
        when others => 
            null;
    end case;
end process C1;
-- Proceso secuencial para registrar la salida
C2: process(present_state)
    begin
    if (present_state = q4) then
        output <= "10";
    elsif (present_state = q8) then
        output <= "01";
    else
        output <= "00";
    end if;
end process C2;
end Behavioral;
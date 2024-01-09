library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bounce is
    port(   clk: in std_logic;
            go : in std_logic;
            clr: in std_logic;
            Col1: out std_logic_vector (7 downto 0);
            Row1: out std_logic_vector (7 downto 0));
end bounce;

architecture Behavioral of bounce is
--intermediate signals
--states for the state machine
type state_type is (q0, q1, q2, q3, q4);
signal present_state, next_state: state_type;

--counter
signal counter: std_logic_vector(7 downto 0);

begin

    pos_counter: process(clr, clk)
    begin
        if (clr = '1') then
            counter <= (others => '0');
        elsif (rising_edge(clk)) then
            if (counter = "11111111") then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;    
        end if;
    end process pos_counter;

    state_register: process(clk, clr)
    begin
        if (clr = '1') then
            present_state <= q0;
        elsif (rising_edge(clk)) then
            present_state <= next_state;
        end if;
    end process state_register;
    
    C1: process(present_state, counter)
    begin
        case(present_state) is
            when q0 => 
                
        end case;
    end process C1;
    
    C2: process(present_state)
    begin
        if (present_state = q0) then
            Col1 <= (others => '0');
            Row1 <= (others => '0');
        elsif (present_state = q1) then
            Col1 <= "00000000";
            Row1 <= "00000000";
        end if;
    end process C2;

end Behavioral;

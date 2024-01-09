library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
	port(	clk, clr: in std_logic;
			clk_40: out std_logic);
end clk_div;

architecture Behavioral of clk_div is
signal full_count, half_count: std_logic_vector (2 downto 0);
signal full, half: std_logic;

begin
    process(clk, clr, full_count, half_count)
    begin
        if(clr = '1') then
            full_count <= "000";
            full <= '0';
        elsif(rising_edge(clk)) then
            if(full_count = "010" or half_count = "010")then
                full_count <= "000";
                full <= '1';
            else
                full_count <= full_count + "001";
                full <= '0';
            end if;
        end if;
    end process; 
    
    process(clk, clr, full_count, half_count)
    begin
        if(clr = '1') then
            half_count <= "000";
            half <= '0';
        elsif(falling_edge(clk)) then
            if(half_count = "010" or full_count = "010") then
                half_count <= "000"; 
                half <= '1';
            else 
                half_count <= half_count + "001";
                half <= '0';
            end if;
        end if;
    end process;
    
    clk_40 <= full or half;
    
end Behavioral;
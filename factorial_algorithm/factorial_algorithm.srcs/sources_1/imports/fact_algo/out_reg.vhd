library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity out_reg is
    port(   inp_data : in std_logic_vector (15 downto 0);
            clk,clr,ld_out : in std_logic;
            out_data : out std_logic_vector (15 downto 0));
end out_reg;

architecture Behavioral of out_reg is

begin
    process (clk,clr,ld_out) 
    begin
        if (clr = '1') then
            out_data <= (others => '0');
        elsif (rising_edge(clk)) then
            if (ld_out = '1') then
                out_data <= inp_data;
            end if;
        end if;
    end process;
end Behavioral;

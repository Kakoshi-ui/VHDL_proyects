library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity x_reg is
    port(   inp_data : in std_logic_vector (2 downto 0);
            clk,clr,ld_x : in std_logic;
            out_data : out std_logic_vector (2 downto 0));
end x_reg;

architecture Behavioral of x_reg is

begin
    process(clk,clr,ld_x)
    begin
        if (clr = '1') then
            out_data <= (others => '0');
        elsif (rising_edge(clk)) then
            if(ld_x = '1') then
                out_data <= inp_data;
            end if;
        end if;
    end process;

end Behavioral;

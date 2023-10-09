library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res_reg is
    port(   inp_data : in std_logic_vector (15 downto 0);
            clk,clr,ld_res : in std_logic;
            out_data : out std_logic_vector (15 downto 0));
end res_reg;

architecture Behavioral of res_reg is

begin
    process(clk,clr,ld_res)
    begin
        if(clr = '1') then
            out_data <= (others => '0');
        elsif (rising_edge(clk)) then
            if (ld_res = '1') then
                out_data <= inp_data;
            end if;
        end if;
    end process;
end Behavioral;

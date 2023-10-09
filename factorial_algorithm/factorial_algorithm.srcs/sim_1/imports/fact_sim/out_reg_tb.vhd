library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity out_reg_tb is
end out_reg_tb;

architecture Behavioral of out_reg_tb is
signal inp_data,out_data : std_logic_vector (15 downto 0);
signal clk,clr,ld_out : std_logic;

begin
    uut: entity work.out_reg port map(inp_data,clk,clr,ld_out,out_data);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;
    
    stimulus: process
    begin
        clr <= '1';
        inp_data <= X"0000";
        ld_out <= '0';
        wait for 20 us;
        
        clr <= '0';
        inp_data <= X"0101";
        wait for 20 us;
        
        ld_out <= '1';
        wait for 10 us;
        ld_out <= '0';
        wait for 10 us;
    end process;

end Behavioral;

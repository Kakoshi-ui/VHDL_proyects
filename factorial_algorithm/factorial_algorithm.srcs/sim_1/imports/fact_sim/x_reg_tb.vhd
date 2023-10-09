library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity x_reg_tb is
end x_reg_tb;

architecture Behavioral of x_reg_tb is
signal inp_data : std_logic_vector (2 downto 0);
signal clk,clr,ld_x :std_logic;
signal out_data : std_logic_vector (2 downto 0);

begin
    uut: entity work.x_reg port map(inp_data,clk,clr,ld_x,out_data);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

    stimulus: process
    begin
        inp_data <= "000";
        clr <= '1';
        ld_x <= '0';
        wait for 20 us;
        
        inp_data <= "111";
        clr <= '0';
        ld_x <= '0';
        wait for 20 us;
        
        ld_x <= '1';
        wait for 20 us;
        ld_x <= '0';
        wait for 20 us;
        
        inp_data <= "110";
        wait for 30 us;
        
        ld_x <= '1';
        wait for 20 us;
        ld_x <= '0';
        wait for 20 us;
    end process;
end Behavioral;

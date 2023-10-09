library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res_reg_tb is
end res_reg_tb;

architecture Behavioral of res_reg_tb is
signal inp_data,outp_data : std_logic_vector (15 downto 0);
signal clk,clr,ld_res : std_logic;

begin
    uut: entity work.res_reg port map(inp_data,clk,clr,ld_res,outp_data);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

    stimulus: process
    begin
        inp_data <= X"0015";
        clr <= '1';
        ld_res <= '0';
        wait for 20 us;
        
        clr <= '0';
        wait for 20 us;
        
        ld_res <= '1';
        wait for 20 us;
        ld_res <= '0';
        inp_data <= X"0001";
        wait for 20 us;
        
        ld_res <= '1';
        wait for 20 us;
        
        ld_res <= '0';
        inp_data <= X"0000";
        wait for 20 us;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit_tb is
end control_unit_tb;

architecture Behavioral of control_unit_tb is
signal go : std_logic;
signal clk : std_logic;
signal clr : std_logic;
signal comp_in : std_logic_vector (2 downto 0);
signal done_mult : std_logic;
signal x_sel : std_logic;
signal res_sel : std_logic;
signal ld_x : std_logic;
signal ld_res : std_logic;
signal ld_out : std_logic;
signal go_mult : std_logic;
signal clr_mult : std_logic;

begin
    uut: entity work.control_unit port map(go,clk,clr,comp_in,done_mult,
    x_sel,res_sel,ld_x,ld_res,ld_out,go_mult,clr_mult);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;
    
    stimulus: process
    begin
        go <= '0';
        clr <= '1';
        comp_in <= "100";
        done_mult <= '0';
        wait for 50 ns;
        
        go <= '0';
        clr <= '0';
        comp_in <= "100";
        done_mult <= '0';
        wait for 50 ns;
        
        go <= '1';
        clr <= '0';
        comp_in <= "100";
        done_mult <= '0';
        wait for 50 ns;
        
        go <= '0';
        clr <= '0';
        comp_in <= "100";
        done_mult <= '0';
        wait for 600 ns;
        
        go <= '0';
        clr <= '0';
        comp_in <= "100";
        done_mult <= '1';
        wait for 150 ns;
        
        done_mult <= '0';
        wait for 100 ns;
        
    end process;

end Behavioral;

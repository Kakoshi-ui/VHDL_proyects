library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity doorlock_tb is
end doorlock_tb;

architecture Behavioral of doorlock_tb is
signal clk : std_logic := '0';
signal clr : std_logic;
signal code_control : std_logic_vector (7 downto 0);
signal input : std_logic_vector (2 downto 0) := "000";
signal output : std_logic_vector (1 downto 0);
begin
code_control <= "10010010";
uut: 
entity work.doorlock port map(clk,clr,code_control,input,output);

stimulus: process
begin
--Contraseña correcta ruta correcta
    clr <= '1';
    wait for 100 us;
  
    clr <= '0';
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    input <= "100";
    clk <= '1';
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "010";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "001";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
 -- Contraseña incorrecta: ruta incorrecta
    clr <= '1';
    wait for 100 us;
    
    clr <= '0';
    clk <= '1';
    input <= "001";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "001";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
 --Contraseña correcta hasta el ultimo digito
    clr <= '1';
    wait for 100 us;
    
    clr <= '0';
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "010";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "001";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "001";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
-- Contraseña incorrecta con los primeros dos digitos correctos    
    clr <= '1';
    wait for 100 us;
    
    clr <= '0';
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "010";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
    
    clk <= '1';
    input <= "100";
    wait for 50 us;
    clk <= '0';
    input <= "000";
    wait for 50 us;
end process stimulus;


end Behavioral;

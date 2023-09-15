library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_unit_top_tb is
end arithmetic_unit_top_tb;

architecture Behavioral of arithmetic_unit_top_tb is
signal A: std_logic_vector (3 downto 0);
signal B: std_logic_vector (3 downto 0);
signal CLK : std_logic;
signal RST : std_logic;
signal SEL: std_logic_vector (2 downto 0);
signal SAL_DISP: std_logic_vector (6 downto 0);
signal SAL_AN: std_logic_vector (3 downto 0);

begin
uut: entity work.arithmetic_unit_top port map(A,B,CLK,RST,SEL,SAL_DISP,SAL_AN);

clock:
process
begin
    CLK <= '0';
    wait for 5 ns;
    
    CLK <= '1';
    wait for 5 ns;
end process clock;

stimulus:
process
begin
    --Espera 50 ns de reset
	RST <= '1';
	A <= "0000";
	B <= "0000";
	SEL <= "000";
	wait for 50 ns;
	
	--Muestra los digitos ingresados
	RST <= '0';
	A <= "0001";
	B <= "0001";
	SEL <= "000";
	wait for 100 ms;
	
	RST <= '0';
	A <= "0001";
	B <= "1000";
	SEL <= "000";
	wait for 100 ms;
	
    --Muestra resultado de la suma
	RST <= '0';
	A <= "0100";
	B <= "0011";
	SEL <= "001";
	wait for 100 ms;
	
	RST <= '0';
	A <= "1001";
	B <= "1001";
	SEL <= "001";
	wait for 100 ms;
	
	--Muestra resultado de la resta
	RST <= '0';
	A <= "0111";
	B <= "0100";
	SEL <= "010";
	wait for 100 ms;
	
	RST <= '0';
	A <= "0011";
	B <= "0101";
	SEL <= "010";
	wait for 100 ms;
	
	--Muestra resultado de la comparacion
	RST <= '0';
	A <= "0110";
	B <= "0110";
	SEL <= "100";
	wait for 100 ms;
	
	RST <= '0';
	A <= "1001";
	B <= "0001";
	SEL <= "100";
	wait for 100 ms;
	
	RST <= '0';
	A <= "0111";
	B <= "1000";
	SEL <= "100";
	wait for 100 ms;
end process;
end Behavioral;

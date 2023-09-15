LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY base_d_tiempo_1_Hz IS
generic(N:integer:=19; M:integer:=8);

PORT (	clk_10Hz:in STD_LOGIC;
		salida_1Hz:out STD_LOGIC;
		salida_a_led: out STD_LOGIC);

END base_d_tiempo_1_Hz;

ARCHITECTURE arq_base_d_tiempo_1Hz OF base_d_tiempo_1_Hz is

signal clk_1Hz: std_logic;
signal clk_LED: std_logic;

BEGIN
un_Hz: PROCESS (clk_10Hz)
VARIABLE contador_04: INTEGER RANGE 0 TO N;
BEGIN
IF clk_10Hz'EVENT AND clk_10Hz='1' THEN
	IF contador_04 <= M THEN
		clk_1Hz<='1';
		clk_LED<='1';
	ELSIF contador_04 > M AND contador_04<=N THEN
		clk_1Hz<='0';
		clk_LED<='0';
	ELSE
		contador_04 := 0;
	END IF;
END IF;

contador_04:=contador_04+1; 
salida_1Hz<=clk_1Hz;
salida_a_led<=clk_LED;

END PROCESS;
END arq_base_d_tiempo_1Hz;
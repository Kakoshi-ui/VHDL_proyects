----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 06:35:13 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    port(   a : in std_logic_vector (7 downto 0);
            b : in std_logic_vector (7 downto 0);
            opcode : in std_logic_vector (3 downto 0);
            y : out std_logic_vector (7 downto 0);
            ci : out std_logic);
end ALU;

architecture Behavioral of ALU is
signal sig_a: signed(7 downto 0);
signal sig_b: signed(7 downto 0);
signal sig_y: signed(7 downto 0);
signal signed_y: unsigned(7 downto 0);
signal signed_x: 

begin
    ---Logical unit
    with (opcode) select
        y <=    not(a)   when "0000",
                not(b)   when "0001",
                a and b  when "0010",
                a nand b when "0011",
                a or b   when "0100",
                a nor b  when "0101",
                a xor b  when "0110",
                a xnor b when "0111",
                "00000000" when others;
    sig_a <= signed(a);
    sig_b <= signed(b);
    
    --Aritmethic unit
    with (opcode) select
        sig_y <=    sig_a when "1000",
					sig_b when "1001",
                    sig_a + sig_b when "1010",
                    sig_a - sig_b when "1011",
                    sig_a * sig_b when "1100",
                    sig_a / sig_b when "1101",
					"00000000" when others;
        y <= std_logic_vector(sig_y);
end Behavioral;

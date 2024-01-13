--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sat Jan 13 16:02:01 2024
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target ball64x448_wrapper.bd
--Design      : ball64x448_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ball64x448_wrapper is
  port (
    addr_ball : in STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_ball : in STD_LOGIC;
    dout_ball : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
end ball64x448_wrapper;

architecture STRUCTURE of ball64x448_wrapper is
  component ball64x448 is
  port (
    addr_ball : in STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_ball : in STD_LOGIC;
    dout_ball : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component ball64x448;
begin
ball64x448_i: component ball64x448
     port map (
      addr_ball(14 downto 0) => addr_ball(14 downto 0),
      clk_ball => clk_ball,
      dout_ball(11 downto 0) => dout_ball(11 downto 0)
    );
end STRUCTURE;

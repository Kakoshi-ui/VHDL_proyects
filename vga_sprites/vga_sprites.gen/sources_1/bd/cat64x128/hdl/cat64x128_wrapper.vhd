--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Mon Jan  8 11:24:53 2024
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target cat64x128_wrapper.bd
--Design      : cat64x128_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cat64x128_wrapper is
  port (
    addr_cat : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk_cat : in STD_LOGIC;
    dout_cat : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
end cat64x128_wrapper;

architecture STRUCTURE of cat64x128_wrapper is
  component cat64x128 is
  port (
    addr_cat : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk_cat : in STD_LOGIC;
    dout_cat : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component cat64x128;
begin
cat64x128_i: component cat64x128
     port map (
      addr_cat(13 downto 0) => addr_cat(13 downto 0),
      clk_cat => clk_cat,
      dout_cat(11 downto 0) => dout_cat(11 downto 0)
    );
end STRUCTURE;

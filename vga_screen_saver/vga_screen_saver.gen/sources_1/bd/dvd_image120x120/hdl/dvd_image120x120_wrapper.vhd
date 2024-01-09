--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Dec 20 13:45:59 2023
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target dvd_image120x120_wrapper.bd
--Design      : dvd_image120x120_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dvd_image120x120_wrapper is
  port (
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
end dvd_image120x120_wrapper;

architecture STRUCTURE of dvd_image120x120_wrapper is
  component dvd_image120x120 is
  port (
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component dvd_image120x120;
begin
dvd_image120x120_i: component dvd_image120x120
     port map (
      addr(15 downto 0) => addr(15 downto 0),
      clk => clk,
      dout(11 downto 0) => dout(11 downto 0)
    );
end STRUCTURE;

--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Jan  3 15:16:16 2024
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target ball192x192_wrapper.bd
--Design      : ball192x192_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ball192x192_wrapper is
  port (
    addr_ball : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_ball : in STD_LOGIC;
    dout_ball : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
end ball192x192_wrapper;

architecture STRUCTURE of ball192x192_wrapper is
  component ball192x192 is
  port (
    addr_ball : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_ball : in STD_LOGIC;
    dout_ball : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component ball192x192;
begin
ball192x192_i: component ball192x192
     port map (
      addr_ball(15 downto 0) => addr_ball(15 downto 0),
      clk_ball => clk_ball,
      dout_ball(11 downto 0) => dout_ball(11 downto 0)
    );
end STRUCTURE;

-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Mon Aug 28 00:10:12 2023
-- Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Digital_Sys_Design/arithmetic_unit/arithmetic_unit.sim/sim_1/synth/func/xsim/comparator_tb_func_synth.vhd
-- Design      : comparator
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comparator is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    e : out STD_LOGIC;
    g : out STD_LOGIC;
    l : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of comparator : entity is true;
end comparator;

architecture STRUCTURE of comparator is
  signal a_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal e_OBUF : STD_LOGIC;
  signal e_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal g_OBUF : STD_LOGIC;
  signal g_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal l_OBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of g_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of l_OBUF_inst_i_1 : label is "soft_lutpair0";
begin
\a_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(0),
      O => a_IBUF(0)
    );
\a_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(1),
      O => a_IBUF(1)
    );
\a_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(2),
      O => a_IBUF(2)
    );
\a_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(3),
      O => a_IBUF(3)
    );
\b_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(0),
      O => b_IBUF(0)
    );
\b_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(1),
      O => b_IBUF(1)
    );
\b_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(2),
      O => b_IBUF(2)
    );
\b_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(3),
      O => b_IBUF(3)
    );
e_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => e_OBUF,
      O => e
    );
e_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"90"
    )
        port map (
      I0 => a_IBUF(3),
      I1 => b_IBUF(3),
      I2 => e_OBUF_inst_i_2_n_0,
      O => e_OBUF
    );
e_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a_IBUF(0),
      I1 => b_IBUF(0),
      I2 => b_IBUF(2),
      I3 => a_IBUF(2),
      I4 => b_IBUF(1),
      I5 => a_IBUF(1),
      O => e_OBUF_inst_i_2_n_0
    );
g_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => g_OBUF,
      O => g
    );
g_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => g_OBUF_inst_i_2_n_0,
      I1 => e_OBUF_inst_i_2_n_0,
      I2 => b_IBUF(3),
      I3 => a_IBUF(3),
      O => g_OBUF
    );
g_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => a_IBUF(0),
      I1 => b_IBUF(0),
      I2 => b_IBUF(1),
      I3 => a_IBUF(1),
      I4 => b_IBUF(2),
      I5 => a_IBUF(2),
      O => g_OBUF_inst_i_2_n_0
    );
l_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => l_OBUF,
      O => l
    );
l_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3071"
    )
        port map (
      I0 => e_OBUF_inst_i_2_n_0,
      I1 => a_IBUF(3),
      I2 => b_IBUF(3),
      I3 => g_OBUF_inst_i_2_n_0,
      O => l_OBUF
    );
end STRUCTURE;

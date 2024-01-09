-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Sat Dec  2 13:27:45 2023
-- Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Digital_Sys_Design/vga_screen_saver/vga_screen_saver.gen/sources_1/ip/clk_35/clk_35_stub.vhdl
-- Design      : clk_35
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_35 is
  Port ( 
    clk_35 : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC
  );

end clk_35;

architecture stub of clk_35 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_35,reset,clk";
begin
end;

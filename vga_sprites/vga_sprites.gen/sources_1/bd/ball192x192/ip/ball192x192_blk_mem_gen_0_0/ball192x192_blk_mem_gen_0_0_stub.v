// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Jan  7 19:35:45 2024
// Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Digital_Sys_Design/vga_sprites/vga_sprites.gen/sources_1/bd/ball192x192/ip/ball192x192_blk_mem_gen_0_0/ball192x192_blk_mem_gen_0_0_stub.v
// Design      : ball192x192_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *)
module ball192x192_blk_mem_gen_0_0(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="addra[15:0],douta[11:0]" */
/* synthesis syn_force_seq_prim="clka" */;
  input clka /* synthesis syn_isclock = 1 */;
  input [15:0]addra;
  output [11:0]douta;
endmodule
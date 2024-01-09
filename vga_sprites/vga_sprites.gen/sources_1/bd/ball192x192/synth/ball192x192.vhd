--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Jan  3 15:16:16 2024
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target ball192x192.bd
--Design      : ball192x192
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ball192x192 is
  port (
    addr_ball : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_ball : in STD_LOGIC;
    dout_ball : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ball192x192 : entity is "ball192x192,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ball192x192,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of ball192x192 : entity is "ball192x192.hwdef";
end ball192x192;

architecture STRUCTURE of ball192x192 is
  component ball192x192_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component ball192x192_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ball192x192_douta : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal clka_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_ball : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_BALL CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_ball : signal is "XIL_INTERFACENAME CLK.CLK_BALL, CLK_DOMAIN ball192x192_clka_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  addra_0_1(15 downto 0) <= addr_ball(15 downto 0);
  clka_0_1 <= clk_ball;
  dout_ball(11 downto 0) <= ball192x192_douta(11 downto 0);
ball192x192: component ball192x192_blk_mem_gen_0_0
     port map (
      addra(15 downto 0) => addra_0_1(15 downto 0),
      clka => clka_0_1,
      douta(11 downto 0) => ball192x192_douta(11 downto 0)
    );
end STRUCTURE;

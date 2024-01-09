--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Mon Jan  8 11:24:53 2024
--Host        : LAPTOP-RQPNV6GP running 64-bit major release  (build 9200)
--Command     : generate_target cat64x128.bd
--Design      : cat64x128
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cat64x128 is
  port (
    addr_cat : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk_cat : in STD_LOGIC;
    dout_cat : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of cat64x128 : entity is "cat64x128,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=cat64x128,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of cat64x128 : entity is "cat64x128.hwdef";
end cat64x128;

architecture STRUCTURE of cat64x128 is
  component cat64x128_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component cat64x128_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal cat64x128_douta : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal clka_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_cat : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_CAT CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_cat : signal is "XIL_INTERFACENAME CLK.CLK_CAT, CLK_DOMAIN cat64x128_clk_cat, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  addra_0_1(13 downto 0) <= addr_cat(13 downto 0);
  clka_0_1 <= clk_cat;
  dout_cat(11 downto 0) <= cat64x128_douta(11 downto 0);
cat64x128: component cat64x128_blk_mem_gen_0_0
     port map (
      addra(13 downto 0) => addra_0_1(13 downto 0),
      clka => clka_0_1,
      douta(11 downto 0) => cat64x128_douta(11 downto 0)
    );
end STRUCTURE;

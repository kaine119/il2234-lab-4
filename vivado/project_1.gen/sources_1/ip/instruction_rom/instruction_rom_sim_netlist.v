// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Oct 12 12:59:10 2024
// Host        : Kais-Thinkpad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Kai/Documents/_MyDocuments/Coursework/IL2234/lab4/vivado/project_1.gen/sources_1/ip/instruction_rom/instruction_rom_sim_netlist.v
// Design      : instruction_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instruction_rom,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module instruction_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [9:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [9:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.459999 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "instruction_rom.mem" *) 
  (* C_INIT_FILE_NAME = "instruction_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "10" *) 
  (* C_READ_WIDTH_B = "10" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "10" *) 
  (* C_WRITE_WIDTH_B = "10" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  instruction_rom_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[9:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[9:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19984)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

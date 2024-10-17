// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Oct 12 12:47:46 2024
// Host        : Kais-Thinkpad running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Kai/Documents/_MyDocuments/Coursework/IL2234/lab4/vivado/project_1.gen/sources_1/ip/data_sram/data_sram_sim_netlist.v
// Design      : data_sram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "data_sram,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module data_sram
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
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
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.68455 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_INIT_FILE = "data_sram.mem" *) 
  (* C_INIT_FILE_NAME = "data_sram.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  data_sram_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21840)
`pragma protect data_block
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
yeGjNDys4OVh
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

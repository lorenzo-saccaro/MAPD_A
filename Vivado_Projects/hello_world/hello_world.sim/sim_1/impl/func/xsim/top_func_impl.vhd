-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Nov  4 13:50:14 2021
-- Host        : LORENZO-DESKTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/loren/hello_world/hello_world.sim/sim_1/impl/func/xsim/top_func_impl.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    btn_in : in STD_LOGIC;
    led_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top : entity is "a82aecad";
end top;

architecture STRUCTURE of top is
  signal led_out_OBUF : STD_LOGIC;
begin
btn_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => btn_in,
      O => led_out_OBUF
    );
led_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_out_OBUF,
      O => led_out
    );
end STRUCTURE;

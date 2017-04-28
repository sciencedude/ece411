## Generated SDC file "mp3.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Full Version"

## DATE    "Fri Apr 28 01:26:58 2017"

##
## DEVICE  "EP3SE50F780C2"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 8.000 -waveform { 0.000 4.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[15]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[16]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[17]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[18]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[19]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[20]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[21]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[22]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[23]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[24]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[25]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[26]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[27]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[28]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[29]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[30]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[31]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[32]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[33]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[34]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[35]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[36]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[37]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[38]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[39]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[40]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[41]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[42]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[43]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[44]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[45]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[46]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[47]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[48]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[49]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[50]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[51]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[52]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[53]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[54]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[55]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[56]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[57]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[58]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[59]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[60]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[61]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[62]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[63]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[64]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[65]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[66]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[67]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[68]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[69]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[70]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[71]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[72]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[73]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[74]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[75]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[76]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[77]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[78]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[79]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[80]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[81]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[82]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[83]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[84]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[85]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[86]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[87]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[88]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[89]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[90]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[91]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[92]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[93]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[94]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[95]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[96]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[97]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[98]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[99]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[100]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[101]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[102]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[103]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[104]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[105]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[106]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[107]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[108]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[109]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[110]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[111]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[112]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[113]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[114]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[115]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[116]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[117]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[118]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[119]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[120]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[121]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[122]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[123]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[124]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[125]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[126]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_rdata[127]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_resp}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {out[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_address[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_read}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[16]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[17]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[18]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[19]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[20]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[21]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[22]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[23]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[24]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[25]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[26]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[27]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[28]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[29]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[30]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[31]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[32]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[33]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[34]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[35]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[36]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[37]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[38]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[39]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[40]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[41]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[42]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[43]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[44]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[45]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[46]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[47]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[48]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[49]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[50]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[51]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[52]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[53]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[54]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[55]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[56]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[57]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[58]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[59]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[60]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[61]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[62]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[63]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[64]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[65]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[66]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[67]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[68]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[69]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[70]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[71]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[72]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[73]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[74]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[75]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[76]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[77]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[78]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[79]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[80]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[81]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[82]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[83]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[84]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[85]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[86]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[87]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[88]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[89]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[90]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[91]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[92]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[93]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[94]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[95]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[96]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[97]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[98]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[99]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[100]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[101]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[102]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[103]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[104]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[105]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[106]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[107]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[108]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[109]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[110]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[111]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[112]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[113]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[114]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[115]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[116]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[117]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[118]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[119]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[120]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[121]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[122]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[123]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[124]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[125]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[126]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_wdata[127]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {physical_write}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from [get_clocks {clk}] -to [get_ports {physical_address[0] physical_address[1] physical_address[2] physical_address[3] physical_address[4] physical_address[5] physical_address[6] physical_address[7] physical_address[8] physical_address[9] physical_address[10] physical_address[11] physical_address[12] physical_address[13] physical_address[14] physical_address[15]}] 4


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************


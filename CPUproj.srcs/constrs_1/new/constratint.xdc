# constratints of the project


# the constraints of the uart
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y19} [get_ports rx]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V18} [get_ports tx]


# the constraints of the clk
set_property IOSTANDARD LVCMOS33 [get_ports fpga_clk]
set_property PACKAGE_PIN Y18 [get_ports fpga_clk]


# the constraints of the rst
set_property IOSTANDARD LVCMOS33 [get_ports fpga_rst]
set_property PACKAGE_PIN P5 [get_ports fpga_rst]


# the constraints of the keyboard
#set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]
#set_property PACKAGE_PIN M2 [get_ports {col[3]}]
#set_property PACKAGE_PIN K6 [get_ports {col[2]}]
#set_property PACKAGE_PIN J6 [get_ports {col[1]}]
#set_property PACKAGE_PIN L5 [get_ports {col[0]}]
#set_property PACKAGE_PIN K4 [get_ports {row[3]}]
#set_property PACKAGE_PIN J4 [get_ports {row[2]}]
#set_property PACKAGE_PIN L3 [get_ports {row[1]}]
#set_property PACKAGE_PIN K3 [get_ports {row[0]}]


# the constraints of the segments
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[7]}]
set_property PACKAGE_PIN C19 [get_ports {seg_en[0]}]
set_property PACKAGE_PIN E19 [get_ports {seg_en[1]}]
set_property PACKAGE_PIN D19 [get_ports {seg_en[2]}]
set_property PACKAGE_PIN F18 [get_ports {seg_en[3]}]
set_property PACKAGE_PIN E18 [get_ports {seg_en[4]}]
set_property PACKAGE_PIN B20 [get_ports {seg_en[5]}]
set_property PACKAGE_PIN A20 [get_ports {seg_en[6]}]
set_property PACKAGE_PIN A18 [get_ports {seg_en[7]}]
set_property PACKAGE_PIN F15 [get_ports {seg_out[0]}]
set_property PACKAGE_PIN F13 [get_ports {seg_out[1]}]
set_property PACKAGE_PIN F14 [get_ports {seg_out[2]}]
set_property PACKAGE_PIN F16 [get_ports {seg_out[3]}]
set_property PACKAGE_PIN E17 [get_ports {seg_out[4]}]
set_property PACKAGE_PIN C14 [get_ports {seg_out[5]}]
set_property PACKAGE_PIN C15 [get_ports {seg_out[6]}]
set_property PACKAGE_PIN E13 [get_ports {seg_out[7]}]

# the constraints of the leds
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[23]}]
set_property PACKAGE_PIN K17 [get_ports led[0]]
set_property PACKAGE_PIN L13 [get_ports led[1]]
set_property PACKAGE_PIN M13 [get_ports led[2]]
set_property PACKAGE_PIN K14 [get_ports led[3]]
set_property PACKAGE_PIN K13 [get_ports led[4]]
set_property PACKAGE_PIN M20 [get_ports led[5]]
set_property PACKAGE_PIN N20 [get_ports led[6]]
set_property PACKAGE_PIN N19 [get_ports led[7]]
set_property PACKAGE_PIN M17 [get_ports led[8]]
set_property PACKAGE_PIN M18 [get_ports led[9]]
set_property PACKAGE_PIN M15 [get_ports led[10]]
set_property PACKAGE_PIN K16 [get_ports led[11]]
set_property PACKAGE_PIN L16 [get_ports led[12]]
set_property PACKAGE_PIN L15 [get_ports led[13]]
set_property PACKAGE_PIN L14 [get_ports led[14]]
set_property PACKAGE_PIN J17 [get_ports led[15]]
set_property PACKAGE_PIN F21 [get_ports led[16]]
set_property PACKAGE_PIN G22 [get_ports led[17]]
set_property PACKAGE_PIN G21 [get_ports led[18]]
set_property PACKAGE_PIN D21 [get_ports led[19]]
set_property PACKAGE_PIN E21 [get_ports led[20]]
set_property PACKAGE_PIN D22 [get_ports led[21]]
set_property PACKAGE_PIN E22 [get_ports led[22]]
set_property PACKAGE_PIN A21 [get_ports led[23]]

# the constraints of the switches
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[23]}]
set_property PACKAGE_PIN Y9 [get_ports sw[0]]
set_property PACKAGE_PIN W9 [get_ports sw[1]]
set_property PACKAGE_PIN Y7 [get_ports sw[2]]
set_property PACKAGE_PIN Y8 [get_ports sw[3]]
set_property PACKAGE_PIN AB8 [get_ports sw[4]]
set_property PACKAGE_PIN AA8 [get_ports sw[5]]
set_property PACKAGE_PIN V8 [get_ports sw[6]]
set_property PACKAGE_PIN V9 [get_ports sw[7]]
set_property PACKAGE_PIN AB6 [get_ports sw[8]]
set_property PACKAGE_PIN AB7 [get_ports sw[9]]
set_property PACKAGE_PIN V7 [get_ports sw[10]]
set_property PACKAGE_PIN AA6 [get_ports sw[11]]
set_property PACKAGE_PIN Y6 [get_ports sw[12]]
set_property PACKAGE_PIN T6 [get_ports sw[13]]
set_property PACKAGE_PIN R6 [get_ports sw[14]]
set_property PACKAGE_PIN V5 [get_ports sw[15]]
set_property PACKAGE_PIN U6 [get_ports sw[16]]
set_property PACKAGE_PIN W5 [get_ports sw[17]]
set_property PACKAGE_PIN W6 [get_ports sw[18]]
set_property PACKAGE_PIN U5 [get_ports sw[19]]
set_property PACKAGE_PIN T5 [get_ports sw[20]]
set_property PACKAGE_PIN T4 [get_ports sw[21]]
set_property PACKAGE_PIN R4 [get_ports sw[22]]
set_property PACKAGE_PIN W4 [get_ports sw[23]]

set_property PACKAGE_PIN D19 [get_ports clock_rtl]
set_property IOSTANDARD LVCMOS33 [get_ports clock_rtl]

set_property PACKAGE_PIN M19 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]

set_property PACKAGE_PIN P19 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]

set_property PACKAGE_PIN U21 [get_ports reset_rtl]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl]
#set_property PULLUP true [get_ports reset_rtl]

# I2C
set_property PACKAGE_PIN E17 [get_ports iic_scl_io]
set_property PACKAGE_PIN E18 [get_ports iic_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_scl_io]
# I2C - END

# QSPI
set_property PACKAGE_PIN U16 [get_ports qspi_io0_io]
set_property PACKAGE_PIN U20 [get_ports qspi_io1_io]
set_property PACKAGE_PIN U5 [get_ports qspi_io2_io]
set_property PACKAGE_PIN U6 [get_ports qspi_io3_io]
set_property PACKAGE_PIN L23 [get_ports {qspi_ss_io[0]}]
set_property PACKAGE_PIN P15 [get_ports qspi_sck_io]

set_property IOSTANDARD LVCMOS33 [get_ports qspi_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_io2_io]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_io3_io]
set_property IOSTANDARD LVCMOS33 [get_ports {qspi_ss_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_sck_io]
# QSPI - END

################### LOOPBACK GPIO ###################################
set_property PACKAGE_PIN V19 [get_ports {test_gpio_0_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[0]}]

set_property PACKAGE_PIN W19 [get_ports {test_gpio_1_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[0]}]
#set_property PACKAGE_PIN P15 [get_ports {test_gpio_0_tri_io[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[0]}]

#set_property PACKAGE_PIN P16 [get_ports {test_gpio_1_tri_io[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[0]}]

set_property PACKAGE_PIN V18 [get_ports {test_gpio_0_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[1]}]

set_property PACKAGE_PIN W18 [get_ports {test_gpio_1_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[1]}]
#set_property PACKAGE_PIN L22 [get_ports {test_gpio_0_tri_io[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[1]}]

#set_property PACKAGE_PIN L23 [get_ports {test_gpio_1_tri_io[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[1]}]

set_property PACKAGE_PIN M21 [get_ports {test_gpio_0_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[2]}]

set_property PACKAGE_PIN M22 [get_ports {test_gpio_1_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[2]}]

set_property PACKAGE_PIN U14 [get_ports {test_gpio_0_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[3]}]

set_property PACKAGE_PIN V14 [get_ports {test_gpio_1_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[3]}]

#set_property PACKAGE_PIN N21 [get_ports {test_gpio_0_tri_io[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[3]}]

#set_property PACKAGE_PIN N22 [get_ports {test_gpio_1_tri_io[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[3]}]

set_property PACKAGE_PIN P20 [get_ports {test_gpio_0_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[4]}]

set_property PACKAGE_PIN P21 [get_ports {test_gpio_1_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[4]}]

set_property PACKAGE_PIN N23 [get_ports {test_gpio_0_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[5]}]

set_property PACKAGE_PIN N24 [get_ports {test_gpio_1_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[5]}]

set_property PACKAGE_PIN T17 [get_ports {test_gpio_0_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[6]}]

set_property PACKAGE_PIN T18 [get_ports {test_gpio_1_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[6]}]

#set_property PACKAGE_PIN U15 [get_ports {test_gpio_0_tri_io[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[6]}]

#set_property PACKAGE_PIN U16 [get_ports {test_gpio_1_tri_io[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[6]}]

#set_property PACKAGE_PIN U24 [get_ports {test_gpio_0_tri_io[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[6]}]

#set_property PACKAGE_PIN U17 [get_ports {test_gpio_1_tri_io[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[6]}]

set_property PACKAGE_PIN U25 [get_ports {test_gpio_0_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[7]}]

set_property PACKAGE_PIN U26 [get_ports {test_gpio_1_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[7]}]

set_property PACKAGE_PIN V26 [get_ports {test_gpio_0_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[8]}]

set_property PACKAGE_PIN W26 [get_ports {test_gpio_1_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[8]}]

set_property PACKAGE_PIN AB26 [get_ports {test_gpio_0_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[9]}]

set_property PACKAGE_PIN AC26 [get_ports {test_gpio_1_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[9]}]

set_property PACKAGE_PIN W25 [get_ports {test_gpio_0_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[10]}]

set_property PACKAGE_PIN Y26 [get_ports {test_gpio_1_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[10]}]

set_property PACKAGE_PIN Y25 [get_ports {test_gpio_0_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[11]}]

set_property PACKAGE_PIN AA25 [get_ports {test_gpio_1_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[11]}]

set_property PACKAGE_PIN V24 [get_ports {test_gpio_0_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[12]}]

set_property PACKAGE_PIN W24 [get_ports {test_gpio_1_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[12]}]

set_property PACKAGE_PIN AA24 [get_ports {test_gpio_0_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[13]}]

set_property PACKAGE_PIN AB25 [get_ports {test_gpio_1_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[13]}]

set_property PACKAGE_PIN AA22 [get_ports {test_gpio_0_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[14]}]

set_property PACKAGE_PIN AA23 [get_ports {test_gpio_1_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[14]}]

set_property PACKAGE_PIN AB24 [get_ports {test_gpio_0_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[15]}]

set_property PACKAGE_PIN AC24 [get_ports {test_gpio_1_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[15]}]

#set_property PACKAGE_PIN V23 [get_ports {test_gpio_0_tri_io[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[16]}]

#set_property PACKAGE_PIN W23 [get_ports {test_gpio_1_tri_io[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[16]}]

set_property PACKAGE_PIN W20 [get_ports {test_gpio_0_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[16]}]

set_property PACKAGE_PIN Y20 [get_ports {test_gpio_1_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[16]}]

set_property PACKAGE_PIN Y22 [get_ports {test_gpio_0_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[17]}]

set_property PACKAGE_PIN Y23 [get_ports {test_gpio_1_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[17]}]

set_property PACKAGE_PIN U22 [get_ports {test_gpio_0_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[18]}]

set_property PACKAGE_PIN V22 [get_ports {test_gpio_1_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[18]}]

set_property PACKAGE_PIN T14 [get_ports {test_gpio_0_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[19]}]

set_property PACKAGE_PIN T15 [get_ports {test_gpio_1_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[19]}]

#set_property PACKAGE_PIN U21[get_ports {test_gpio_0_tri_io[19]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_0_tri_io[19]}]

#set_property PACKAGE_PIN V21[get_ports {test_gpio_1_tri_io[19]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_1_tri_io[19]}]

set_property PACKAGE_PIN W21 [get_ports {test_gpio_0_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[20]}]

set_property PACKAGE_PIN Y21 [get_ports {test_gpio_1_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[20]}]

set_property PACKAGE_PIN V16 [get_ports {test_gpio_0_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[21]}]

set_property PACKAGE_PIN V17 [get_ports {test_gpio_1_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[21]}]

set_property PACKAGE_PIN U19 [get_ports {test_gpio_0_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[22]}]

set_property PACKAGE_PIN T20 [get_ports {test_gpio_1_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[22]}]

set_property PACKAGE_PIN T19 [get_ports {test_gpio_0_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[23]}]

set_property PACKAGE_PIN U17 [get_ports {test_gpio_1_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[23]}]

set_property PACKAGE_PIN U15 [get_ports {test_gpio_0_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[24]}]

set_property PACKAGE_PIN U24 [get_ports {test_gpio_1_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[24]}]

set_property PACKAGE_PIN U2 [get_ports {test_gpio_0_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[25]}]

set_property PACKAGE_PIN N8 [get_ports {test_gpio_1_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[25]}]

set_property PACKAGE_PIN U1 [get_ports {test_gpio_0_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_0_tri_io[26]}]

set_property PACKAGE_PIN U4 [get_ports {test_gpio_1_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_1_tri_io[26]}]

#set_property PACKAGE_PIN N8[get_ports {test_gpio_0_tri_io[21]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_0_tri_io[21]}]

#set_property PACKAGE_PIN U4[get_ports {test_gpio_1_tri_io[21]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_1_tri_io[21]}]

#set_property PACKAGE_PIN T20[get_ports {test_gpio_0_tri_io[21]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_0_tri_io[21]}]

#set_property PACKAGE_PIN U20[get_ports {test_gpio_1_tri_io[21]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_1_tri_io[21]}]

#set_property PACKAGE_PIN T19[get_ports {test_gpio_0_tri_io[23]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_0_tri_io[23]}]

#set_property PACKAGE_PIN U19[get_ports {test_gpio_1_tri_io[23]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_1_tri_io[23]}]

##########################################################################################################
set_property PACKAGE_PIN K3 [get_ports {test_gpio_2_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[0]}]

set_property PACKAGE_PIN J3 [get_ports {test_gpio_3_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[0]}]

set_property PACKAGE_PIN M7 [get_ports {test_gpio_2_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[1]}]

set_property PACKAGE_PIN L7 [get_ports {test_gpio_3_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[1]}]

set_property PACKAGE_PIN M4 [get_ports {test_gpio_2_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[2]}]

set_property PACKAGE_PIN L4 [get_ports {test_gpio_3_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[2]}]

set_property PACKAGE_PIN L5 [get_ports {test_gpio_2_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[3]}]

set_property PACKAGE_PIN K5 [get_ports {test_gpio_3_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[3]}]

set_property PACKAGE_PIN N7 [get_ports {test_gpio_2_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[4]}]

set_property PACKAGE_PIN N6 [get_ports {test_gpio_3_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[4]}]

set_property PACKAGE_PIN M6 [get_ports {test_gpio_2_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[5]}]

set_property PACKAGE_PIN M5 [get_ports {test_gpio_3_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[5]}]

set_property PACKAGE_PIN K1 [get_ports {test_gpio_2_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[6]}]

set_property PACKAGE_PIN J1 [get_ports {test_gpio_3_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[6]}]

set_property PACKAGE_PIN L3 [get_ports {test_gpio_2_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[7]}]

set_property PACKAGE_PIN K2 [get_ports {test_gpio_3_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[7]}]

set_property PACKAGE_PIN N1 [get_ports {test_gpio_2_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[8]}]

set_property PACKAGE_PIN M1 [get_ports {test_gpio_3_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[8]}]

set_property PACKAGE_PIN H2 [get_ports {test_gpio_2_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[9]}]

set_property PACKAGE_PIN H1 [get_ports {test_gpio_3_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[9]}]

set_property PACKAGE_PIN M2 [get_ports {test_gpio_2_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[10]}]

set_property PACKAGE_PIN L2 [get_ports {test_gpio_3_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[10]}]

set_property PACKAGE_PIN N3 [get_ports {test_gpio_2_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[11]}]

set_property PACKAGE_PIN N2 [get_ports {test_gpio_3_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[11]}]

set_property PACKAGE_PIN R3 [get_ports {test_gpio_2_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[12]}]

set_property PACKAGE_PIN P3 [get_ports {test_gpio_3_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[12]}]

set_property PACKAGE_PIN P4 [get_ports {test_gpio_2_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[13]}]

set_property PACKAGE_PIN N4 [get_ports {test_gpio_3_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[13]}]

set_property PACKAGE_PIN R1 [get_ports {test_gpio_2_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[14]}]

set_property PACKAGE_PIN P1 [get_ports {test_gpio_3_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[14]}]

set_property PACKAGE_PIN T4 [get_ports {test_gpio_2_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[15]}]

set_property PACKAGE_PIN T3 [get_ports {test_gpio_3_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[15]}]

set_property PACKAGE_PIN T2 [get_ports {test_gpio_2_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[16]}]

set_property PACKAGE_PIN R2 [get_ports {test_gpio_3_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[16]}]

set_property PACKAGE_PIN J19 [get_ports {test_gpio_2_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[17]}]

set_property PACKAGE_PIN H19 [get_ports {test_gpio_3_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[17]}]

#set_property PACKAGE_PIN U2 [get_ports {test_gpio_2_tri_io[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[17]}]

#set_property PACKAGE_PIN U1 [get_ports {test_gpio_3_tri_io[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[17]}]

set_property PACKAGE_PIN P6 [get_ports {test_gpio_2_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[18]}]

set_property PACKAGE_PIN P5 [get_ports {test_gpio_3_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[18]}]

set_property PACKAGE_PIN T5 [get_ports {test_gpio_2_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[19]}]

set_property PACKAGE_PIN R5 [get_ports {test_gpio_3_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[19]}]

set_property PACKAGE_PIN M16 [get_ports {test_gpio_2_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[20]}]

set_property PACKAGE_PIN M17 [get_ports {test_gpio_3_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[20]}]

#set_property PACKAGE_PIN U6[get_ports {test_gpio_2_tri_io[20]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_2_tri_io[20]}]

#set_property PACKAGE_PIN U5[get_ports {test_gpio_3_tri_io[20]}]
#set_property IOSTANDARD LVCMOS33[get_ports {test_gpio_3_tri_io[20]}]

set_property PACKAGE_PIN R8 [get_ports {test_gpio_2_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[21]}]

set_property PACKAGE_PIN P8 [get_ports {test_gpio_3_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[21]}]

set_property PACKAGE_PIN R7 [get_ports {test_gpio_2_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[22]}]

set_property PACKAGE_PIN R6 [get_ports {test_gpio_3_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[22]}]

set_property PACKAGE_PIN T8 [get_ports {test_gpio_2_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[23]}]

set_property PACKAGE_PIN T7 [get_ports {test_gpio_3_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[23]}]

set_property PACKAGE_PIN K18 [get_ports {test_gpio_2_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[24]}]

set_property PACKAGE_PIN L19 [get_ports {test_gpio_3_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[24]}]

set_property PACKAGE_PIN K15 [get_ports {test_gpio_2_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[25]}]

set_property PACKAGE_PIN J16 [get_ports {test_gpio_3_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[25]}]

set_property PACKAGE_PIN J14 [get_ports {test_gpio_2_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[26]}]

set_property PACKAGE_PIN J15 [get_ports {test_gpio_3_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[26]}]

set_property PACKAGE_PIN K16 [get_ports {test_gpio_2_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[27]}]

set_property PACKAGE_PIN K17 [get_ports {test_gpio_3_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[27]}]

set_property PACKAGE_PIN M14 [get_ports {test_gpio_2_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[28]}]

set_property PACKAGE_PIN L14 [get_ports {test_gpio_3_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[28]}]

set_property PACKAGE_PIN M15 [get_ports {test_gpio_2_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_2_tri_io[29]}]

set_property PACKAGE_PIN L15 [get_ports {test_gpio_3_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_3_tri_io[29]}]

#############################################################################

set_property PACKAGE_PIN L17 [get_ports {test_gpio_4_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[0]}]

set_property PACKAGE_PIN L18 [get_ports {test_gpio_5_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[0]}]

set_property PACKAGE_PIN K20 [get_ports {test_gpio_4_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[1]}]

set_property PACKAGE_PIN J20 [get_ports {test_gpio_5_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[1]}]

set_property PACKAGE_PIN J18 [get_ports {test_gpio_4_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[2]}]

set_property PACKAGE_PIN H18 [get_ports {test_gpio_5_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[2]}]

set_property PACKAGE_PIN G20 [get_ports {test_gpio_4_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[3]}]

set_property PACKAGE_PIN G21 [get_ports {test_gpio_5_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[3]}]

set_property PACKAGE_PIN K21 [get_ports {test_gpio_4_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[4]}]

set_property PACKAGE_PIN J21 [get_ports {test_gpio_5_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[4]}]

set_property PACKAGE_PIN H21 [get_ports {test_gpio_4_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[5]}]

set_property PACKAGE_PIN H22 [get_ports {test_gpio_5_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[5]}]

set_property PACKAGE_PIN J23 [get_ports {test_gpio_4_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[6]}]

set_property PACKAGE_PIN H23 [get_ports {test_gpio_5_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[6]}]

set_property PACKAGE_PIN G22 [get_ports {test_gpio_4_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[7]}]

set_property PACKAGE_PIN F22 [get_ports {test_gpio_5_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[7]}]

set_property PACKAGE_PIN J24 [get_ports {test_gpio_4_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[8]}]

set_property PACKAGE_PIN H24 [get_ports {test_gpio_5_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[8]}]

set_property PACKAGE_PIN F23 [get_ports {test_gpio_4_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[9]}]

set_property PACKAGE_PIN E23 [get_ports {test_gpio_5_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[9]}]

set_property PACKAGE_PIN K22 [get_ports {test_gpio_4_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[10]}]

set_property PACKAGE_PIN K23 [get_ports {test_gpio_5_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[10]}]

set_property PACKAGE_PIN G24 [get_ports {test_gpio_4_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[11]}]

set_property PACKAGE_PIN F24 [get_ports {test_gpio_5_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[11]}]

set_property PACKAGE_PIN E25 [get_ports {test_gpio_4_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[12]}]

set_property PACKAGE_PIN D25 [get_ports {test_gpio_5_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[12]}]

set_property PACKAGE_PIN E26 [get_ports {test_gpio_4_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[13]}]

set_property PACKAGE_PIN D26 [get_ports {test_gpio_5_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[13]}]

set_property PACKAGE_PIN H26 [get_ports {test_gpio_4_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[14]}]

set_property PACKAGE_PIN G26 [get_ports {test_gpio_5_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[14]}]

set_property PACKAGE_PIN G25 [get_ports {test_gpio_4_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[15]}]

set_property PACKAGE_PIN F25 [get_ports {test_gpio_5_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[15]}]

set_property PACKAGE_PIN J25 [get_ports {test_gpio_4_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[16]}]

set_property PACKAGE_PIN J26 [get_ports {test_gpio_5_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[16]}]

set_property PACKAGE_PIN J8 [get_ports {test_gpio_4_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[17]}]

set_property PACKAGE_PIN H3 [get_ports {test_gpio_5_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[17]}]

set_property PACKAGE_PIN E6 [get_ports {test_gpio_4_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[18]}]

set_property PACKAGE_PIN D6 [get_ports {test_gpio_5_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[18]}]

set_property PACKAGE_PIN H8 [get_ports {test_gpio_4_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[19]}]

set_property PACKAGE_PIN G8 [get_ports {test_gpio_5_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[19]}]

set_property PACKAGE_PIN H7 [get_ports {test_gpio_4_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[20]}]

set_property PACKAGE_PIN G7 [get_ports {test_gpio_5_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[20]}]

set_property PACKAGE_PIN F8 [get_ports {test_gpio_4_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[21]}]

set_property PACKAGE_PIN F7 [get_ports {test_gpio_5_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[21]}]

set_property PACKAGE_PIN H6 [get_ports {test_gpio_4_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[22]}]

set_property PACKAGE_PIN G6 [get_ports {test_gpio_5_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[22]}]

set_property PACKAGE_PIN H9 [get_ports {test_gpio_4_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[23]}]

set_property PACKAGE_PIN G9 [get_ports {test_gpio_5_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[23]}]

set_property PACKAGE_PIN J6 [get_ports {test_gpio_4_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[24]}]

set_property PACKAGE_PIN J5 [get_ports {test_gpio_5_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[24]}]

set_property PACKAGE_PIN L8 [get_ports {test_gpio_4_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[25]}]

set_property PACKAGE_PIN K8 [get_ports {test_gpio_5_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[25]}]

set_property PACKAGE_PIN J4 [get_ports {test_gpio_4_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[26]}]

set_property PACKAGE_PIN H4 [get_ports {test_gpio_5_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[26]}]

set_property PACKAGE_PIN K7 [get_ports {test_gpio_4_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[27]}]

set_property PACKAGE_PIN K6 [get_ports {test_gpio_5_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[27]}]

set_property PACKAGE_PIN G4 [get_ports {test_gpio_4_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[28]}]

set_property PACKAGE_PIN F4 [get_ports {test_gpio_5_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[28]}]

set_property PACKAGE_PIN G5 [get_ports {test_gpio_4_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[29]}]

set_property PACKAGE_PIN F5 [get_ports {test_gpio_5_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[29]}]

set_property PACKAGE_PIN E5 [get_ports {test_gpio_4_tri_io[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[30]}]

set_property PACKAGE_PIN D5 [get_ports {test_gpio_5_tri_io[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[30]}]

set_property PACKAGE_PIN D4 [get_ports {test_gpio_4_tri_io[31]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_4_tri_io[31]}]

set_property PACKAGE_PIN C4 [get_ports {test_gpio_5_tri_io[31]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_5_tri_io[31]}]

####################################################################################

set_property PACKAGE_PIN B5 [get_ports {test_gpio_6_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[0]}]

set_property PACKAGE_PIN A5 [get_ports {test_gpio_7_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[0]}]

set_property PACKAGE_PIN B4 [get_ports {test_gpio_6_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[1]}]

set_property PACKAGE_PIN A4 [get_ports {test_gpio_7_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[1]}]

set_property PACKAGE_PIN D3 [get_ports {test_gpio_6_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[2]}]

set_property PACKAGE_PIN C3 [get_ports {test_gpio_7_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[2]}]

set_property PACKAGE_PIN F3 [get_ports {test_gpio_6_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[3]}]

set_property PACKAGE_PIN E3 [get_ports {test_gpio_7_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[3]}]

set_property PACKAGE_PIN C2 [get_ports {test_gpio_6_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[4]}]

set_property PACKAGE_PIN B2 [get_ports {test_gpio_7_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[4]}]

set_property PACKAGE_PIN A3 [get_ports {test_gpio_6_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[5]}]

set_property PACKAGE_PIN A2 [get_ports {test_gpio_7_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[5]}]

set_property PACKAGE_PIN C1 [get_ports {test_gpio_6_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[6]}]

set_property PACKAGE_PIN B1 [get_ports {test_gpio_7_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[6]}]

set_property PACKAGE_PIN F2 [get_ports {test_gpio_6_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[7]}]

set_property PACKAGE_PIN E2 [get_ports {test_gpio_7_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[7]}]

set_property PACKAGE_PIN E1 [get_ports {test_gpio_6_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[8]}]

set_property PACKAGE_PIN D1 [get_ports {test_gpio_7_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[8]}]

set_property PACKAGE_PIN G2 [get_ports {test_gpio_6_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[9]}]

set_property PACKAGE_PIN G1 [get_ports {test_gpio_7_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[9]}]

set_property PACKAGE_PIN H14 [get_ports {test_gpio_6_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[10]}]

set_property PACKAGE_PIN H15 [get_ports {test_gpio_7_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[10]}]

set_property PACKAGE_PIN G17 [get_ports {test_gpio_6_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[11]}]

set_property PACKAGE_PIN F17 [get_ports {test_gpio_7_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[11]}]

set_property PACKAGE_PIN F18 [get_ports {test_gpio_6_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[12]}]

set_property PACKAGE_PIN F19 [get_ports {test_gpio_7_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[12]}]

set_property PACKAGE_PIN G15 [get_ports {test_gpio_6_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[13]}]

set_property PACKAGE_PIN F15 [get_ports {test_gpio_7_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[13]}]

set_property PACKAGE_PIN G19 [get_ports {test_gpio_6_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[14]}]

set_property PACKAGE_PIN F20 [get_ports {test_gpio_7_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[14]}]

set_property PACKAGE_PIN H16 [get_ports {test_gpio_6_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[15]}]

set_property PACKAGE_PIN G16 [get_ports {test_gpio_7_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[15]}]

set_property PACKAGE_PIN C17 [get_ports {test_gpio_6_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[16]}]

set_property PACKAGE_PIN B17 [get_ports {test_gpio_7_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[16]}]

set_property PACKAGE_PIN A17 [get_ports {test_gpio_6_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[17]}]

set_property PACKAGE_PIN A18 [get_ports {test_gpio_7_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[17]}]

set_property PACKAGE_PIN D18 [get_ports {test_gpio_6_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[18]}]

set_property PACKAGE_PIN C18 [get_ports {test_gpio_7_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[18]}]

set_property PACKAGE_PIN C19 [get_ports {test_gpio_6_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[19]}]

set_property PACKAGE_PIN A22 [get_ports {test_gpio_7_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[19]}]

set_property PACKAGE_PIN E20 [get_ports {test_gpio_6_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[20]}]

set_property PACKAGE_PIN D20 [get_ports {test_gpio_7_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[20]}]

set_property PACKAGE_PIN B20 [get_ports {test_gpio_6_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[21]}]

set_property PACKAGE_PIN A20 [get_ports {test_gpio_7_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[21]}]

set_property PACKAGE_PIN E21 [get_ports {test_gpio_6_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[22]}]

set_property PACKAGE_PIN D21 [get_ports {test_gpio_7_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[22]}]

set_property PACKAGE_PIN C23 [get_ports {test_gpio_6_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[23]}]

set_property PACKAGE_PIN E22 [get_ports {test_gpio_7_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[23]}]

set_property PACKAGE_PIN B25 [get_ports {test_gpio_6_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[24]}]

set_property PACKAGE_PIN A25 [get_ports {test_gpio_7_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[24]}]

set_property PACKAGE_PIN A23 [get_ports {test_gpio_6_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[25]}]

set_property PACKAGE_PIN A24 [get_ports {test_gpio_7_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[25]}]

set_property PACKAGE_PIN C26 [get_ports {test_gpio_6_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[26]}]

set_property PACKAGE_PIN B26 [get_ports {test_gpio_7_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[26]}]

set_property PACKAGE_PIN C24 [get_ports {test_gpio_6_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[27]}]

set_property PACKAGE_PIN B24 [get_ports {test_gpio_7_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[27]}]

set_property PACKAGE_PIN D23 [get_ports {test_gpio_6_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_6_tri_io[28]}]

set_property PACKAGE_PIN D24 [get_ports {test_gpio_7_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {test_gpio_7_tri_io[28]}]

################### LOOPBACK GPIO END ###################################


#------- MRAM channel_1 18 pins & control pins -- address pins -----------
#A0 - T23
set_property PACKAGE_PIN T23 [get_ports {mram1_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[0]}]
#A1 - R22
set_property PACKAGE_PIN R22 [get_ports {mram1_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[1]}]
#A2 - T22
set_property PACKAGE_PIN T22 [get_ports {mram1_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[2]}]
#A3 - P26
set_property PACKAGE_PIN P26 [get_ports {mram1_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[3]}]
#A4 - R26
set_property PACKAGE_PIN R26 [get_ports {mram1_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[4]}]
#A5 - T25
set_property PACKAGE_PIN T25 [get_ports {mram1_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[5]}]
#A6 - M26
set_property PACKAGE_PIN M26 [get_ports {mram1_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[6]}]
#A7 - N26
set_property PACKAGE_PIN N26 [get_ports {mram1_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[7]}]
#A8 - P25
set_property PACKAGE_PIN P25 [get_ports {mram1_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[8]}]
#A9 - R25
set_property PACKAGE_PIN R25 [get_ports {mram1_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[9]}]
#A10 - R21
set_property PACKAGE_PIN R21 [get_ports {mram1_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[10]}]
#A11 - R20
set_property PACKAGE_PIN R20 [get_ports {mram1_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[11]}]
#A12 - P24
set_property PACKAGE_PIN P24 [get_ports {mram1_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[12]}]
#A13 - P23
set_property PACKAGE_PIN P23 [get_ports {mram1_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[13]}]
#A14 - N19
set_property PACKAGE_PIN N19 [get_ports {mram1_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[14]}]
#A15 - R18
set_property PACKAGE_PIN R18 [get_ports {mram1_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[15]}]
#A16 - T24
set_property PACKAGE_PIN T24 [get_ports {mram1_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[16]}]
#A17 - B21
set_property PACKAGE_PIN B21 [get_ports {mram1_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[17]}]

#--------Control pins---------
#/G - P16
set_property PACKAGE_PIN P16 [get_ports {mram1_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[18]}]
#/UB - N22
set_property PACKAGE_PIN N22 [get_ports {mram1_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[19]}]
#/LB - R23
set_property PACKAGE_PIN R23 [get_ports {mram1_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[20]}]
#/W - L22
set_property PACKAGE_PIN L22 [get_ports {mram1_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[21]}]
#/E - C21
set_property PACKAGE_PIN C21 [get_ports {mram1_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram1_tri_io[22]}]

# -----MRAM channel_2 16 pins -- data pins -----
#DQL0 - R14
set_property PACKAGE_PIN R14 [get_ports {mram2_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[0]}]
#DQL1 - R15
set_property PACKAGE_PIN R15 [get_ports {mram2_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[1]}]
#DQL2 - P14
set_property PACKAGE_PIN P14 [get_ports {mram2_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[2]}]
#DQL3 - N14
set_property PACKAGE_PIN N14 [get_ports {mram2_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[3]}]
#DQL4 - N16
set_property PACKAGE_PIN N16 [get_ports {mram2_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[4]}]
#DQL5 - N17
set_property PACKAGE_PIN N17 [get_ports {mram2_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[5]}]
#DQL6 - R16
set_property PACKAGE_PIN R16 [get_ports {mram2_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[6]}]
#DQL7 - R17
set_property PACKAGE_PIN R17 [get_ports {mram2_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[7]}]
#DQU8 - N18
set_property PACKAGE_PIN N18 [get_ports {mram2_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[8]}]
#DQU9 - K25
set_property PACKAGE_PIN K25 [get_ports {mram2_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[9]}]
#DQU10 - K26
set_property PACKAGE_PIN K26 [get_ports {mram2_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[10]}]
#DQU11 - M20
set_property PACKAGE_PIN M20 [get_ports {mram2_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[11]}]
#DQU12 - L20
set_property PACKAGE_PIN L20 [get_ports {mram2_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[12]}]
#DQU13 - L25
set_property PACKAGE_PIN L25 [get_ports {mram2_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[13]}]
#DQU14 - M24
set_property PACKAGE_PIN M24 [get_ports {mram2_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[14]}]
#DQU15 - M25
set_property PACKAGE_PIN M25 [get_ports {mram2_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {mram2_tri_io[15]}]

# bitgen settings
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.M0PIN PULLUP [current_design]
set_property BITSTREAM.CONFIG.M1PIN PULLDOWN [current_design]
set_property BITSTREAM.CONFIG.M2PIN PULLDOWN [current_design]


#connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_out1]

#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[0]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[22]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[21]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[20]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[19]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[18]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[17]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[13]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[16]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[14]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[15]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[10]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[12]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[7]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[3]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[5]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[4]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[9]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[6]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[8]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[1]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[2]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[11]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[5]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[13]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[7]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[11]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[2]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[20]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[16]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[1]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[0]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[6]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[3]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[19]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[15]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[14]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[10]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[17]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[18]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[12]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[9]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[21]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[22]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[8]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[4]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[16]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[18]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[15]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[10]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[5]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[3]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[13]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[12]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[9]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[11]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[8]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[7]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[6]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[2]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[1]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[14]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[21]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[4]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[22]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[0]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[20]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[17]}]
#set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[19]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[2]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[3]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[18]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[0]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[22]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[24]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[27]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[28]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[29]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[25]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[26]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[31]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[30]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[13]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[21]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[10]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[19]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[12]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[4]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[8]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[17]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[6]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[15]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[9]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[7]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[5]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[11]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[23]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[20]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[14]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[16]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[1]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[6]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[8]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[5]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[1]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[3]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[2]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[0]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[4]}]
#set_property MARK_DEBUG true [get_nets {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[7]}]
#set_property MARK_DEBUG true [get_nets interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARVALID]
#set_property MARK_DEBUG true [get_nets interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARREADY]
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list interposer_test_i/clk_wiz_1/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 9 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[0]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[1]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[2]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[3]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[4]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[5]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[6]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[7]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARADDR[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 32 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[0]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[1]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[2]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[3]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[4]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[5]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[6]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[7]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[8]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[9]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[10]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[11]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[12]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[13]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[14]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[15]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[16]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[17]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[18]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[19]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[20]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[21]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[22]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[23]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[24]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[25]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[26]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[27]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[28]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[29]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[30]} {interposer_test_i/microblaze_0_axi_periph_M04_AXI_WDATA[31]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 23 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {interposer_test_i/mram1_tri_i[0]} {interposer_test_i/mram1_tri_i[1]} {interposer_test_i/mram1_tri_i[2]} {interposer_test_i/mram1_tri_i[3]} {interposer_test_i/mram1_tri_i[4]} {interposer_test_i/mram1_tri_i[5]} {interposer_test_i/mram1_tri_i[6]} {interposer_test_i/mram1_tri_i[7]} {interposer_test_i/mram1_tri_i[8]} {interposer_test_i/mram1_tri_i[9]} {interposer_test_i/mram1_tri_i[10]} {interposer_test_i/mram1_tri_i[11]} {interposer_test_i/mram1_tri_i[12]} {interposer_test_i/mram1_tri_i[13]} {interposer_test_i/mram1_tri_i[14]} {interposer_test_i/mram1_tri_i[15]} {interposer_test_i/mram1_tri_i[16]} {interposer_test_i/mram1_tri_i[17]} {interposer_test_i/mram1_tri_i[18]} {interposer_test_i/mram1_tri_i[19]} {interposer_test_i/mram1_tri_i[20]} {interposer_test_i/mram1_tri_i[21]} {interposer_test_i/mram1_tri_i[22]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 23 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {interposer_test_i/mram1_tri_o[0]} {interposer_test_i/mram1_tri_o[1]} {interposer_test_i/mram1_tri_o[2]} {interposer_test_i/mram1_tri_o[3]} {interposer_test_i/mram1_tri_o[4]} {interposer_test_i/mram1_tri_o[5]} {interposer_test_i/mram1_tri_o[6]} {interposer_test_i/mram1_tri_o[7]} {interposer_test_i/mram1_tri_o[8]} {interposer_test_i/mram1_tri_o[9]} {interposer_test_i/mram1_tri_o[10]} {interposer_test_i/mram1_tri_o[11]} {interposer_test_i/mram1_tri_o[12]} {interposer_test_i/mram1_tri_o[13]} {interposer_test_i/mram1_tri_o[14]} {interposer_test_i/mram1_tri_o[15]} {interposer_test_i/mram1_tri_o[16]} {interposer_test_i/mram1_tri_o[17]} {interposer_test_i/mram1_tri_o[18]} {interposer_test_i/mram1_tri_o[19]} {interposer_test_i/mram1_tri_o[20]} {interposer_test_i/mram1_tri_o[21]} {interposer_test_i/mram1_tri_o[22]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 23 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {interposer_test_i/mram1_tri_t[0]} {interposer_test_i/mram1_tri_t[1]} {interposer_test_i/mram1_tri_t[2]} {interposer_test_i/mram1_tri_t[3]} {interposer_test_i/mram1_tri_t[4]} {interposer_test_i/mram1_tri_t[5]} {interposer_test_i/mram1_tri_t[6]} {interposer_test_i/mram1_tri_t[7]} {interposer_test_i/mram1_tri_t[8]} {interposer_test_i/mram1_tri_t[9]} {interposer_test_i/mram1_tri_t[10]} {interposer_test_i/mram1_tri_t[11]} {interposer_test_i/mram1_tri_t[12]} {interposer_test_i/mram1_tri_t[13]} {interposer_test_i/mram1_tri_t[14]} {interposer_test_i/mram1_tri_t[15]} {interposer_test_i/mram1_tri_t[16]} {interposer_test_i/mram1_tri_t[17]} {interposer_test_i/mram1_tri_t[18]} {interposer_test_i/mram1_tri_t[19]} {interposer_test_i/mram1_tri_t[20]} {interposer_test_i/mram1_tri_t[21]} {interposer_test_i/mram1_tri_t[22]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 1 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARREADY]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 1 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list interposer_test_i/microblaze_0_axi_periph_M04_AXI_ARVALID]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets u_ila_0_0_clk_out1]

set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[16]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[0]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[1]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[5]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[17]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[15]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[22]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[20]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[4]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[7]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[2]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[18]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[8]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[21]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[10]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[9]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[19]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[13]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[3]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[6]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[11]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[12]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_i[14]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[5]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[11]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[10]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[17]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[21]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[0]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[4]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[22]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[9]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[7]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[14]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[18]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[12]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[19]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[20]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[16]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[1]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[3]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[6]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[2]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[8]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[13]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_o[15]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[14]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[7]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[18]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[5]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[6]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[10]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[16]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[12]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[9]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[22]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[1]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[19]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[21]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[17]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[20]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[4]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[0]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[8]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[3]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[2]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[15]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[11]}]
set_property MARK_DEBUG false [get_nets {interposer_test_i/mram1_tri_t[13]}]

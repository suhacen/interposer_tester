
################################################################
# This is a generated script based on design: interposer_test
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source interposer_test_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tfgg676-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name interposer_test

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set IIC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC ]
  set QSPI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI ]
  set UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART ]
  set mram1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 mram1 ]
  set mram2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 mram2 ]
  set test_gpio_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_0 ]
  set test_gpio_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_1 ]
  set test_gpio_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_2 ]
  set test_gpio_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_3 ]
  set test_gpio_4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_4 ]
  set test_gpio_5 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_5 ]
  set test_gpio_6 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_6 ]
  set test_gpio_7 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 test_gpio_7 ]

  # Create ports
  set clock_rtl [ create_bd_port -dir I -type clk clock_rtl ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {50000000} \
CONFIG.PHASE {0.000} \
 ] $clock_rtl
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_rtl

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
CONFIG.C_SCK_RATIO {2} \
CONFIG.C_SPI_MEMORY {2} \
CONFIG.C_SPI_MODE {2} \
CONFIG.C_USE_STARTUP {0} \
CONFIG.C_USE_STARTUP_INT {0} \
 ] $axi_quad_spi_0

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {200.0} \
CONFIG.CLKOUT1_JITTER {162.035} \
CONFIG.CLKOUT1_PHASE_ERROR {164.985} \
CONFIG.MMCM_CLKFBOUT_MULT_F {20.000} \
CONFIG.MMCM_CLKIN1_PERIOD {20.0} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIM_IN_FREQ {50} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_1

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_ICACHE_LINE_LEN {8} \
CONFIG.C_I_LMB {1} \
CONFIG.C_MMU_ZONES {2} \
CONFIG.C_M_AXI_D_BUS_EXCEPTION {1} \
CONFIG.C_NUMBER_OF_PC_BRK {2} \
CONFIG.C_USE_BARREL {1} \
CONFIG.C_USE_DCACHE {1} \
CONFIG.C_USE_HW_MUL {1} \
CONFIG.C_USE_ICACHE {1} \
CONFIG.C_USE_MSR_INSTR {1} \
CONFIG.C_USE_PCMP_INSTR {1} \
CONFIG.G_TEMPLATE_LIST {6} \
CONFIG.G_USE_EXCEPTIONS {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {9} \
CONFIG.NUM_SI {3} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $microblaze_0_xlconcat

  # Create instance: mram, and set properties
  set mram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 mram ]
  set_property -dict [ list \
CONFIG.C_GPIO2_WIDTH {16} \
CONFIG.C_GPIO_WIDTH {23} \
CONFIG.C_IS_DUAL {1} \
 ] $mram

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: test_gpio_a, and set properties
  set test_gpio_a [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 test_gpio_a ]
  set_property -dict [ list \
CONFIG.C_GPIO2_WIDTH {27} \
CONFIG.C_GPIO_WIDTH {27} \
CONFIG.C_IS_DUAL {1} \
 ] $test_gpio_a

  # Create instance: test_gpio_b, and set properties
  set test_gpio_b [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 test_gpio_b ]
  set_property -dict [ list \
CONFIG.C_GPIO2_WIDTH {30} \
CONFIG.C_GPIO_WIDTH {30} \
CONFIG.C_IS_DUAL {1} \
 ] $test_gpio_b

  # Create instance: test_gpio_c, and set properties
  set test_gpio_c [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 test_gpio_c ]
  set_property -dict [ list \
CONFIG.C_IS_DUAL {1} \
 ] $test_gpio_c

  # Create instance: test_gpio_d, and set properties
  set test_gpio_d [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 test_gpio_d ]
  set_property -dict [ list \
CONFIG.C_GPIO2_WIDTH {29} \
CONFIG.C_GPIO_WIDTH {29} \
CONFIG.C_IS_DUAL {1} \
 ] $test_gpio_d

  # Create interface connections
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports IIC] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports QSPI] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports UART] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins microblaze_0/M_AXI_DC] [get_bd_intf_pins microblaze_0_axi_periph/S01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins microblaze_0/M_AXI_IC] [get_bd_intf_pins microblaze_0_axi_periph/S02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_quad_spi_0/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI] [get_bd_intf_pins mram/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI] [get_bd_intf_pins test_gpio_a/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI] [get_bd_intf_pins test_gpio_b/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI] [get_bd_intf_pins test_gpio_c/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M08_AXI [get_bd_intf_pins microblaze_0_axi_periph/M08_AXI] [get_bd_intf_pins test_gpio_d/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net mram_GPIO [get_bd_intf_ports mram1] [get_bd_intf_pins mram/GPIO]
  connect_bd_intf_net -intf_net mram_GPIO2 [get_bd_intf_ports mram2] [get_bd_intf_pins mram/GPIO2]
  connect_bd_intf_net -intf_net test_gpio_0_GPIO [get_bd_intf_ports test_gpio_0] [get_bd_intf_pins test_gpio_a/GPIO]
  connect_bd_intf_net -intf_net test_gpio_0_GPIO2 [get_bd_intf_ports test_gpio_1] [get_bd_intf_pins test_gpio_a/GPIO2]
  connect_bd_intf_net -intf_net test_gpio_b_GPIO [get_bd_intf_ports test_gpio_2] [get_bd_intf_pins test_gpio_b/GPIO]
  connect_bd_intf_net -intf_net test_gpio_b_GPIO2 [get_bd_intf_ports test_gpio_3] [get_bd_intf_pins test_gpio_b/GPIO2]
  connect_bd_intf_net -intf_net test_gpio_c_GPIO [get_bd_intf_ports test_gpio_4] [get_bd_intf_pins test_gpio_c/GPIO]
  connect_bd_intf_net -intf_net test_gpio_c_GPIO2 [get_bd_intf_ports test_gpio_5] [get_bd_intf_pins test_gpio_c/GPIO2]
  connect_bd_intf_net -intf_net test_gpio_d_GPIO [get_bd_intf_ports test_gpio_6] [get_bd_intf_pins test_gpio_d/GPIO]
  connect_bd_intf_net -intf_net test_gpio_d_GPIO2 [get_bd_intf_ports test_gpio_7] [get_bd_intf_pins test_gpio_d/GPIO2]

  # Create port connections
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt [get_bd_pins axi_quad_spi_0/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net clock_rtl_1 [get_bd_ports clock_rtl] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/M08_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_axi_periph/S01_ACLK] [get_bd_pins microblaze_0_axi_periph/S02_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mram/s_axi_aclk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins test_gpio_a/s_axi_aclk] [get_bd_pins test_gpio_b/s_axi_aclk] [get_bd_pins test_gpio_c/s_axi_aclk] [get_bd_pins test_gpio_d/s_axi_aclk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/M08_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins microblaze_0_axi_periph/S01_ARESETN] [get_bd_pins microblaze_0_axi_periph/S02_ARESETN] [get_bd_pins mram/s_axi_aresetn] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn] [get_bd_pins test_gpio_a/s_axi_aresetn] [get_bd_pins test_gpio_b/s_axi_aresetn] [get_bd_pins test_gpio_c/s_axi_aresetn] [get_bd_pins test_gpio_d/s_axi_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x40800000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40800000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x40000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x40000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mram/S_AXI/Reg] SEG_mram_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mram/S_AXI/Reg] SEG_mram_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs test_gpio_a/S_AXI/Reg] SEG_test_gpio_a_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs test_gpio_a/S_AXI/Reg] SEG_test_gpio_a_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40020000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs test_gpio_b/S_AXI/Reg] SEG_test_gpio_b_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40020000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs test_gpio_b/S_AXI/Reg] SEG_test_gpio_b_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40030000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs test_gpio_c/S_AXI/Reg] SEG_test_gpio_c_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40030000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs test_gpio_c/S_AXI/Reg] SEG_test_gpio_c_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40040000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs test_gpio_d/S_AXI/Reg] SEG_test_gpio_d_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40040000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs test_gpio_d/S_AXI/Reg] SEG_test_gpio_d_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port reset_rtl -pg 1 -y 1080 -defaultsOSRD
preplace port UART -pg 1 -y 210 -defaultsOSRD
preplace port test_gpio_0 -pg 1 -y 610 -defaultsOSRD
preplace port test_gpio_1 -pg 1 -y 630 -defaultsOSRD
preplace port mram1 -pg 1 -y 490 -defaultsOSRD
preplace port test_gpio_2 -pg 1 -y 730 -defaultsOSRD
preplace port mram2 -pg 1 -y 510 -defaultsOSRD
preplace port QSPI -pg 1 -y 60 -defaultsOSRD
preplace port test_gpio_3 -pg 1 -y 750 -defaultsOSRD
preplace port IIC -pg 1 -y 340 -defaultsOSRD
preplace port test_gpio_4 -pg 1 -y 850 -defaultsOSRD
preplace port test_gpio_5 -pg 1 -y 870 -defaultsOSRD
preplace port test_gpio_6 -pg 1 -y 970 -defaultsOSRD
preplace port clock_rtl -pg 1 -y 1140 -defaultsOSRD
preplace port test_gpio_7 -pg 1 -y 990 -defaultsOSRD
preplace inst test_gpio_a -pg 1 -lvl 7 -y 620 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 7 -y 360 -defaultsOSRD
preplace inst test_gpio_b -pg 1 -lvl 7 -y 740 -defaultsOSRD
preplace inst test_gpio_c -pg 1 -lvl 7 -y 860 -defaultsOSRD
preplace inst test_gpio_d -pg 1 -lvl 7 -y 980 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 6 -y 580 -defaultsOSRD
preplace inst mram -pg 1 -lvl 7 -y 500 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 3 -y 300 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 4 -y 1200 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 4 -y 1000 -defaultsOSRD
preplace inst axi_uartlite_0 -pg 1 -lvl 7 -y 220 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 5 -y 1030 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 3 -y 1100 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 1 -y 1140 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 6 -y 1020 -defaultsOSRD
preplace inst axi_quad_spi_0 -pg 1 -lvl 7 -y 70 -defaultsOSRD
preplace netloc test_gpio_b_GPIO2 1 7 1 NJ
preplace netloc axi_quad_spi_0_SPI_0 1 7 1 NJ
preplace netloc test_gpio_0_GPIO 1 7 1 NJ
preplace netloc microblaze_0_axi_periph_M08_AXI 1 6 1 1960
preplace netloc microblaze_0_axi_periph_M04_AXI 1 6 1 2020
preplace netloc axi_iic_0_iic2intc_irpt 1 2 6 NJ 220 NJ 220 NJ 220 NJ 220 NJ 430 2240
preplace netloc axi_uartlite_0_interrupt 1 2 6 NJ 200 NJ 200 NJ 200 NJ 200 NJ 290 2240
preplace netloc microblaze_0_intr 1 3 1 900
preplace netloc microblaze_0_Clk 1 1 6 180 1060 380 1010 890 1110 1150 1120 1600 210 1990
preplace netloc microblaze_0_axi_periph_M06_AXI 1 6 1 1980
preplace netloc microblaze_0_axi_periph_M03_AXI 1 6 1 2010
preplace netloc microblaze_0_intc_axi 1 3 4 910 900 NJ 900 NJ 920 1940
preplace netloc microblaze_0_interrupt 1 4 1 N
preplace netloc microblaze_0_M_AXI_DC 1 5 1 1610
preplace netloc microblaze_0_ilmb_1 1 5 1 N
preplace netloc microblaze_0_axi_periph_M05_AXI 1 6 1 N
preplace netloc microblaze_0_axi_dp 1 5 1 1590
preplace netloc test_gpio_d_GPIO2 1 7 1 NJ
preplace netloc test_gpio_c_GPIO2 1 7 1 NJ
preplace netloc test_gpio_c_GPIO 1 7 1 NJ
preplace netloc mram_GPIO 1 7 1 NJ
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 3 3 NJ 380 NJ 380 N
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 3 3 NJ 1130 NJ 1130 1640
preplace netloc microblaze_0_axi_periph_M01_AXI 1 6 1 1970
preplace netloc microblaze_0_M_AXI_IC 1 5 1 1630
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 3 4 880 860 NJ 860 1620 240 2000
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 3 2 910 1100 1140
preplace netloc clk_wiz_1_locked 1 1 2 180 1140 N
preplace netloc test_gpio_b_GPIO 1 7 1 NJ
preplace netloc mram_GPIO2 1 7 1 NJ
preplace netloc axi_iic_0_IIC 1 7 1 NJ
preplace netloc axi_uartlite_0_UART 1 7 1 NJ
preplace netloc test_gpio_d_GPIO 1 7 1 NJ
preplace netloc microblaze_0_axi_periph_M07_AXI 1 6 1 1970
preplace netloc microblaze_0_axi_periph_M02_AXI 1 6 1 1950
preplace netloc microblaze_0_dlmb_1 1 5 1 N
preplace netloc clock_rtl_1 1 0 1 NJ
preplace netloc test_gpio_0_GPIO2 1 7 1 NJ
preplace netloc microblaze_0_debug 1 4 1 1130
preplace netloc axi_quad_spi_0_ip2intc_irpt 1 2 6 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 2240
preplace netloc mdm_1_debug_sys_rst 1 2 3 NJ 1260 NJ 1260 1140
preplace netloc reset_rtl_1 1 0 3 NJ 1080 NJ 1080 NJ
levelinfo -pg 1 -90 100 350 700 1020 1370 1790 2130 2260 -top 0 -bot 1270
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



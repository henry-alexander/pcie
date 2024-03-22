# (C) 2001-2024 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# (C) 2001-2020 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# (C) 2001-2020 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# (C) 2001-2019 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


proc apply_cdc {from_keep to_keep} {
if {[llength [query_collection -report -all $from_keep]] > 0 && [llength [query_collection -report -all $to_keep]] > 0} {
set_max_skew -from $from_keep -to $to_keep -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
set_net_delay -from $from_keep -to $to_keep -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.85
}
set_max_delay -from $from_keep -to $to_keep 50
set_min_delay -from $from_keep -to $to_keep -50}
}

proc apply_cdc_to_bit {to_keep} {
  if {[llength [query_collection -report -all $to_keep]] > 0} {
    set_max_delay -to $to_keep 50
    set_min_delay -to $to_keep -50
    set fanins [get_fanins -no_logic $to_keep]
#    foreach_in_collection fanins $fanins {
      if {[llength [query_collection -report -all $fanins]] > 0} {
        if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
            set_net_delay -from $fanins -to $to_keep -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
        }
      }
#    }
  }
}

proc apply_cdc_from_bit {from_keep} {
  set_max_delay -from $from_keep 50
  set_min_delay -from $from_keep -50
  set fanouts [get_fanouts -no_logic $from_keep]
#  foreach_in_collection fanouts $fanouts {
    if {[llength [query_collection -report -all $fanouts]] > 0} {
      if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
          set_net_delay -from $from_keep -to $fanouts -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
      }
#    }
  }  
}

##########################################################################################################################################
# Set max skew between the gray code pointers of TX_ST fifos.
set from_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_tx_st_if|tx_fifo_lo|*gx0|din_gry*]
set to_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_tx_st_if|tx_fifo_lo|*gx0|u_din_gry_sync|sync_regs_s1*]
apply_cdc $from_keep $to_keep

set from_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_tx_st_if|tx_fifo_lo|*gx1|din_gry*]
set to_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_tx_st_if|tx_fifo_lo|*gx1|u_din_gry_sync|sync_regs_s1*]
apply_cdc $from_keep $to_keep

##########################################################################################################################################
#
## Set max skew between the gray code pointers of RX_ST fifos.
#set from_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo|*gx0|din_gry*]
#set to_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo|*gx0|u_din_gry_sync|sync_regs_s1*]
#apply_cdc $from_keep $to_keep
#
#set from_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo|*gx1|din_gry*]
#set to_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo|*gx1|u_din_gry_sync|sync_regs_s1*]
#apply_cdc $from_keep $to_keep
#
set to_keep [get_keepers -nowarn *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_st_ready]
apply_cdc_to_bit $to_keep
#
##########################################################################################################################################
set to_keep [get_keepers -nowarn *pll_rstn_d1*]
apply_cdc_to_bit $to_keep

set to_keep [get_keepers -nowarn *pll_rstn_d2*]
apply_cdc_to_bit $to_keep

set to_keep [get_keepers -nowarn *pio_rstn_d1*]
apply_cdc_to_bit $to_keep

set to_keep [get_keepers -nowarn *pio_rstn_d2*]
apply_cdc_to_bit $to_keep
##########################################################################################################################################

##########################################################################################################################################

set to_keep [get_keepers -nowarn *|u_tx_st_if|sync_comb_rst_d1*]
if {[get_collection_size $to_keep] > 0} {
   set_false_path -to $to_keep
}

##########################################################################################################################################
#set_false_path -from [get_keepers *soft_logics|rst_ctrl|*rst_tree|reset_status_tree*] -to [get_keepers *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo_lo|auto_generated|fifo_altera_syncram|altera_syncram_impl5|ram_block*]
##########################################################################################################################################
# Apply cdc constraints to reset
set to_keep [get_keepers -nowarn *reset_status_250sync|din_s1*]
apply_cdc_to_bit $to_keep

set from_keep [get_keepers -nowarn *altera_avst512_iopll|altera_ep_g3x16_avst512_io_pll_s10|*]
set to_keep [get_keepers -nowarn *reset_status_250sync|dreg*]
if {[get_collection_size $from_keep] > 0 & [get_collection_size $to_keep] > 0} {
   set_false_path -from $from_keep -to $to_keep
}

##########################################################################################################################################
#############Fix Warning##################################################################################################################
set to_keep [get_keepers -nowarn *auto_generated|*wraclr|dffe*]
if {[get_collection_size $to_keep] > 0} {
set_false_path -to *auto_generated|*wraclr|dffe*
#set_false_path -to *auto_generated|*rdaclr|dffe*
}

##########################################################################################################################################

##########################################################################################################################################
#CDC for cdts_fifo
proc apply_sdc_dcfifo {hier_path} {
# gray_rdptr
apply_sdc_dcfifo_rdptr $hier_path
# gray_wrptr
apply_sdc_dcfifo_wrptr $hier_path
}
#
# common constraint setting proc
#
proc apply_sdc_dcfifo_for_ptrs {from_node_list to_node_list} {
# control skew for bits
set_max_skew -from $from_node_list -to $to_node_list -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
# path delay (exception for net delay)
if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
set_net_delay -from $from_node_list -to $to_node_list -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
}
#relax setup and hold calculation
set_max_delay -from $from_node_list -to $to_node_list 100
set_min_delay -from $from_node_list -to $to_node_list -100
}
#
# mstable propgation delay
#
proc apply_sdc_dcfifo_mstable_delay {from_node_list to_node_list} {
# mstable delay
if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
set_net_delay -from $from_node_list -to $to_node_list -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
}
}
#
# rdptr constraints
#
proc apply_sdc_dcfifo_rdptr {hier_path} {
# get from and to list
set from_node_list [get_keepers -nowarn $hier_path|auto_generated|*rdptr_g*]
set to_node_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
if {[llength [query_collection -report -all $from_node_list]] > 0 && [llength [query_collection -report -all $to_node_list]] > 0} {
  apply_sdc_dcfifo_for_ptrs $from_node_list $to_node_list
}
# mstable
set from_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
set to_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|ws_dgrp|dffpipe*|dffe*]
if {[llength [query_collection -report -all $from_node_mstable_list]] > 0 && [llength [query_collection -report -all $to_node_mstable_list]] > 0} {
  apply_sdc_dcfifo_mstable_delay $from_node_mstable_list $to_node_mstable_list
}
}
#
# wrptr constraints
#
proc apply_sdc_dcfifo_wrptr {hier_path} {
# control skew for bits
set from_node_list [get_keepers -nowarn $hier_path|auto_generated|delayed_wrptr_g*]
set to_node_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
if {[llength [query_collection -report -all $from_node_list]] > 0 && [llength [query_collection -report -all $to_node_list]] > 0} {
  apply_sdc_dcfifo_for_ptrs $from_node_list $to_node_list
}
# mstable
set from_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
set to_node_mstable_list [get_keepers -nowarn $hier_path|auto_generated|rs_dgwp|dffpipe*|dffe*]
if {[llength [query_collection -report -all $from_node_mstable_list]] > 0 && [llength [query_collection -report -all $to_node_mstable_list]] > 0} {
  apply_sdc_dcfifo_mstable_delay $from_node_mstable_list $to_node_mstable_list
}
}

set fifo_loc *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo_lo*
apply_sdc_dcfifo $fifo_loc

set fifo_loc *altera_pcie_256s_512s_adapter_inst|u_rx_st_if|rx_fifo_hi*
apply_sdc_dcfifo $fifo_loc

##########################################################################################################################################

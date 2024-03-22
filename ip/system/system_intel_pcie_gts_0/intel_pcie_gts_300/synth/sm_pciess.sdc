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


if [info exists ip_inst_name] {
  unset ip_inst_name
  }
set ip_inst_name [get_current_instance]
puts "PCIE SS SDC INSTANCE: $ip_inst_name"

 ## set global variables
 global ::ip_sdc_debug
 
 set ip_sdc_debug 0

 ## get current IP instance 
 if {$ip_sdc_debug == 1} {
        post_message -type info "IP SDC: $ip_inst_name"
 }


# ----------------------------------------------------------------
#
proc xcvrphy_is_node_type_refreg { node_id node_search ip_inst_name} {
#
# Description: Given a node, checks if a string is present or not
#              Removed check for ip_inst_name as it might be diff
#                                       in case of Sys PLL clock
# ----------------------------------------------------------------
 if {[regexp $node_search [get_node_info -name $node_id]] == 1} {
      set result 1
   } else {
      set result 0
   }
   return $result
}

# ----------------------------------------------------------------
#
proc xcvrphy_is_node_type_pin { node_id node_search ip_inst_name } {
#
# Description: Given a node, tells whether or not it is a certain type or not (e.g. pin, port)
#              Also check for ip_inst_name to find the right node
#
# ----------------------------------------------------------------
   set node_type [get_node_info -type $node_id]

   if {$node_type == $node_search && [regexp [get_node_info -name $node_id] "$ip_inst_name"] == 1} {
      set result 1
   } else {
      set result 0
   }
   return $result
}

#
# ----------------------------------------------------------------
#
proc xcvrphy_traverse_fanin_up_to_depth { node_id match_command edge_type results_array_name depth node_search ip_inst_name} {
#
# Description: Recurses through the timing netlist starting from the given
#              node_id through edges of type edge_type to find nodes
#              satisfying match_command.
#              Recursion depth is bound to the specified depth.
#              Adds the resulting TDB node ids to the results_array.
#
# ----------------------------------------------------------------
   upvar 1 $results_array_name results

   if {$depth < 0} {
      error "Internal error: Bad timing netlist search depth"
   }
   set fanin_edges [get_node_info -${edge_type}_edges $node_id]
   set number_of_fanin_edges [llength $fanin_edges]
        #post_message -type info "number_of_fanin_edges $number_of_fanin_edges"
        for {set i 0} {$i != $number_of_fanin_edges} {incr i} {
      set fanin_edge [lindex $fanin_edges $i]
      set fanin_id [get_edge_info -src $fanin_edge]
                #post_message -type info "fanin_id [get_node_info -name $fanin_id]"
                if {$match_command == "" || [eval $match_command $fanin_id $node_search $ip_inst_name] != 0} {
                        #post_message -type info "fanin_id [get_node_info -name $fanin_id]"
                        #post_message -type info "match"
                        set results($fanin_id) [expr {$i+1}]
      } elseif {$depth == 0} {
                        puts "no more here"
         # Max recursion depth
      } else {
                        #post_message -type info "disabled edge info : [get_edge_info -is_disabled $fanin_edge]"
                        if {[get_edge_info -is_disabled $fanin_edge]==0} {
                                xcvrphy_traverse_fanin_up_to_depth $fanin_id $match_command $edge_type results [expr {$depth - 1}] $node_search $ip_inst_name
                        } else {
                        # no further traversal if edge is disabled
                        }
      }
   }
}


#
# ----------------------------------------------------------------
#
proc xcvrphy_get_input_clk_id { xcvr_inclk_id var_array_name ip_inst_name} {
#
# Description: calls the recursive traversing function to search for clock_edges 
#
# ----------------------------------------------------------------

   upvar 1 $var_array_name var

   array set results_array [list]

   # Find the input pin
   # Depth set to 10 to adaquately handle ref clock tree traversal
   xcvrphy_traverse_fanin_up_to_depth $xcvr_inclk_id $var(node_check_command) clock results_array $var(xcvr_inclock_search_depth) $var(node_search) $ip_inst_name
   if {[array size results_array] == 1} {
      # Fed by a dedicated input pin
                set pin_id [lindex [array names results_array] 0]
                set result $pin_id
   } else {
      post_message -type critical_warning "Could not find XCVR clock for [get_node_info -name $xcvr_inclk_id]"
      set result -1
   }

   return $result
}


# ----------------------------------------------------------------
#
proc xcvrphy_traverse_fanins { ip_inst_name dummy_sip_flop_name clk_type ip_inst_name ip_sdc_debug} {
#
# Description: Retruns source clk_ref/reg node for XCVR user clock which drives dummy flop placed in SIP
#
# ----------------------------------------------------------------

        set var(xcvr_inclock_search_depth) 3
        set var(node_check_command) xcvrphy_is_node_type_pin

        set dummy_sip_flop_node [get_nodes $ip_inst_name|*|${dummy_sip_flop_name}*|clk]

        set var(node_search) "pin"
        set dummy_flop_clock_pin [xcvrphy_get_input_clk_id $dummy_sip_flop_node var  $ip_inst_name]

        set dummy_flop_clock_pin_node [get_node_info -name $dummy_flop_clock_pin ]

        if {$ip_sdc_debug == 1} {
                if {$clk_type == "pin"} {
                        post_message -type info "IP SDC: Clock Pin source found for $dummy_sip_flop_name: $dummy_flop_clock_pin_node"
                }
        }

   if {$clk_type != "pin"} {
                set var(node_check_command) xcvrphy_is_node_type_refreg
                set var(node_search) $clk_type

                set xcvrclk_src [xcvrphy_get_input_clk_id $dummy_flop_clock_pin_node var  $ip_inst_name]
                set xcvrclk_src_node [get_node_info -name $xcvrclk_src]

                if {$ip_sdc_debug == 1} {
                        if {[regexp "ref" $clk_type] == 1} {
                                post_message -type info "IP SDC: Clock Ref source found for $dummy_sip_flop_name: $xcvrclk_src_node"
                        } else {
                                post_message -type info "IP SDC: Clock Reg source found for $dummy_sip_flop_name: $xcvrclk_src_node"
                        }
                }
        }

        if {$clk_type == "pin"} {
                return $dummy_flop_clock_pin_node
        } else {
      return $xcvrclk_src_node
        }
}


# ----------------------------------------------------------------
#
proc lookup_clock_target { lookup_string } {
#
# Description: Retruns whether lookup_string is present in target of any of already created clocks in the design
#
# ----------------------------------------------------------------
    set clocks_collection [get_clocks -nowarn]
      if {[get_collection_size $clocks_collection] > 0} {
        foreach_in_collection clock $clocks_collection {
          if { ![is_clock_defined $clock] } {
            continue
          }
          set clock_name [get_clock_info -name $clock]
          set clock_target_collection [get_clock_info -target $clock]
          if {[get_collection_size $clock_target_collection] > 0} {
            foreach_in_collection clock_target $clock_target_collection {
              set clock_target_name [get_node_info -name $clock_target]
              if {[string equal $lookup_string $clock_target_name] == 1} {
                return 1
              }
            }
          }
        }
        return 0
      } else {
      return 0
      }
}


# ----------------------------------------------------------------
#
proc lookup_clock_target_name { lookup_string } {
#
# Description: Retruns already created clock name whose target has lookup_string
#
# ----------------------------------------------------------------

   set clocks_collection [get_clocks]
   if {[get_collection_size $clocks_collection] > 0} {
     foreach_in_collection clock $clocks_collection {
       if { ![is_clock_defined $clock] } {
         continue
       }
       set clock_name [get_clock_info -name $clock]
       set clock_target_collection [get_clock_info -target $clock]
       if {[get_collection_size $clock_target_collection] > 0} {
         foreach_in_collection clock_target $clock_target_collection {
           set clock_target_name [get_node_info -name $clock_target]
           if {[string equal $lookup_string $clock_target_name] == 1} {
             return $clock_name
           }
         }
       }
     }
       return 0
   } else {
   return 0
   }
}


#
# ----------------------------------------------------------------
#
proc get_clock_source_from_node { ip_inst_name dummy_sip_flop_name } {
#
# Description: Get the clock edge info from node and eventually to get the 
#              clock source
# ----------------------------------------------------------------
   puts "Start of get_clock_source_from_node, input1 $ip_inst_name ,,, input2 $dummy_sip_flop_name"
   set dummy_sip_flop_node [get_nodes $ip_inst_name|*|${dummy_sip_flop_name}*|clk]
   query_collection [get_nodes $ip_inst_name|*|${dummy_sip_flop_name}*|clk]
   set fanin_edges [get_node_info -clock_edges $dummy_sip_flop_node]
   puts $fanin_edges
   set fanin_id [get_edge_info -src $fanin_edges]
   post_message -type info "Getting top level source clock from node $dummy_sip_flop_node => [get_node_info -name $fanin_id]"
   set fanin_id_name [get_node_info -name $fanin_id]
   return $fanin_id_name

}






# Check if port exists
proc pcie_port_existence {port_name ip_sdc_debug} {

   set port_collection [get_ports -nowarn $port_name]

   if {$ip_sdc_debug} {
        post_message -type info "Port exists for $port_name : $port_collection"
	foreach_in_collection port $port_collection {
	   set detected_port_name [get_port_info -name $port]
           post_message -type info "Ports found for $port_name : $detected_port_name"
	}
   }

   if { [get_collection_size $port_collection] > 0 } {
      return 1
   } else {
      return 0
   }
}

# Check if clock exists
proc pcie_clk_existence {clk_name ip_sdc_debug} {

   set clk_collection [get_clocks -nowarn $clk_name]

   if {$ip_sdc_debug} {
        post_message -type info "Clock exists for $clk_name : $clk_collection"
	foreach_in_collection clk $clk_collection {
	   set detected_clk_name [get_clock_info -name $clk]
           post_message -type info "Clock found for $clk_name : $detected_clk_name"
	}
   }

   if { [get_collection_size $clk_collection] > 0 } {
      return 1
   } else {
      return 0
   }
}

# Return existing clock target list
proc pcie_get_clock_target_list { ip_sdc_debug } {

   set result [list]
   set clocks_collection [get_clocks -nowarn]
   foreach_in_collection clock $clocks_collection { 
      if { ![is_clock_defined $clock] } {
         continue
      }
      set clock_name       [get_clock_info -name $clock] 
      set clock_target_col [get_clock_info -targets $clock]
      lappend result       [query_collection -report -all $clock_target_col]
      if {$ip_sdc_debug} { post_message -type info "clock_name : $clock_name" }
   }
   if {$ip_sdc_debug} { post_message -type info "PCIe clock_target list: $result" }

   return $result
}



#----------------------------------------
#   CLOCK DEFINITION
#   Unit : ps 
#----------------------------------------
set lite_clk_freq       250
set st_clk_freq         300
set pld_clk_freq        350

set PLD_CLK_PERIOD [format %.3f [expr {double(1000.0/$pld_clk_freq)} ] ]
set LITE_CLK_PERIOD [format %.3f [expr {double(1000.0/$lite_clk_freq)} ] ]
set ST_CLK_PERIOD   [format %.3f [expr {double(1000.0/$st_clk_freq)}   ] ]
set MM_CLK_PERIOD   [format %.3f [expr {double(1000.0/$st_clk_freq)}   ] ]
set REFCLK_PERIOD   10.0

#############
#set ip_inst_name sm_inst|intel_pcie_gts_inst
set dummy_sip_flop_names(0) dummy_out_for_timing_coreclkout_hip
set clk_out_names(0) coreclkout_hip_pld_clk
set clk_ref_names(0) coreclkout_hip_pld_clk_ref
set clk_reg_names(0) coreclkout_hip_pld_clk_reg
set xcvrclk_pin_node(0) [xcvrphy_traverse_fanins $ip_inst_name $dummy_sip_flop_names(0) "pin" ${ip_inst_name} $ip_sdc_debug]
set xcvrclk_ref_node(0) [xcvrphy_traverse_fanins $ip_inst_name $dummy_sip_flop_names(0) "_ref" ${ip_inst_name} $ip_sdc_debug]
set xcvrclk_reg_node(0) [xcvrphy_traverse_fanins $ip_inst_name $dummy_sip_flop_names(0) ".reg" ${ip_inst_name} $ip_sdc_debug]
post_message -type info "TEST SOURCE FOUND $xcvrclk_reg_node(0)"

set all_clocks_list [all_clocks]
        foreach_in_collection clk $all_clocks_list {
                set clk_name [get_clock_info -name $clk]
                if { [is_clock_defined $clk_name] == 1 } {
                        set clk_node_col [get_clock_info -targets $clk_name]

                        foreach_in_collection clk_node $clk_node_col {
                        set clk_node_name [get_node_info -name $clk_node]
                        }
                        post_message -type info "Clock already created $clk_name $clk_node_name"
                                }
        }

#Check if clock with target "syspll_c0_ref" already exists; if yes, get the target node and clock name 
set clk_exists "0"
set clk_exists_node ""
set clk_exists_name ""

set clk_exists [lookup_clock_target $xcvrclk_ref_node(0)]
if {$clk_exists == 1} {
  set clk_exists_name [lookup_clock_target_name $xcvrclk_ref_node(0)]
  set clk_exists_node [get_node_info -name [get_clock_info -target $clk_exists_name]]
  if {$ip_sdc_debug == 1 && $clk_exists == 1} {
    post_message -type info "IP SDC: Clock already created with same target, skipping new clock creation: $clk_exists_name"
    #post_message -type info "Clock already created: NODE: $clk_exists_node"                               
  }
}


#create clock for source ref clock inside HIP
if { $clk_exists == 0 } {
  #create clock if ref node is newly found
  create_clock -name $ip_inst_name|$clk_ref_names(0) -period $PLD_CLK_PERIOD -add $xcvrclk_ref_node(0)
}

#create generated clock for reg clock inside HIP
if { $clk_exists == 0 } {
  #create clock if reg node is newly found
  create_generated_clock -name $ip_inst_name|$clk_reg_names(0) -source $xcvrclk_ref_node(0)  -master_clock $ip_inst_name|$clk_ref_names(0)  -multiply_by 1  -divide_by 1  -duty_cycle 50  -add $xcvrclk_reg_node(0)
} else {
  create_generated_clock -name $ip_inst_name|$clk_reg_names(0) -source $clk_exists_node  -master_clock $clk_exists_name -multiply_by 1  -divide_by 1  -duty_cycle 50  -add $xcvrclk_reg_node(0)
}

#create generated clock for user output clock to Fabric/SIP
create_generated_clock -name $ip_inst_name|$clk_out_names(0) -source $xcvrclk_reg_node(0) -master_clock $ip_inst_name|$clk_reg_names(0)  -multiply_by 1 -divide_by 1 -duty_cycle 50 -add $xcvrclk_pin_node(0)

#Follow Ftile implementation
disable_min_pulse_width [get_clocks $ip_inst_name|$clk_ref_names(0)]
#############
#Refclk creation
set pcie_clock_target_list [pcie_get_clock_target_list $ip_sdc_debug]
#create_clock -name refclk0          -period $REFCLK_PERIOD   [get_ports refclk0]
#create_clock -name refclk1          -period $REFCLK_PERIOD   [get_ports refclk1]
set pcie_refclk0_port_ext  [pcie_port_existence refclk0 $ip_sdc_debug]
set pcie_refclk0_lsrc [lsearch -exact $pcie_clock_target_list refclk0]
if {$pcie_refclk0_port_ext && $pcie_refclk0_lsrc == -1} {
    create_clock -name ${ip_inst_name}_refclk0          -period $REFCLK_PERIOD  -add [get_ports refclk0]
}

#set pcie_refclk1_port_ext  [pcie_port_existence refclk1 $ip_sdc_debug]
#set pcie_refclk1_lsrc [lsearch -exact $pcie_clock_target_list refclk1]
#if {$pcie_refclk1_port_ext && $pcie_refclk1_lsrc == -1} {
#    create_clock -name ${ip_inst_name}_refclk1          -period $REFCLK_PERIOD  -add [get_ports refclk1]
#}



#AXI clock creation
#get all clock list
set pcie_axi_st_clk_port_ext  [pcie_port_existence p*_axi_st_clk $ip_sdc_debug]
set pcie_axi_st_clk_lsrc [lsearch -exact $pcie_clock_target_list ${ip_inst_name}_axi_st_clk]
if {$pcie_axi_st_clk_port_ext && $pcie_axi_st_clk_lsrc == -1} {
    create_clock -name ${ip_inst_name}_axi_st_clk   -period $ST_CLK_PERIOD -add p0_axi_st_clk
}

set pcie_axi_lite_clk_port_ext  [pcie_port_existence p*_axi_lite_clk $ip_sdc_debug]
set pcie_axi_lite_clk_lsrc [lsearch -exact $pcie_clock_target_list ${ip_inst_name}_axi_lite_clk]
if {$pcie_axi_lite_clk_port_ext && $pcie_axi_lite_clk_lsrc == -1} {
    create_clock -name ${ip_inst_name}_axi_lite_clk   -period $LITE_CLK_PERIOD -add p0_axi_lite_clk
    ##create generated clock from axi_lite_clk
    create_generated_clock -name ${ip_inst_name}_avmm_clock0 -source p0_axi_lite_clk -master_clock ${ip_inst_name}_axi_lite_clk -divide_by 2 ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add
} else {
    ##the clock source is from higher level
    set dummy_sip_flop_names_axi_lite_clk dummy_out_for_timing_axi_lite_clk
    set clk_src_names_axi_lite_clk [get_clock_source_from_node $ip_inst_name $dummy_sip_flop_names_axi_lite_clk]
    puts $clk_src_names_axi_lite_clk
create_generated_clock -name ${ip_inst_name}_avmm_clock0 -source $clk_src_names_axi_lite_clk -divide_by 2 ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add

}

#from ptile pciess sdc
#set_clock_groups -asynchronous -group {avmm_clock0} -group ${ip_inst_name}_axi_lite_clk
###########set_clock_groups -asynchronous -group {avmm_clock0} -group ${ip_inst_name}_axi_st_clk
###########set_clock_groups -asynchronous -group ${ip_inst_name}_axi_st_clk -group ${ip_inst_name}_axi_lite_clk -group $ip_inst_name|$clk_out_names(0)
###########set_clock_groups -asynchronous -group {avmm_clock0} -group {sm_inst|intel_pcie_gts_inst|coreclkout_hip_pld_clk} 

#include for HSD 15014650145
set_false_path -from [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|p0_debounce_logic_inst|gpio_o] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|sm_pcie_hal_top_inst|pcie_hal_top|ch4_phip_inst|x_std_sm_hssi_pld_chnl_dp_0~pldif_reset_reg]

#set false path for setup
#taken out for 23.3 closure
#set_false_path -from [get_keepers -no_duplicates ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_tx_if|sm_pciess_tx.u_pciess_tx_fifo|axi_st_intf_fifo|auto_generated|fifo_altera_syncram|altera_syncram_impl1|ram_block*~reg1] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|sm_pcie_hal_top_inst|pcie_hal_top|one_lane_pcie_inst_0|one_lane_pcie_hal_top_p0|pldif_hal_top_inst|pldif_hal_top|pldif_hal_coreip_inst|gen_sm_ch4_pldif_inst.ch4_pldif_no_deskew_inst|x_std_sm_hssi_pld_chnl_dp_0*]
#falsepath between hip_reconfig clock with coreclkouthip. Crossing happening in the csb. There is a CDC handshake vector sync
set_false_path -from [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|pld_mmioresp_bus_r[*]] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|int_mmio_*]
set_false_path -from [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|mmio_req_bus_r[*]] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|pld_mmio_req_bus_r[*]]
set_max_skew   -from [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|pld_mmioresp_bus_r[*]] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|int_mmio_*] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
set_data_delay -from [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|pld_mmioresp_bus_r[*]] -to [get_keepers -no_duplicates ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_csb_adaptor_inst|avmm_inst|int_mmio_*] -get_value_from_clock_period dst_clock_period -value_multiplier 0.9

#falsepath async reset which driven from src. The domain is coreclkout_hip to hip_reconfig clk. The clrn expecting async reset. It is ok to waive because the reset is pseudo static
proc apply_sdc_synchronizer_clrn_false_path {sync_name} {
  if {[get_collection_size [get_keepers -nowarn ${sync_name}]] > 0} {
    puts "${sync_name} is found"
    set_false_path -through [get_pins ${sync_name}|clrn] -to [get_keepers -no_duplicates ${sync_name}]
     }
}
#coreclkout <--> axi_st_clk
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|SM_TXCRDT.u_warm_rst_coreclk_n_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_ext_ctrl_shadow|u_coreclkout_hip_reset_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_vf_err_if|u_warm_rst_coreclk_n_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_warm_rst_coreclk_n_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_core_rst_coreclk_n_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_tx_if|sm_pciess_tx.u_pciess_tx_fifo|axi_st_intf_fifo|auto_generated|rdaclr|dffe1*a[0]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_ext_ctrl_shadow|ctrlshadow_fifo_inst|auto_generated|wraclr|dffe1*a[0]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_rx_if|u_pciess_rx_fifo|u_ss_app_st_rx_fifo|auto_generated|wraclr|dffe1*a[0] 
#axi_st_clk <--> axi_lite_clk
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_ext_ctrl_shadow|u_axi_lite_clk_reset_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_warm_rst_liteclk2_n_sync|dreg[*]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_warm_rst_liteclk_n_sync|dreg[*] 
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_core_rst_liteclk_n_sync|dreg[*]
#avmm_clk <--> axi_lite_clk
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_axi_lite_clk_to_user_avmm_clk_fifo|auto_generated|wraclr|dffe1*a[0]
apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|u_pciess_p0|gen_sub.u_hipif|u_pciess_cfg_if|u_warm_rst_avmmclk_n_sync|dreg[*]
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|
#apply_sdc_synchronizer_clrn_false_path ${ip_inst_name}|



proc apply_sdc_synchronizer_nocut_false_path {sync_name ip_inst_name} {
puts ${sync_name}
  if {[get_collection_size [get_keepers -nowarn ${sync_name}|din_s1]] > 0} {
    puts "${sync_name} is found"
    set_false_path -to [get_registers ${sync_name}|din_s1]
    if {[string match [string map { \[ \\\[ \] \\\] } ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|sm_pcie_src_inst|pld_clk_ninit_done_sync_inst] ${sync_name}]} {

    } elseif {[string match [string map { \[ \\\[ \] \\\] } ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|pcie_sip_top_inst|avmm_rst_sync_inst] ${sync_name}]} {

    } elseif {[string match [string map { \[ \\\[ \] \\\] } ${ip_inst_name}|gen_sm_qhip.u_sm_qhip|i_gpio_perst0_n_sync_inst] ${sync_name}]} {

    } else { 
      set_data_delay -to [get_registers ${sync_name}|din_s1] -get_value_from_clock_period dst_clock_period -value_multiplier 0.9
    }
    apply_sdc_synchronizer_clrn_false_path ${sync_name}|dreg[*]
     }
}

#apply false path to all altera_std_synchronizer_nocut cross clock data path
set sync_nocut_list [get_entity_instances altera_std_synchronizer_nocut]

foreach each_inst ${sync_nocut_list} {
#pattern match to ensure only apply falsepath to synchronizer inside the dut
       if { [string match [string map { \[ \\\[ \] \\\] } ${ip_inst_name}*] ${each_inst}] } {
          puts "apply synchronize false path to ${each_inst}"
          apply_sdc_synchronizer_nocut_false_path ${each_inst} ${ip_inst_name}
       }
    }

#apply false path to all hssi_ss_std_synchronizer_nocut cross clock data path
set sync_nocut_list [get_entity_instances hssi_ss_std_synchronizer_nocut]

foreach each_inst ${sync_nocut_list} {
#pattern match to ensure only apply falsepath to synchronizer inside the dut
       if { [string match [string map { \[ \\\[ \] \\\] } ${ip_inst_name}*] ${each_inst}] } {
          puts "apply synchronize false path to ${each_inst}"
          apply_sdc_synchronizer_nocut_false_path ${each_inst} ${ip_inst_name}
       }
    }


#to falsepath vector sync

proc apply_sdc_vectorsync_false_path {vectorsync_name} {
puts ${vectorsync_name}

  if {[get_collection_size [get_keepers -nowarn ${vectorsync_name}|*data_in_d1*]] > 0} {
     puts "${vectorsync_name} is found"
	  #Recommended by CDC Crossing
     set_false_path -from [get_registers ${vectorsync_name}|*data_in_d1*] -to [get_registers ${vectorsync_name}|data_out*]
	  set_max_skew   -from [get_registers ${vectorsync_name}|*data_in_d1*] -to [get_registers ${vectorsync_name}|data_out*] -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
	  set_data_delay -from [get_registers ${vectorsync_name}|*data_in_d1*] -to [get_registers ${vectorsync_name}|data_out*] -get_value_from_clock_period dst_clock_period -value_multiplier 0.9
     }

}

#apply false path to all pciess_vecsync cross clock data path
set vector_list [get_entity_instances pciess_vecsync]

foreach each_inst ${vector_list} {

        apply_sdc_vectorsync_false_path ${each_inst}

    }


#apply false path to all pciess_vecsync_handshake cross clock data path
set vector_list [get_entity_instances pciess_vecsync_handshake]

foreach each_inst ${vector_list} {

        apply_sdc_vectorsync_false_path ${each_inst}

    }



##klai4 taken out because only power user mode. axi_mm_clk not needed
#create_clock -name p0_axi_mm_clk    -period $MM_CLK_PERIOD   [get_ports p0_axi_mm_clk]

############START##################
##klai4 taken out for initial sm
#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        create_clock -name p1_axi_st_clk    -period $ST_CLK_PERIOD   [get_ports p1_axi_st_clk]
#}
#if {[regexp "x4" $top_topology]} {
#        create_clock -name p2_axi_st_clk    -period $ST_CLK_PERIOD   [get_ports p2_axi_st_clk]
#        create_clock -name p3_axi_st_clk    -period $ST_CLK_PERIOD   [get_ports p3_axi_st_clk]
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        create_clock -name p1_axi_lite_clk  -period $LITE_CLK_PERIOD [get_ports p1_axi_lite_clk]
#}
#if {[regexp "x4" $top_topology]} {
#        create_clock -name p2_axi_lite_clk  -period $LITE_CLK_PERIOD [get_ports p2_axi_lite_clk]
#        create_clock -name p3_axi_lite_clk  -period $LITE_CLK_PERIOD [get_ports p3_axi_lite_clk]
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        create_clock -name p1_axi_mm_clk    -period $MM_CLK_PERIOD   [get_ports p1_axi_mm_clk]
#}
#if {[regexp "x4" $top_topology]} {
#        create_clock -name p2_axi_mm_clk    -period $MM_CLK_PERIOD   [get_ports p2_axi_mm_clk]
#        create_clock -name p3_axi_mm_clk    -period $MM_CLK_PERIOD   [get_ports p3_axi_mm_clk]
#}
#############END###################

##This is for the implementation for HIP_RECONFIG. Not sure if the divider still active. NK to help checking it. Commented out for now
##create_generated_clock -name avmm_clock0 -source p0_axi_lite_clk -master_clock p0_axi_lite_clk -divide_by 2 \
##        ${pcie_ss_inst}|u_pciess_p0|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add

############START##################
##klai4 taken out for initial sm
#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        create_generated_clock -name avmm_clock1 -source p1_axi_lite_clk -master_clock p1_axi_lite_clk -divide_by 2 \
#                ${pcie_ss_inst}|gen_pciess_p1.u_pciess_p1|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add
#}
#if {[regexp "x4" $top_topology]} {
#        create_generated_clock -name avmm_clock2 -source p2_axi_lite_clk -master_clock p2_axi_lite_clk -divide_by 2 \
#                ${pcie_ss_inst}|gen_pciess_p2_p3.u_pciess_p2|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add

#        create_generated_clock -name avmm_clock3 -source p3_axi_lite_clk -master_clock p3_axi_lite_clk -divide_by 2 \
#                ${pcie_ss_inst}|gen_pciess_p2_p3.u_pciess_p3|gen_sub.u_hipif|u_pciess_clock_divider|clkdiv_inst|clock_div2 -add
#}
#############END###################

##klai4 commented out as the avmm_clock0 is taken out temporarily
##set_clock_groups -asynchronous -group {avmm_clock0} -group {p0_axi_lite_clk}

############START##################
##klai4 taken out for initial sm
#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#	set_clock_groups -asynchronous -group {avmm_clock1} -group {p1_axi_lite_clk}
#}
#if {[regexp "x4" $top_topology]} {
#	set_clock_groups -asynchronous -group {avmm_clock2} -group {p2_axi_lite_clk}
#	set_clock_groups -asynchronous -group {avmm_clock3} -group {p3_axi_lite_clk}
#}
#############END###################

############START##################
##klai4 taken out for initial sm
#if {$debug_toolkit_en} {
#        set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#        set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p0_axi_lite_clk
#        set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p0_axi_st_clk

#        if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p1_axi_lite_clk
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p1_axi_st_clk
#        }
#        if {[regexp "x4" $top_topology]} {
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p2_axi_lite_clk
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p3_axi_lite_clk
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p2_axi_st_clk
#                set_clock_groups -asynchronous -group [get_clocks {xcvr_reconfig_clk}] -group p3_axi_st_clk
#        }
#}
#############END###################
##klai4 disable clock group for now
#set_clock_groups -asynchronous -group {p0_axi_st_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#set_clock_groups -asynchronous -group {p0_axi_lite_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#set_clock_groups -asynchronous -group {avmm_clock0} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#set_clock_groups -asynchronous -group {p0_axi_lite_clk} -group {p0_axi_st_clk}
##set_clock_groups -asynchronous -group {p0_axi_st_clk} -group {avmm_clock0}


############START##################
##klai4 taken out for initial sm
#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p1_axi_st_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}
#if {[regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p2_axi_st_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#        set_clock_groups -asynchronous -group {p3_axi_st_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p1_axi_lite_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}
#if {[regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p2_axi_lite_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#        set_clock_groups -asynchronous -group {p3_axi_lite_clk} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {avmm_clock1} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}
#if {[regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {avmm_clock2} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#        set_clock_groups -asynchronous -group {avmm_clock3} -group ${pcie_ss_inst}|gen_ptile.u_ptile|intel_pcie_ptile_ast_qhip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p1_axi_lite_clk} -group {p1_axi_st_clk}
#}
#if {[regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p2_axi_lite_clk} -group {p2_axi_st_clk}
#        set_clock_groups -asynchronous -group {p3_axi_lite_clk} -group {p3_axi_st_clk}
#}

#if {[regexp "2x8" $top_topology] || [regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p1_axi_st_clk} -group {avmm_clock1}
#}
#if {[regexp "x4" $top_topology]} {
#        set_clock_groups -asynchronous -group {p2_axi_st_clk} -group {avmm_clock2}
#        set_clock_groups -asynchronous -group {p3_axi_st_clk} -group {avmm_clock3}
#}
#############END###################

##TO ADD##
##set_false_path for synchronizer
##SDC for DCFIFO
##set_disable_min_pulse

# constraints for DCFIFO sdc
#
# top-level sdc
# convention for module sdc apply_sdc_<module_name>
#
proc apply_sdc_dcfifo {ip_inst_name} {
# gray_rdptr
apply_sdc_dcfifo_rdptr ${ip_inst_name}
# gray_wrptr
apply_sdc_dcfifo_wrptr ${ip_inst_name}
}
#
# common constraint setting proc
#
proc apply_sdc_dcfifo_for_ptrs {from_node_list to_node_list} {
# control skew for bits
set_max_skew -from ${from_node_list} -to ${to_node_list} -get_skew_value_from_clock_period src_clock_period -skew_value_multiplier 0.8
# path delay (exception for net delay)
if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
set_net_delay -from ${from_node_list} -to ${to_node_list} -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
}
#relax setup and hold calculation
set_max_delay -from ${from_node_list} -to ${to_node_list} 100
set_min_delay -from ${from_node_list} -to ${to_node_list} -100
}
#
# mstable propgation delay
#
proc apply_sdc_dcfifo_mstable_delay {from_node_list to_node_list} {
if { ![string equal "quartus_syn" $::TimeQuestInfo(nameofexecutable)] } {
set_net_delay -from ${from_node_list} -to ${to_node_list} -max -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
}
}
#
# rdptr constraints
#
proc apply_sdc_dcfifo_rdptr {ip_inst_name} {
set rdptr_from 0
set rdptr_to 0
set ws_dgrp_from 0
set ws_dgrp_to 0
# get from and to list
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|*rdptr_g*]] > 0} {
set from_node_list [get_keepers ${ip_inst_name}|auto_generated|*rdptr_g*]
set rdptr_from 1
}
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]] > 0} {
set to_node_list [get_keepers ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]
set rdptr_to 1
}
if { ${rdptr_from} == 1 && ${rdptr_to} == 1} {
apply_sdc_dcfifo_for_ptrs ${from_node_list} ${to_node_list}
}
# mstable
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]] > 0} {
set from_node_mstable_list [get_keepers ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]
set ws_dgrp_from 1
}
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]] > 0} {
set to_node_mstable_list [get_keepers ${ip_inst_name}|auto_generated|ws_dgrp|dffpipe*|dffe*]
set ws_dgrp_to 1
}
if {${ws_dgrp_from} == 1 && ${ws_dgrp_to} == 1} {
apply_sdc_dcfifo_mstable_delay ${from_node_mstable_list} ${to_node_mstable_list}
}

}
#
# wrptr constraints
#
proc apply_sdc_dcfifo_wrptr {ip_inst_name} {
set dffe_from 0
set dffe_to 0
set delayed_wrptr_g_from 0
# control skew for bits
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|delayed_wrptr_g*]] > 0} {
set from_node_list [get_keepers ${ip_inst_name}|auto_generated|delayed_wrptr_g*]
set delayed_wrptr_g_from 1
}
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]] > 0} {
set to_node_list [get_keepers ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]
set dffe_to 1
}
if {${delayed_wrptr_g_from} == 1 && ${dffe_to} == 1} {
apply_sdc_dcfifo_for_ptrs ${from_node_list} ${to_node_list}
}
# mstable
set dffe_to 0
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]] > 0} {
set from_node_mstable_list [get_keepers ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]
set dffe_from 1
}
if {[get_collection_size [get_keepers -nowarn ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]] > 0} {
set to_node_mstable_list [get_keepers ${ip_inst_name}|auto_generated|rs_dgwp|dffpipe*|dffe*]
set dffe_to 1
}
if { ${dffe_from} == 1 && ${dffe_to} == 1} {
apply_sdc_dcfifo_mstable_delay ${from_node_mstable_list} ${to_node_mstable_list}
}

}
#proc apply_sdc_pre_dcfifo {entity_name} {

set inst_list [get_entity_instances dcfifo]

foreach each_inst ${inst_list} {

        apply_sdc_dcfifo ${each_inst}

    }
#}
#apply_sdc_pre_dcfifo reorder_to_dcfifo_fifo_1910_sy3r64a


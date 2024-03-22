
namespace eval system_intel_pcie_pio_gts_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries intelclkctrl_200            1
    dict set libraries intel_pcie_pio_gts_234      1
    dict set libraries system_intel_pcie_pio_gts_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intelclkctrl_200/sim/system_intel_pcie_pio_gts_0_intelclkctrl_200_f3nubzq.v"]\"  -work intelclkctrl_200"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/system_intel_pcie_pio_gts_0_intel_pcie_pio_gts_intelclkctrl_234_dwo3zja.v"]\"  -work intel_pcie_pio_gts_234"             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_bam_hwtcl_system_intel_pcie_pio_gts_0_intel_pcie_pio_gts_234_qrm2xsq.sv"]\"  -work intel_pcie_pio_gts_234"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/alt_mlab.v"]\"  -work intel_pcie_pio_gts_234"                                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam.sv"]\"  -work intel_pcie_pio_gts_234"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_avmm_intf.sv"]\"  -work intel_pcie_pio_gts_234"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_cpl.sv"]\"  -work intel_pcie_pio_gts_234"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_sch_intf.sv"]\"  -work intel_pcie_pio_gts_234"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_fifos.sv"]\"  -work intel_pcie_pio_gts_234"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_rw.sv"]\"  -work intel_pcie_pio_gts_234"                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/intel_pcie_bam_v2_crdt_intf.sv"]\"  -work intel_pcie_pio_gts_234"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/alt_mlab.v"]\"  -work intel_pcie_pio_gts_234"                                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/cadence/alt_mlab.v"]\"  -work intel_pcie_pio_gts_234"                                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/aldec/alt_mlab.v"]\"  -work intel_pcie_pio_gts_234"                                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_reset_sync.v"]\"  -work intel_pcie_pio_gts_234"                                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_std_synchronizer_nocut.v"]\"  -work intel_pcie_pio_gts_234"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_adapter.sv"]\"  -work intel_pcie_pio_gts_234"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_rx_st_if.sv"]\"  -work intel_pcie_pio_gts_234"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_tx_st_if.sv"]\"  -work intel_pcie_pio_gts_234"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_adapter_credit.v"]\"  -work intel_pcie_pio_gts_234"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_async_fifo.v"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_fifo_read_ctrl.v"]\"  -work intel_pcie_pio_gts_234"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_fifo_write_ctrl.v"]\"  -work intel_pcie_pio_gts_234"                                                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_sc_bitsync.v"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_cii_if.sv"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_err_if.sv"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_flr_if.sv"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_int_if.sv"]\"  -work intel_pcie_pio_gts_234"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/alt_ehipc3_mlab.sv"]\"  -work intel_pcie_pio_gts_234"                                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/sync_bit.v"]\"  -work intel_pcie_pio_gts_234"                                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/sync_pulse.v"]\"  -work intel_pcie_pio_gts_234"                                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_dcfifo.sv"]\"  -work intel_pcie_pio_gts_234"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_cfg_if.sv"]\"  -work intel_pcie_pio_gts_234"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_gpx3.sv"]\"  -work intel_pcie_pio_gts_234"                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/system_intel_pcie_pio_gts_0.v"]\"  -work system_intel_pcie_pio_gts_0"                                                                                  
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}

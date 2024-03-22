
namespace eval pcie_ed_pio0 {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "pcie_ed_pio0_intelclkctrl_200_f3nubzq.v"                             "$QSYS_SIMDIR/../intelclkctrl_200/sim/pcie_ed_pio0_intelclkctrl_200_f3nubzq.v"                                  
    dict set design_files "pcie_ed_pio0_intel_pcie_pio_gts_intelclkctrl_234_dwo3zja.v"          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/pcie_ed_pio0_intel_pcie_pio_gts_intelclkctrl_234_dwo3zja.v"         
    dict set design_files "intel_pcie_bam_hwtcl_pcie_ed_pio0_intel_pcie_pio_gts_234_bnb5jay.sv" "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_bam_hwtcl_pcie_ed_pio0_intel_pcie_pio_gts_234_bnb5jay.sv"
    dict set design_files "intel_pcie_bam_pipeline.sv"                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_pipeline.sv"                                
    dict set design_files "intel_pcie_bam_avmm_intf_pipeline.sv"                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_avmm_intf_pipeline.sv"                      
    dict set design_files "intel_pcie_bam_cpl_pipeline.sv"                                      "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_cpl_pipeline.sv"                            
    dict set design_files "intel_pcie_bam_sch_intf_pipeline.sv"                                 "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_sch_intf_pipeline.sv"                       
    dict set design_files "intel_pcie_bam_fifos.sv"                                             "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_fifos.sv"                                   
    dict set design_files "intel_pcie_bam_rw.sv"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_rw.sv"                                      
    dict set design_files "intel_pcie_bam_v2_crdt_intf.sv"                                      "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/intel_pcie_bam_v2_crdt_intf.sv"                            
    dict set design_files "alt_mlab.v"                                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/synopsys/alt_mlab.v"                                                
    dict set design_files "alt_mlab.v"                                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/mentor/alt_mlab.v"                                                  
    dict set design_files "alt_mlab.v"                                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/cadence/alt_mlab.v"                                                 
    dict set design_files "alt_mlab.v"                                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/aldec/alt_mlab.v"                                                   
    dict set design_files "intel_pcie_reset_sync.v"                                             "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_reset_sync.v"                                            
    dict set design_files "intel_std_synchronizer_nocut.v"                                      "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_std_synchronizer_nocut.v"                                     
    dict set design_files "altera_pcie_s10_gen3x16_adapter.sv"                                  "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_adapter.sv"                                 
    dict set design_files "altera_pcie_s10_gen3x16_rx_st_if.sv"                                 "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_rx_st_if.sv"                                
    dict set design_files "altera_pcie_s10_gen3x16_tx_st_if.sv"                                 "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_tx_st_if.sv"                                
    dict set design_files "altpcie_adapter_credit.v"                                            "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_adapter_credit.v"                                           
    dict set design_files "altpcie_async_fifo.v"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_async_fifo.v"                                               
    dict set design_files "altpcie_fifo_read_ctrl.v"                                            "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_fifo_read_ctrl.v"                                           
    dict set design_files "altpcie_fifo_write_ctrl.v"                                           "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_fifo_write_ctrl.v"                                          
    dict set design_files "altpcie_sc_bitsync.v"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altpcie_sc_bitsync.v"                                               
    dict set design_files "intel_pcie_cii_if.sv"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_cii_if.sv"                                               
    dict set design_files "intel_pcie_err_if.sv"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_err_if.sv"                                               
    dict set design_files "intel_pcie_flr_if.sv"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_flr_if.sv"                                               
    dict set design_files "intel_pcie_int_if.sv"                                                "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/intel_pcie_int_if.sv"                                               
    dict set design_files "alt_ehipc3_mlab.sv"                                                  "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/alt_ehipc3_mlab.sv"                                                 
    dict set design_files "sync_bit.v"                                                          "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/sync_bit.v"                                                         
    dict set design_files "sync_pulse.v"                                                        "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/sync_pulse.v"                                                       
    dict set design_files "altera_pcie_s10_gen3x16_dcfifo.sv"                                   "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_dcfifo.sv"                                  
    dict set design_files "altera_pcie_s10_gen3x16_cfg_if.sv"                                   "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_cfg_if.sv"                                  
    dict set design_files "altera_pcie_s10_gen3x16_gpx3.sv"                                     "$QSYS_SIMDIR/../intel_pcie_pio_gts_234/sim/altera_pcie_s10_gen3x16_gpx3.sv"                                    
    dict set design_files "pcie_ed_pio0.v"                                                      "$QSYS_SIMDIR/pcie_ed_pio0.v"                                                                                   
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
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}

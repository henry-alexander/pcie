
namespace eval pcie_ed_syspll {
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
    dict set design_files "spll_hal_top.sv"                                           "$QSYS_SIMDIR/../spll_hal_2100/sim/spll_hal_top.sv"                                                    
    dict set design_files "pcie_ed_syspll_spll_hal_2100_dlmglry.sv"                   "$QSYS_SIMDIR/../spll_hal_2100/sim/pcie_ed_syspll_spll_hal_2100_dlmglry.sv"                            
    dict set design_files "pcie_ed_syspll_intel_systemclk_gts_spll_hal_200_cc5u5ly.v" "$QSYS_SIMDIR/../intel_systemclk_gts_200/sim/pcie_ed_syspll_intel_systemclk_gts_spll_hal_200_cc5u5ly.v"
    dict set design_files "pcie_ed_syspll_intel_systemclk_gts_200_eathmmq.sv"         "$QSYS_SIMDIR/../intel_systemclk_gts_200/sim/pcie_ed_syspll_intel_systemclk_gts_200_eathmmq.sv"        
    dict set design_files "pcie_ed_syspll.v"                                          "$QSYS_SIMDIR/pcie_ed_syspll.v"                                                                        
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
      append ELAB_OPTIONS { $QUARTUS_INSTALL_DIR/eda/sim_lib/quartus_dpi.c -debug_access+f +define+QUARTUS_ENABLE_DPI_FORCE}
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

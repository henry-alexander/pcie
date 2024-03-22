
namespace eval pcie_ed_srcssIP {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries intel_srcss_gts_200 1
    dict set libraries pcie_ed_srcssIP     1
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
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../intel_srcss_gts_200/sim/pcie_ed_srcssIP_intel_srcss_gts_200_bg3co7q.sv\"  -work intel_srcss_gts_200 -cdslib  ./cds_libs/intel_srcss_gts_200.cds.lib"
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../intel_srcss_gts_200/sim/intelfpga/intel_srcss_gts.sv\"  -work intel_srcss_gts_200 -cdslib  ./cds_libs/intel_srcss_gts_200.cds.lib"                  
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../intel_srcss_gts_200/sim/intelfpga/intel_ss_synchronizers.sv\"  -work intel_srcss_gts_200 -cdslib  ./cds_libs/intel_srcss_gts_200.cds.lib"           
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../intel_srcss_gts_200/sim/intelfpga/sopc_synchronizer.v\"  -work intel_srcss_gts_200 -cdslib  ./cds_libs/intel_srcss_gts_200.cds.lib"                     
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/pcie_ed_srcssIP.v\"  -work pcie_ed_srcssIP"                                                                                                      
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

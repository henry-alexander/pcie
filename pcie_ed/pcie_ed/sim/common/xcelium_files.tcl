source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_srcssIP/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_MEM0/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_iopll0/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_syspll/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_dut/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_pio0/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/pcie_ed/pcie_ed_resetIP/sim/common/xcelium_files.tcl]

namespace eval pcie_ed {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [pcie_ed_srcssIP::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_MEM0::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_iopll0::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_syspll::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_dut::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_pio0::get_design_libraries]]
    set libraries [dict merge $libraries [pcie_ed_resetIP::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_192  1
    dict set libraries altera_merlin_slave_translator_191   1
    dict set libraries altera_merlin_master_agent_1921      1
    dict set libraries altera_merlin_slave_agent_1921       1
    dict set libraries altera_avalon_sc_fifo_1931           1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_burst_adapter_1931     1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries altera_reset_controller_1922         1
    dict set libraries pcie_ed                              1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [pcie_ed_srcssIP::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_srcssIP/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_MEM0::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_MEM0/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_iopll0::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_iopll0/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_syspll::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_syspll/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_dut::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_dut/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_pio0::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_pio0/sim/"]]
    set memory_files [concat $memory_files [pcie_ed_resetIP::get_memory_files "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_resetIP/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [pcie_ed_srcssIP::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_srcssIP/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_MEM0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_MEM0/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_iopll0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_iopll0/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_syspll::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_syspll/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_dut::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_dut/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_pio0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_pio0/sim/"]]
    set design_files [dict merge $design_files [pcie_ed_resetIP::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_resetIP/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [pcie_ed_srcssIP::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_srcssIP/sim/"]]
    set design_files [concat $design_files [pcie_ed_MEM0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_MEM0/sim/"]]
    set design_files [concat $design_files [pcie_ed_iopll0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_iopll0/sim/"]]
    set design_files [concat $design_files [pcie_ed_syspll::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_syspll/sim/"]]
    set design_files [concat $design_files [pcie_ed_dut::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_dut/sim/"]]
    set design_files [concat $design_files [pcie_ed_pio0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_pio0/sim/"]]
    set design_files [concat $design_files [pcie_ed_resetIP::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_resetIP/sim/"]]
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/pcie_ed_altera_merlin_master_translator_192_lykd4la.sv\"  -work altera_merlin_master_translator_192 -cdslib  ./cds_libs/altera_merlin_master_translator_192.cds.lib"    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/pcie_ed_altera_merlin_slave_translator_191_x56fcki.sv\"  -work altera_merlin_slave_translator_191 -cdslib  ./cds_libs/altera_merlin_slave_translator_191.cds.lib"        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_master_agent_1921/sim/pcie_ed_altera_merlin_master_agent_1921_2inlndi.sv\"  -work altera_merlin_master_agent_1921 -cdslib  ./cds_libs/altera_merlin_master_agent_1921.cds.lib"                    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/pcie_ed_altera_merlin_slave_agent_1921_b6r3djy.sv\"  -work altera_merlin_slave_agent_1921 -cdslib  ./cds_libs/altera_merlin_slave_agent_1921.cds.lib"                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_slave_agent_1921 -cdslib  ./cds_libs/altera_merlin_slave_agent_1921.cds.lib"                                      
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_sc_fifo_1931/sim/pcie_ed_altera_avalon_sc_fifo_1931_fzgstwy.v\"  -work altera_avalon_sc_fifo_1931 -cdslib  ./cds_libs/altera_avalon_sc_fifo_1931.cds.lib"                                             
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pcie_ed_altera_merlin_router_1921_3x2ld6i.sv\"  -work altera_merlin_router_1921 -cdslib  ./cds_libs/altera_merlin_router_1921.cds.lib"                                            
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/pcie_ed_altera_merlin_router_1921_xl25uli.sv\"  -work altera_merlin_router_1921 -cdslib  ./cds_libs/altera_merlin_router_1921.cds.lib"                                            
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/pcie_ed_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv\"  -work altera_avalon_st_pipeline_stage_1930 -cdslib  ./cds_libs/altera_avalon_st_pipeline_stage_1930.cds.lib"
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v\"  -work altera_avalon_st_pipeline_stage_1930 -cdslib  ./cds_libs/altera_avalon_st_pipeline_stage_1930.cds.lib"                       
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/pcie_ed_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1931_3dloaiq.v\"  -work altera_merlin_burst_adapter_1931"                                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/pcie_ed_altera_merlin_burst_adapter_1931_isablti.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_merlin_burst_adapter_uncmpr.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                              
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_merlin_burst_adapter_13_1.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_merlin_burst_adapter_new.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                 
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_incr_burst_converter.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                     
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_wrap_burst_converter.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                     
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_default_burst_converter.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                  
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_burst_adapter_1931/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_burst_adapter_1931 -cdslib  ./cds_libs/altera_merlin_burst_adapter_1931.cds.lib"                                 
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/pcie_ed_altera_merlin_demultiplexer_1921_4qvfzsi.sv\"  -work altera_merlin_demultiplexer_1921 -cdslib  ./cds_libs/altera_merlin_demultiplexer_1921.cds.lib"                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/pcie_ed_altera_merlin_multiplexer_1922_567o7mq.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                                              
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/pcie_ed_altera_merlin_multiplexer_1922_4yjgsfq.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                                              
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/pcie_ed_altera_mm_interconnect_1920_574ptny.v\"  -work altera_mm_interconnect_1920"                                                                                       
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v\"  -work altera_reset_controller_1922 -cdslib  ./cds_libs/altera_reset_controller_1922.cds.lib"                                                          
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v\"  -work altera_reset_controller_1922 -cdslib  ./cds_libs/altera_reset_controller_1922.cds.lib"                                                        
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/pcie_ed.v\"  -work pcie_ed"                                                                                                                                                                                  
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [pcie_ed_srcssIP::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_MEM0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_iopll0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_syspll::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_dut::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_pio0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie_ed_resetIP::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [pcie_ed_srcssIP::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_MEM0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_iopll0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_syspll::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_dut::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_pio0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie_ed_resetIP::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_srcssIP::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_MEM0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_iopll0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_syspll::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_dut::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_pio0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie_ed_resetIP::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [pcie_ed_srcssIP::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_srcssIP/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_MEM0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_MEM0/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_iopll0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_iopll0/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_syspll::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_syspll/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_dut::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_dut/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_pio0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_pio0/sim/"]]
    set libraries [dict merge $libraries [pcie_ed_resetIP::get_dpi_libraries "$QSYS_SIMDIR/../../ip/pcie_ed/pcie_ed_resetIP/sim/"]]
    
    return $libraries
  }
  
}

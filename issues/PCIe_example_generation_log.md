Info: intel_pcie_gts_0: Auto-generation of QSYS example design beginning...
Info: intel_pcie_gts_0: Validating example design parameters and selection...
Info: intel_pcie_gts_0: Parametrization is valid.
Info: intel_pcie_gts_0: Auto-generation of QSYS example design in progress based on variant parameter settings
Info: intel_pcie_gts_0: save_system C:/Users/152249/AppData/Local/Temp/alt9801_11310954131362335640.dir/0001_intel_pcie_gts_0_gen/pcie_ed.qsys
Info: intel_pcie_gts_0: Generating QSYS system pcie_ed.qsys
Info: intel_pcie_gts_0: Running: qsys-script --pro --script=pcie_ed.tcl
Info: intel_pcie_gts_0: Example design generation
Info: intel_pcie_gts_0: The example design synthesis files will be generated
Info: intel_pcie_gts_0: The example design simulation files will be generated
Info: intel_pcie_gts_0: Targeting FPGA Development kit ....
Info: intel_pcie_gts_0: Now generating HDL files...
Info: intel_pcie_gts_0: Project name                    : pcie_ed
Info: intel_pcie_gts_0: Generate QSYS synthesis exmaple : 1
Info: intel_pcie_gts_0: Generate simulation testbench   : 1
Info: intel_pcie_gts_0: Device                          : A5ED065BB32AE4S
Info: intel_pcie_gts_0: Generating simulation testbench...
Info: intel_pcie_gts_0: Running: qsys-generate pcie_ed.qsys --simulation=VERILOG --testbench=STANDARD --testbench-simulation=VERILOG --part=A5ED065BB32AE4S
Info: intel_pcie_gts_0: Passed pcie_ed.qsys simulation generation
Info: intel_pcie_gts_0: Generating simulation testbench...
Info: intel_pcie_gts_0: Running: qsys-generate pcie_ed.qsys --synthesis=VERILOG --part=A5ED065BB32AE4S
Info: intel_pcie_gts_0: Passed pcie_ed.qsys synthesis generation
Info: intel_pcie_gts_0: Currently no pin assignments generated...
Info: intel_pcie_gts_0: Running: quartus_sh -t pcie_ed_quartusfile.tcl
Info: intel_pcie_gts_0: Successfully generated : pcie_ed.qpf, pcie_ed.qsf
Info: intel_pcie_gts_0: RP Generation: Creating folder for Root Port generated files C:/Users/152249/AppData/Local/Temp/alt9801_11310954131362335640.dir/0001_intel_pcie_gts_0_gen/
Info: intel_pcie_gts_0: RP Generation: temp_dir: C:/Users/152249/AppData/Local/Temp/alt9801_11310954131362335640.dir/0001_intel_pcie_gts_0_gen/pcie_ed_rp/
Info: intel_pcie_gts_0: RP Generation: Creating Quartus project file
Info: intel_pcie_gts_0: RP Generation: Running: qsys-script
Info: intel_pcie_gts_0: RP Generation: Running: qsys-generate
Error: intel_pcie_gts_0: RP Generation: Error when executing: qsys-generate
Error: intel_pcie_gts_0: RP Generation: Error message: ***************************************************************
Quartus is a registered trademark of Intel Corporation in the
US and other countries.  Portions of the Quartus Prime software
code, and other portions of the code included in this download
or on this DVD, are licensed to Intel Corporation and are the
copyrighted property of third parties. For license details,
refer to the End User License Agreement at
http://fpgasoftware.intel.com/eula.
***************************************************************

2024.03.19.09:22:17 Warning: Quartus project not specified. Use --quartus-project and --rev to specify a Quartus project and revision.
2024.03.19.09:22:17 Error: Unknown device part A5ED065BB32AE4S
Info: intel_pcie_gts_0: RP Generation: Replacing QSYS port name
Error: error copying "C:/Users/152249/AppData/Local/Temp/alt9801_11310954131362335640.dir/0001_intel_pcie_gts_0_gen/pcie_ed_rp//pcie_top/synth/pcie_top.v": no such file or directory
    while executing
"__altera__safe_file copy -force C:/Users/152249/AppData/Local/Temp/alt9801_11310954131362335640.dir/0001_intel_pcie_gts_0_gen/pcie_ed_rp//pcie_top/syn..."
    ("uplevel" body line 1)
    invoked from within
"uplevel 1 [list __altera__safe_file {*}$args]"
    (procedure "file" line 2)
    invoked from within
"file copy -force "${pcie_top_syn_path}/pcie_top.v" "${pcie_top_syn_path}/pcie_top.v.ori""
    (procedure "::intel_pcie_gts::pcie_syspll_ed" line 295)
    invoked from within
"::intel_pcie_gts::pcie_syspll_ed $ORI_TEMP_PATH"
    (procedure "::intel_pcie_gts::generate_design_example_files" line 196)
    invoked from within
"::intel_pcie_gts::generate_design_example_files  ${QSYSTemPath} ${QSYSTemName} $TEMPPATH"
    (procedure "::intel_pcie_gts::generate_dynamic_qsys" line 373)
    invoked from within
"::intel_pcie_gts::generate_dynamic_qsys  "
    (procedure "::intel_pcie_gts::dynamic_example_design" line 11)
    invoked from within
"::intel_pcie_gts::dynamic_example_design"
    (procedure "::intel_pcie_gts::fileset::callback_example_design" line 2)
    invoked from within
"::intel_pcie_gts::fileset::callback_example_design intel_pcie_gts_0_example_design"
Error: Failed to generate example design example_design to: C:\projects\axe5_eagle\pcie\intel_pcie_gts_0_example_design

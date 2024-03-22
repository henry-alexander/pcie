project_open pcie_ed
source pcie_ed_revd_devkit_qsf.tcl
set_instance_assignment -name MESSAGE_DISABLE 14320 -entity pcie_ed
set_global_assignment -name SDC_FILE  sm_pciess_ed.sdc.terp
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_MEM0/pcie_ed_MEM0.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_pio0/pcie_ed_pio0.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_iopll0/pcie_ed_iopll0.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_srcssIP/pcie_ed_srcssIP.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_resetIP/pcie_ed_resetIP.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_syspll/pcie_ed_syspll.spd
set_global_assignment -name SPD_FILE ./ip/pcie_ed/pcie_ed_dut/pcie_ed_dut.spd
set_global_assignment -name SPD_FILE ./pcie_ed_rp/ip/pcie_top/sm/sm.spd
set_global_assignment -name SPD_FILE ./pcie_ed_rp/pcie_top/pcie_top.spd
set_global_assignment -name SPD_FILE ./pcie_ed_rp/ip/pcie_top/syspll/syspll.spd
set_global_assignment -name SPD_FILE ./pcie_ed_rp/ip/pcie_top/srcssIP/srcssIP.spd
set_global_assignment -name SPD_FILE ./pcie_ed/pcie_ed.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/dut_pcie_tb_ip/dut_pcie_tb_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/pcie_ed_inst_refclk0_bfm_ip/pcie_ed_inst_refclk0_bfm_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/pcie_ed_inst_refclk_xcvr_bfm_ip/pcie_ed_inst_refclk_xcvr_bfm_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/pcie_ed_inst_pin_perst_n_bfm_ip/pcie_ed_inst_pin_perst_n_bfm_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/pcie_ed_inst_i_gpio_perst0_n_bfm_ip/pcie_ed_inst_i_gpio_perst0_n_bfm_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/ip/pcie_ed_tb/pcie_ed_inst_refclk_bfm_ip/pcie_ed_inst_refclk_bfm_ip.spd
set_global_assignment -name SPD_FILE ./pcie_ed_tb/pcie_ed_tb/pcie_ed_tb.spd
project_close

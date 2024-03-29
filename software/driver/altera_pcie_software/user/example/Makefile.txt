# Extremely simple makefile.

all:
	test -f intel_pcie_ptile_dma.h || touch intel_pcie_ptile_dma.h;\
	g++ -std=c++0x -Wall -I ../api -I ../api/linux ../api/linux/intel_fpga_pcie_api_linux.cpp intel_fpga_pcie_link_test.cpp -o intel_fpga_pcie_link_test
clean:
	rm -f ./intel_fpga_pcie_link_test

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


#====================================================================================
# This script is to test S10 AVMM Root port example design in hardware 
# Root port design should be enabled the interfaces below
#    Control register access (CRA) Avalon-MM slave port
#    Avalon-MM Slave interface with individual bytes access (TXS)
#    HIP dynamic reconfiguration of PCIe read-only registers
# This script should be run in the System Console, please refers to README.txt
#====================================================================================

# Configuration -----------
set verbose     1
set debug_level 1
set stub        0

####################################################################
################## System Address Map ##############################
####################################################################    

set MAX_BUS         256
set MAX_DEVICE      32
set MAX_FUNC        8

# ##### RP System Address Map
# TO DO : generate the below three address based on designed system
set TXS_BASE        0x21000000
set CRA_BASE        0x20000000
set HIP_RECONFIG    0x00000000
set RP_TX_REG0      [expr $CRA_BASE + 0x2000]
set RP_TX_CTRL      [expr $CRA_BASE + 0x2004]
set RP_RX_STS       [expr $CRA_BASE + 0x200C]
set RP_RX_REG0      [expr $CRA_BASE + 0x2008]
set RP_INT_REG      [expr $CRA_BASE + 0x3070]
set RP_CAP_PTR      0
set EP_CAP_PTR      0

# ###### RP Configuation Space 
# TXS 24bit address with case
# TO DO : generate address range based on TXS address width

# Memory BAR minimum step : 16bytes
# address must be dw aligned
# set BAR_ADDR_STEP           0x10

# 1.5Gbytes
set BAR_PREF_BASE           0x0
set next_bar_pref_base      $BAR_PREF_BASE
set BAR_PREF_LIMIT          [expr $BAR_PREF_BASE + 0x60000000]
set num_of_bar_pref         0

# ~512Mbytes
set BAR_NON_PREF_BASE       $BAR_PREF_LIMIT
set next_bar_non_pref_base  $BAR_NON_PREF_BASE
set BAR_NON_PREF_LIMIT      [expr $BAR_NON_PREF_BASE + 0x20000000]
set num_of_bar_non_pref     0

# 64Kbytes
set BAR_IO_BASE             0x00FFF0000
set BAR_IO_LIMIT            0x10000
set NUM_OF_BAR_IO           0

# ###### EP Configuation Space 
#set EP_BAR_BASES             { 0x0 0x0 0x0 0x0 0x0 0x0 }
#set EP_BAR_SIZES             { 0x0 0x0 0x0 0x0 0x0 0x0 }

####################################################################
##################       UTILITY      ##############################
####################################################################

proc dprint { level str } {
    global debug_level
    if { $debug_level >= $level } {
        set indent [string repeat " " [expr $level * 2]] 
        puts "$indent $str"
    }
}

proc vprint { str } {
    global verbose 
    if { $verbose == 1 } {
        puts $str
    }
}

####################################################################
##################   JTAG Interface   ##############################
####################################################################

proc sleep {N} {
   after [expr {int($N)}]
}

proc master_write { addr data } {
    global claim_path
    global stub
    if { $stub == 0 } {
        master_write_32 $claim_path $addr $data
    }
}

proc master_read { addr } {
    global claim_path
    global stub
    
    if { $stub == 0 } {
        set rval [master_read_32 $claim_path $addr 1]
    } else {
        set rval 0
    }
    return $rval
}

if { $stub == 1 } {
    set claim_path 1
} else {
    #We are interested in master services.
    set service_type "master"
    #Get all the paths as a list.
    set master_service_paths [get_service_paths $service_type]
    #We are interested in the first service in the list.
    set master_index 0
    #The path of the first master.
    set master_path [lindex $master_service_paths $master_index]
    set service_type "master"
    #Open Master Service
    set claim_path [claim_service $service_type $master_path mylib]
}

proc get_master_index { } {
    set usbs [get_service_paths device]
    set usb_index [lsearch $usb *5M*]
    set node [lindex $usb $usb_index]
    set usb_cable [lindex [split $node "#"] 1] 
    set master_service_paths [get_service_paths $service_type]
}    

    
####################################################################
##################   Cfg write/read   ##############################
####################################################################

set tag 0x10
proc _cfg_access { bus device func rw reg_addr wdata} {
    global RP_TX_REG0
    global RP_TX_CTRL
    global stub
    global tag
        
    if {$rw == 1} {
        set dw1 0x44000001
        set rw_str "Write"
    } else {
        set dw1 0x04000001
        set rw_str "Read"
    }
    dprint 2 "********** Begin EP Configuration $rw_str **********"
    
    set bdf [expr ($bus << 24) | ($device << 19) | ($func << 16)]
    set dw2 [expr ($tag<<8) + 0xf]
    set dw3 [expr $bdf | $reg_addr ]
    
    if { $tag == 0x1f } {
        set tag 0x10
    } else {
        incr tag
    }
       
    master_write $RP_TX_REG0 $dw1
    master_write $RP_TX_CTRL 1
    dprint 2 [format "1DW : 0x%08x" $dw1]
    
    master_write $RP_TX_REG0 $dw2
    master_write $RP_TX_CTRL 0
    dprint 2 [format "2DW : 0x%08x" $dw2]

    master_write $RP_TX_REG0 $dw3
    master_write $RP_TX_CTRL 0
    dprint 2 [format "3DW : 0x%08x" $dw3]
    
    master_write $RP_TX_REG0 $wdata
    dprint 2 [format "payload : 0x%08x" $wdata]
    master_write $RP_TX_CTRL 2

    dprint 2 "********** End EP Configuration $rw_str **********"

    if { $stub == 1 } {
        set ret 0
    } else {
        set ret [_readCpl]
    }
    return $ret
}

proc _readCpl { } {
    global RP_RX_REG0
    global RP_RX_STS

    dprint 2 "********** Begin Completion Read **********"

    set timeout_count 0
    set status_reg [master_read $RP_RX_STS]

    #set status_reg [expr $status_reg & 0x3]
    while {$status_reg == 0} {
        sleep 100
        set status_reg [master_read $RP_RX_STS]
        set timeout_count [expr {$timeout_count + 1}]
        if { $timeout_count > 5 } {
            puts "ReadCPL timeout"
            return 0
        }
    }

    set cpl_dw1 [master_read $RP_RX_REG0]
    
    set cpl_fmt [expr ($cpl_dw1 >> 29) & 0x7]
    if { $cpl_fmt == 0x2 } {
        set cpl_fmt_str "Compl with data"
    } else {
        set cpl_fmt_str "Compl without data"
    }
    set cpl_length [expr $cpl_dw1 & 0x3ff]
    dprint 2 "$cpl_fmt_str length:$cpl_length"
    
    set status_reg [master_read $RP_RX_STS]
    set cpl_dw2 [master_read $RP_RX_REG0]

    set cpl_bus    [expr ($cpl_dw2 >> 24) & 0xff]
    set cpl_device [expr ($cpl_dw2 >> 19) & 0x1f]
    set cpl_func   [expr ($cpl_dw2 >> 16) & 0x7]
    set cpl_bytes [expr $cpl_dw2 & 0xfff]
    dprint 2 "Completer B:$cpl_bus D:$cpl_device F:$cpl_func -- bytes:$cpl_bytes"
    set comp_status [ expr ($cpl_dw2>>13) & 0x7]
    if { $comp_status == 0x0 } {
        dprint 2 "CS : $comp_status - Successful complete"
    } elseif { $comp_status == 0x1 } {
        puts "CS : $comp_status - Unsupported Request"
    } elseif { $comp_status == 0x2 } {
        puts "CS : $comp_status - Retry Req"
    } elseif { $comp_status == 0x4 } {
        puts "CS : $comp_status - Completer Abort"
    } else {
        puts "CS : $comp_status - Unknown"
    }
    
    set status_reg [master_read $RP_RX_STS]
    
    if { $status_reg != 0x2 } {
        set cpl_dw3 [master_read $RP_RX_REG0]
        set status_reg [master_read $RP_RX_STS]
        set cpl_dw4 [master_read $RP_RX_REG0]
    } else {
        set cpl_dw3 [master_read $RP_RX_REG0]
        set cpl_dw4 0
    }
    
    dprint 2 "compl dws: $cpl_dw1 $cpl_dw2 $cpl_dw3 $cpl_dw4"
    set cpl_bus    [expr ($cpl_dw3 >> 24) & 0xff]
    set cpl_device [expr ($cpl_dw3 >> 19) & 0x1f]
    set cpl_func   [expr ($cpl_dw3 >> 16) & 0x7]   
    set cpl_tag        [expr ($cpl_dw3 >> 8) & 0xff]   
    dprint 2 "Requester B:$cpl_bus D:$cpl_device F:$cpl_func -- Tag:[format "0x%02x" $cpl_tag]"   
        
    dprint 2 [format "Completed Data : 0x%08x" $cpl_dw4]
    set ret $cpl_dw4
    
    dprint 2 "********** End Completion Read **********"
    return $ret
} 

proc ep.cfg_rd { bus device func reg_addr } {
    set ret [_cfg_access $bus $device $func 0 $reg_addr 0]
    return $ret
}    

proc ep.cfg_wr { bus device func reg_addr wdata } {
    set ret [_cfg_access $bus $device $func 1 $reg_addr $wdata]
    return $ret
}

proc rp.rx_buf_flush { } {
    global RP_RX_REG0
    global RP_RX_STS
    
    set i 0
    while {$i < 5} {
        set status_reg [master_read $RP_RX_STS]
        set cpl_dw1 [master_read $RP_RX_REG0]
        set i [expr $i + 1]
    }
}   

proc _rp_access { rw reg_addr wdata } {
    global HIP_RECONFIG
    # hip_reconfig_address[20]: Should be set to 1'b1 to indicate PCIe space access
    set hip_addr [expr $HIP_RECONFIG + $reg_addr + (0x1<<20)]
    if { $rw == 1 } {
        master_write $hip_addr $wdata 
        set ret 0
    } else {
        set ret [master_read $hip_addr]
    }
    return $ret
}

proc rp.cfg_rd { reg_addr } {
    set ret [_rp_access 0 $reg_addr 0]
    return $ret
}

proc rp.cfg_wr { reg_addr wdata } {
    set ret [_rp_access 1 $reg_addr $wdata]
    return $ret
}

proc rp.print_cfg_space {} {
    for {set addr 0x0} {$addr < 0x40} {set addr [expr $addr+0x4]} {
        puts "[format 0x%02x $addr]: [rp.cfg_rd $addr]"
    }
}

proc ep.print_cfg_space {bus device func} {
    for {set addr 0x0} {$addr < 0x40} {set addr [expr $addr+0x4]} {
        puts "[format 0x%02x $addr]: [ep.cfg_rd $bus $device $func $addr]"
    }
}

proc p2p.rd {bus device func reg_addr} {
    global RP_TX_REG0
    global RP_TX_CTRL
    global tag

    #1st dw: type0 rd, length 1
    master_write $RP_TX_REG0 0x05000001
    #SOP=1
    master_write $RP_TX_CTRL 1
    
    #2nd dw: requester id 0, tag, byte enable f 
    master_write $RP_TX_REG0 [expr ($tag << 8) + 0xf]
    master_write $RP_TX_CTRL 0

    if { $tag == 0x1f } {
        set tag 0x10
    } else {
        incr tag
    }

    #3rd dw: bdf 0
    set bdf [expr ($bus << 24) | ($device << 19) | ($func << 16)] 
    master_write $RP_TX_REG0 [expr $bdf | ($reg_addr & 0xfc)]
    master_write $RP_TX_CTRL 0
    
    #payload dw
    master_write $RP_TX_REG0 0
    #EOP=1
    master_write $RP_TX_CTRL 2
    
    return [_readCpl]
}

proc p2p.wr {bus device func reg_addr wdata} {
    global RP_TX_REG0
    global RP_TX_CTRL
    global tag

    #1st dw: type0 wr, length 1
    master_write $RP_TX_REG0 0x45000001
    #SOP=1
    master_write $RP_TX_CTRL 1
    
    #2nd dw: requester id 0, tag, byte enable f 
    master_write $RP_TX_REG0 [expr ($tag << 8) + 0xf]
    master_write $RP_TX_CTRL 0

    if { $tag == 0x1f } {
        set tag 0x10
    } else {
        incr tag
    }

    #3rd dw: bdf 0
    set bdf [expr ($bus << 24) | ($device << 19) | ($func << 16)] 
    master_write $RP_TX_REG0 [expr $bdf | ($reg_addr & 0xfc)]
    master_write $RP_TX_CTRL 0
    
    #payload dw
    master_write $RP_TX_REG0 $wdata
    #EOP=1
    master_write $RP_TX_CTRL 2
    
    return [_readCpl]
}


####################################################################
##################   Cfg functions    ##############################
####################################################################

proc ep.init {bus device func} {

    #ep.pciecapstructure

    puts "Starting EP Initializtaion for $bus/$device/$func"
    #Check capability link speed, link width
    #ep.rd_link_capabilities $bus $device $func

    #Check negotiated link speed, link width
    #ep.rd_link_status_control $bus $device $func

    #Check device status control
    set rData [ep.cfg_rd $bus $device $func 0x88]
    puts "Error Reporting Enabled: [expr $rData & 0xf]"
    set temp_data [expr ($rData >> 5) & 0x7]
    set mps [expr $temp_data == 0b000 ? 128: [expr $temp_data == 0b001 ? 256: [expr $temp_data == 0b010 ? 512: [expr $temp_data == 0b011 ? 1024: [expr $temp_data == 0b100 ? 2048: [expr $temp_data == 0b101 ? 4096: 0]]]]]]
    puts "Maximum Payload Size: $mps"
    puts "Extended Tag Field Enabled: [expr ($rData >> 8) & 1]"


    #set up BARs
    ep.init_bar $bus $device $func

    #Enable this EP device to accept MMIO/IO transactions
    ep.wr_status_command $bus $device $func
    
    puts "Ends EP Initializtaion for $bus/$device/$func"
}

proc rp.rd_device_vendor_id { } {
    set ret [rp.cfg_rd 0 ]
    dprint 1 "RP Vendor ID : $ret"
    return $ret
}

proc ep.rd_device_vendor_id {bus device func} {
    set ret [ep.cfg_rd $bus $device $func 0 ]
    dprint 1 "EP $bus$device$func Device_Vendor ID : $ret"
    return $ret
}

proc rp.wr_status_command { } {
    #bus master/ memory/ io enable
    rp.cfg_wr 0x4 0x6
    rp.rd_status_command
}

proc ep.wr_status_command {bus device func} {
    #bus master/ memory/ io enable
    ep.cfg_wr $bus $device $func 0x4 0x7
    set ret [ep.cfg_rd $bus $device $func 0x4]
    dprint 2 "EP $bus$device$func Status_Command : $ret"
}

proc rp.rd_status_command { } {
    set ret [rp.cfg_rd 0x4 ]
    dprint 1  "RP bus master/mem/io enable : $ret"
    return $ret
}

proc rp.get_header_type { } {
    set ret [rp.cfg_rd 0xc ]
    dprint 1 "RP Header Type : $ret"
    return $ret
}

proc ep.get_header_type { bus device func } {
    set ret [ep.cfg_rd $bus $device $func 0xc ]
    dprint 1 "EP Header Type : $ret"
    return $ret
}

proc rp.get_bdf { } {
    set ret [rp.cfg_rd 0x18 ]
    set pb [expr $ret & 0xff]
    set sb [expr ($ret>>8) & 0xff]
    set sob [expr ($ret>>16) & 0xff]
    
    dprint 1 "Primary Bus# : $pb"
    dprint 1 "Secondary Bus# : $sb"
    dprint 1 "SubOrdinate Bus# : $sob"
}

proc rp.pciecapstructure { } {
    global RP_CAP_PTR
    set next_cap_ptr [expr [rp.cfg_rd 0x34 ] & 0xff]
    dprint 2 "Capability Pointer \[0x34\] : [format "0x%02x" $next_cap_ptr]"
    
    
    while {$next_cap_ptr != 0x0} {
        set next_cap [expr [rp.cfg_rd $next_cap_ptr ] & 0xffff]
        set next_cap_ptr [expr ($next_cap >> 8) & 0xff]
        set next_cap_id [expr $next_cap & 0xff]
        dprint 2 "Next Cap Ptr : [format "0x%02x" $next_cap_ptr], Cap_ID : [format "0x%02x" $next_cap_id]"
        if { $next_cap_ptr != 0x0 } {
            set RP_CAP_PTR $next_cap_ptr
        }    
    }
    dprint 2 "RP Capability PTR : [format "0x%02x" $RP_CAP_PTR]"
} 

proc ep.pciecapstructure {bus device func} {
    global EP_CAP_PTR
    set next_cap_ptr [expr [ep.cfg_rd $bus $device $func 0x34 ] & 0xff]
    dprint 2  "Capability Pointer \[0x34\] : [format "0x%02x" $next_cap_ptr]"
    
    
    while {$next_cap_ptr != 0x0} {
        set next_cap [expr [ep.cfg_rd $bus $device $func $next_cap_ptr] & 0xffff]
        set next_cap_ptr [expr ($next_cap >> 8) & 0xff]
        set next_cap_id [expr $next_cap & 0xff]
        dprint 2 "Next Cap Ptr : [format "0x%02x" $next_cap_ptr], Cap_ID : [format "0x%02x" $next_cap_id]"
        if { $next_cap_ptr != 0x0 } {
            set EP_CAP_PTR $next_cap_ptr
        }    
    }
    dprint 2 "EP Capability PTR : [format "0x%02x" $EP_CAP_PTR]"
}    
 
proc rp.get_link_status { } {
    global RP_CAP_PTR
    set ret [rp.cfg_rd [expr $RP_CAP_PTR + 0x10] ]
    dprint 1 "RP Link Status : $ret"
    parse_link_status $ret
}

proc ep.get_link_status { } {
    global EP_CAP_PTR
    set ret [ep.cfg_rd [expr $EP_CAP_PTR + 0x10] ]
    dprint 1 "EP Link Status : $ret"
    parse_link_status $ret
}

proc parse_link_status { ret } {
    if { [expr $ret & 0x80000000] } {
        vprint "Link Autonomous BW"
    }
    
    set link_speed [expr ($ret>>16) & 0xf]
    if { $link_speed == 0x1 } {
        vprint "Link Speed : 2.5G"
    } elseif { $link_speed == 0x2 } {
        vprint "Link Speed : 5.0G"
    } elseif { $link_speed == 0x3 } {
        vprint "Link Speed : 8.0G"
    } else {
        vprint "Link Speed : unknown $link_speed"
    }
    set link_width [expr ($ret>>20) & 0x3f]
    vprint "Link Width : x$link_width"
    
    if { [expr $ret & 0x08000000] } {
        vprint "Link Training"
    }
}

proc rp.int_enable { } {
    global RP_INT_REG
    master_write $RP_INT_REG 0xf
}

proc rp.set_link_retrain { } {
    global RP_CAP_PTR
    #set ret [rp.cfg_wr 0x90 0x60]
    set ret [rp.cfg_wr [expr $RP_CAP_PTR + 0x10] 0x60 ]
    dprint 2 "RP Link Control : $ret"
}

proc rp.get_link_capabilities { } {
    global RP_CAP_PTR
    set ret [rp.cfg_rd [expr $RP_CAP_PTR + 0xc] ]
    parse_link_cap $ret

}

proc ep.get_link_capabilities { } {
    global EP_CAP_PTR
    set ret [ep.cfg_rd [expr $EP_CAP_PTR + 0xc] ]
    parse_link_cap $ret
}

proc parse_link_cap { ret } {
    set link_speed [expr $ret & 0xf]
    if { $link_speed == 0x1 } {
        dprint 1 "Link Speed : 2.5G"
    } elseif { $link_speed == 0x2 } {
        dprint 1 "Link Speed : 5.0G"
    } elseif { $link_speed == 0x3 } {
        dprint 1 "Link Speed : 8.0G"
    } else {
        dprint 1 "Link Speed : unknown $link_speed"
    }
    set link_width [expr ($ret>>4) & 0x3f]
    dprint 1 "Link Width : x$link_width"
    
    if { [expr $ret & 0x08000000] } {
        dprint 1 "Link Training"
    }
}

proc ep.rd_link_capabilities {bus device func} {
    set ret [ep.cfg_rd $bus $device $func 0x8c]
    set link_speed [expr $ret & 0xf]
    if { $link_speed == 0x1 } {
        puts "EP Capability Link Speed : 2.5G"
    } elseif { $link_speed == 0x2 } {
        puts "EP Capability Link Speed : 5.0G"
    } elseif { $link_speed == 0x3 } {
        puts "EP Capability Link Speed : 8.0G"
    } else {
        puts "EP Capability Link Speed : unknown $link_speed"
    }
    set link_width [expr ($ret >> 4) & 0x3f]
    puts "EP Capability Link Width : x$link_width"
}

proc ep.rd_link_status_control {bus device func} {
    set ret [ep.cfg_rd $bus $device $func 0x90]
    puts "EP Link Status : $ret"
    
    if { [expr $ret & 0x80000000] } {
        puts "Link Autonomous BW"
    }

    if { [expr $ret & 0x08000000] } {
        puts "Link Training"
    } else {
        
        set link_speed [expr ($ret >> 16) & 0xf]
        if { $link_speed == 0x1 } {
            puts "EP Negotiated Link Speed : 2.5G"
        } elseif { $link_speed == 0x2 } {
            puts "EP Negotiated Link Speed : 5.0G"
        } elseif { $link_speed == 0x3 } {
            puts "EP Negotiated Link Speed : 8.0G"
        } else {
            puts "EP Negotiated Link Speed : unknown $link_speed"
        }
        set link_width [expr ($ret >> 20) & 0x3f]
        puts "EP Negotiated Link Width : x$link_width"
    
    }   
}

proc rp.set_device_control { ctrl_val } {
    global RP_CAP_PTR
    set ret [rp.cfg_wr [expr $RP_CAP_PTR + 0x8] $ctrl_val ]
    dprint 2 "RP Device Control : $ret"
}

proc rp.get_device_control { } {
    global RP_CAP_PTR
    set ret [rp.cfg_rd [expr $RP_CAP_PTR + 0x8] ]
    dprint 2 "RP Device Control : $ret"

}

proc ep.set_device_control { ctrl_val } {
    global EP_CAP_PTR
    set ret [ep.cfg_wr [expr $EP_CAP_PTR + 0x8] $ctrl_val ]
    dprint 2 "EP Device Control : $ret"
}


####################################################################
##################     Enumeration    ##############################
####################################################################

proc rp.wr_bdf {subordinate_bus} {
    set wData [expr ($subordinate_bus << 16) | 0x0100]
    rp.cfg_wr 0x18 $wData
    set ret [rp.cfg_rd 0x18]
    puts "RP BDF : $ret"
}

proc rp.enumeration {current_bus} {
    global MAX_DEVICE
    global MAX_FUNC
    
    global next_bar_pref_base
    global next_bar_non_pref_base
    
    set bus $current_bus
    set final_subordinate_bus $current_bus

    for {set device 0} {$device < $MAX_DEVICE} {incr device} {
        set func 0
        dprint 1 "in for loop, bus=$bus, device=$device, func=$func"
    
        set dvid [ep.rd_device_vendor_id $bus $device $func]
        if {$dvid != 0x00000000 && $dvid != 0xffffffff} {
            set temp_data [ep.cfg_rd $bus $device $func 0xc]
            set header_type [expr ({$temp_data} >> 16) & 0xff]
            puts "Header Type: $header_type"        
            if {$header_type == 0x00} { #single func
                puts "Found a single-function PCIe EP device at b/d/f: $bus/$device/0, DID/VID: $dvid"
                ep.init $bus $device $func
                if {$bus == 1 && $device == 0} {
                    puts "RP/EP direct connection"
                    return $final_subordinate_bus
                }
            } elseif {$header_type == 0x80} { #multi func
                puts "Found a multi-function EP device at b/d: $bus/$device"
                puts "PCIe EP device at b/d/f: $bus/$device/$func, DID/VID: $dvid"
                ep.init $bus $device $func                
                for {set func 1} {$func < $MAX_FUNC} {incr func} {
                    set dvid [ep.rd_device_vendor_id $bus $device $func]
                    if {$dvid != 0x00000000} {
                        puts "PCIe EP device at b/d/f: $bus/$device/$func, DID/VID: $dvid"
                        ep.init $bus $device $func
                    } else {
                        set func 0
                        break
                    }
                }
                if {$bus == 1 && $device == 0} {
                    puts "RP/EP direct connection"
                    return $final_subordinate_bus
                }
            } elseif {$header_type == 0x01} { #p2p bridge
                puts "Found a P2P bridge device at b/d/f: $bus/$device/$func, DID/VID: $dvid"
                #assign primary secondary and subordinate bus numbers in this bridge's PCIe header
                set primary_bus $bus;
                set secondary_bus [expr $final_subordinate_bus+1]
                set subordinate_bus 0xff
                set wdata [expr ($subordinate_bus << 16) | ($secondary_bus << 8) | $primary_bus]
                p2p.wr $bus $device $func 0x18 $wdata
                
                if {$secondary_bus > $subordinate_bus} break;
                
                set mem_pref_base $next_bar_pref_base
                set mem_non_pref_base $next_bar_non_pref_base
                
                #do recursive enumeration below this bridge
                set final_subordinate_bus [rp.enumeration $secondary_bus]
                #assign Base and Limit registers
                p2p.wr_blr $bus $device $func $mem_pref_base $mem_non_pref_base    
                #now write final subordinate bus number after full scan is completed
                set temp_data [p2p.rd $bus $device $func 0x18]
                set wData [expr ($temp_data & 0xffff) | ($final_subordinate_bus << 16)]
                p2p.wr $bus $device $func 0x18 $wdata
                p2p.wr $bus $device $func 0x4 0x7                
            } #header_type
        } else {
            puts "DID/VID is not valid"
            break
        }    
    }
    return $final_subordinate_bus
}    

####################################################################
################## BAR INITIALIZATION ##############################
####################################################################

# Limitations 
# 1. total 6 BARs size should not be exceeded over 2Gbytes
# 2. total prefetchable BARs size should not be exceeded over 1.5Gbytes
# 2. total Non prefetchable BARs size should not be exceeded over 512Mbytes
# 2. total IO BARs size should not be exceeded over 512Mbytes
# 3. 32bit address range even 64bit memory BAR
proc ep.init_bar {bus device func} {
    global next_bar_pref_base
    global BAR_PREF_LIMIT 
    global num_of_bar_pref
    set num_of_bar_pref 0
    
    global next_bar_non_pref_base  
    global BAR_NON_PREF_LIMIT 
    global num_of_bar_non_pref
    set num_of_bar_non_pref 0
        
    global BAR_IO_BASE      
    global BAR_IO_LIMIT   
    global NUM_OF_BAR_IO
    
    global BAR_ADDR_STEP         
    
    #global EP_BAR_BASES
    #global EP_BAR_SIZES
    
    set currentBAR 0
    
    while {$currentBAR < 6} {
        #read BARx to check addr_width and memory type
        ep.cfg_wr $bus $device $func [expr 0x10 + $currentBAR * 4] 0xffffffff
        set rData [ep.cfg_rd $bus $device $func [expr 0x10 + $currentBAR * 4]]
        if {$rData == 0x00000000 || $rData == 0xffffffff} {
            puts "BAR$currentBAR: type: None"
            incr currentBAR
        } else {
            set bar_type [expr $rData & 0x1]; #Mem/IO
            if {$bar_type == 0} {
                puts "BAR$currentBAR: Request Type: Memory Request"
                set addr_width [expr $rData & 0x6]; #64bit/32bit
                set mem_type [expr $rData & 0x8]; #NonPref/Pref
                if {$addr_width == 0} { #32bit addressing
                    puts "BAR$currentBAR: Address Width: 32-bit"
                    set bar_size [expr 0xffffffff - ($rData & 0xfffffff0)]
                    #if {$bar_size < $BAR_ADDR_STEP} {
                    #    set bar_size [expr $BAR_ADDR_STEP - 1]
                    #}
                    puts "BAR$currentBAR: Size: [expr ceil($bar_size/1024.0)]kB"
                    if {$mem_type == 0} { #non-prefetchable mem
                        if {[expr $next_bar_non_pref_base + $bar_size] > $BAR_NON_PREF_LIMIT} {
                            puts "Error: BAR$currentBAR requested range out of non-pref. bound"
                        } else {
                            #program bars with base and limits
                            #lset EP_BAR_BASES $currentBAR $next_bar_non_pref_base
                            #lset EP_BAR_SIZES $currentBAR $bar_size
                            puts "BAR$currentBAR: Assigning Non-pref. Range: [format 0x%x $next_bar_non_pref_base] - [format 0x%x [expr $next_bar_non_pref_base + $bar_size]]"
                            ep.cfg_wr $bus $device $func [expr 0x10 + $currentBAR * 4] [expr $next_bar_non_pref_base & ~$bar_size]
                            set next_bar_non_pref_base [expr $next_bar_non_pref_base + $bar_size + 1]; #new non-pref mem base for next bar
                            incr num_of_bar_non_pref                       
                        }                                     
                    } else { #prefetchable mem
                        if {[expr $next_bar_pref_base + $bar_size] > $BAR_PREF_LIMIT} {
                            puts "Error: BAR$currentBAR requested range out of pref. bound"
                        } else {
                            #program BARs with base/limit
                            #lset EP_BAR_BASES $currentBAR $next_bar_pref_base
                            #lset EP_BAR_SIZES $currentBAR $bar_size
                            puts "BAR$currentBAR: Assigning pref. Range: [format 0x%x $next_bar_pref_base] - [format 0x%x [expr $next_bar_pref_base + $bar_size]]"
                            ep.cfg_wr $bus $device $func [expr 0x10 + $currentBAR * 4] [expr $next_bar_pref_base & ~$bar_size]
                            set next_bar_pref_base [expr $next_bar_pref_base + $bar_size + 1]; #new base for next BAR/EP
                            incr num_of_bar_pref
                        }
                    }
                    incr currentBAR
                } else { #64bit addressing
                    puts "BAR$currentBAR: Address Width: 64-bit"
                    ep.cfg_wr $bus $device $func [expr 0x10 + ($currentBAR + 1) * 4] 0xffffffff
                    set lower_32bit [expr $rData & 0xfffffff0]
                    set upper_32bit [ep.cfg_rd $bus $device $func [expr 0x10 + ($currentBAR + 1) * 4]]
                    set bar_size [expr 0xffffffffffffffff - [format 0x%08x%08x $upper_32bit $lower_32bit]]
                    #if {$bar_size < $BAR_ADDR_STEP} {
                    #    set bar_size [expr $BAR_ADDR_STEP - 1]
                    #}
                    puts "BAR$currentBAR: Size: [expr ceil($bar_size/1024.0)]kB"
                    if {$mem_type == 0} { #non-prefetchable mem
                        if {[expr $next_bar_non_pref_base + $bar_size] < $BAR_NON_PREF_LIMIT} {
                            puts "Error: BAR$currentBAR requested range out of non-pref. bound"
                        } else {
                            #program bars with base and limits
                            #lset EP_BAR_BASES $currentBAR $next_bar_non_pref_base
                            #lset EP_BAR_SIZES $currentBAR $bar_size                            
                            set bar_wDataL [expr ($next_bar_non_pref_base & $bar_size) & 0xffffffff]
                            set bar_wDataH [expr ($next_bar_non_pref_base & $bar_size) >> 32]
                            puts "BAR$currentBAR: Assigning Non-pref. Range: [format 0x%x $next_bar_non_pref_base] - [format 0x%x [expr $next_bar_non_pref_base + $bar_size]]"
                            ep.cfg_wr $bus $device $func [expr 0x10 + $currentBAR*4] $bar_wDataL
                            ep.cfg_wr $bus $device $func [expr 0x10 + ($currentBAR + 1) * 4] $bar_wDataH
                            set next_bar_non_pref_base [expr $next_bar_non_pref_base + $bar_size + 1]; #new non-pref mem base for next bar
                            set num_of_bar_non_pref [expr $num_of_bar_non_pref + 2]
                        }                                     
                    } else { #prefetchable mem
                        if {[expr $next_bar_pref_base + $bar_size] > $BAR_PREF_LIMIT} {
                            puts "Error: BAR$currentBAR requested range out of pref. bound"
                        } else {
                            #program BARs with base/limit
                            #lset EP_BAR_BASES $currentBAR $next_bar_pref_base
                            #lset EP_BAR_SIZES $currentBAR $bar_size
                            set bar_wDataL [expr ($next_bar_pref_base & $bar_size) & 0xffffffff]
                            set bar_wDataH [expr ($next_bar_pref_base & $bar_size) >> 32]
                            puts "BAR$currentBAR: Assigning pref. Range: [format 0x%x $next_bar_pref_base] - [format 0x%x [expr $next_bar_pref_base + $bar_size]]"
                            ep.cfg_wr $bus $device $func [expr 0x10 + $currentBAR*4] $bar_wDataL
                            ep.cfg_wr $bus $device $func [expr 0x10 + ($currentBAR + 1) * 4] $bar_wDataH
                            set next_bar_pref_base [expr $next_bar_pref_base + $bar_size + 1]; #new base for next BAR/EP
                            set num_of_bar_pref [expr $num_of_bar_pref + 2]
                        }
                    }
                    set currentBAR [expr $currentBAR + 2]
                }            
            } else {
                puts "BAR$currentBAR: Request Type: IO Request"
                incr currentBAR
            }
        }
    }; #while
         
    # Not support EXPANSION ROM
    ep.cfg_rd $bus $device $func 0x30  
}

# NOT USED   
proc ep.get_bar_info {  } {
    global EP_BAR_BASES  
    global EP_BAR_SIZES   

    for {set bar 0} {$bar < 6} {incr bar} {
        set bar_size [lindex $EP_BAR_SIZES$bar]

        if { $bar_size == 0 } {
            dprint 1 "BAR\[$bar\]: N/A"
            continue
        } else {
            set cfg_bar_addr [expr 0x10 + $bar*4]
            set ret [ep.cfg_rd $cfg_bar_addr ]
            #set ep_bar_addr [lindex $EP_BAR_BASES $bar]
            set ep_bar_addr [expr $ret & 0xFFFFFFF0]
        }
        
        set memio [expr $ret & 0x1]

        if { $ret & 0x1 } {
            set memio "IO"
            set fetch_str ""
            set bit_decode ""
        } else {
            set memio "Memory"
            
            # address decording
            set bits [expr ($ret>>1) & 0x3]
            if { $bits == 0 } {
                set bit_decode "32bit"
            } else {
                set bit_decode "64bit"
            }
            
            set fetch [expr ($ret>>3) & 0x1]
            if { $fetch == 0 } {
                set fetch_str "Non-prefetchable"
            } else {
                set fetch_str "Prefetchable"
            }

        }
        dprint 1 "BAR\[$bar\]: [format "0x%08X" $ep_bar_addr] $bit_decode $fetch_str $memio, size - $bar_size bytes"  
    }
}

proc rp.wr_blr { } {
    global BAR_PREF_BASE
    global BAR_PREF_LIMIT
    
    global BAR_NON_PREF_BASE
    global BAR_NON_PREF_LIMIT   
    
    global BAR_IO_BASE    
    global BAR_IO_LIMIT     

    global num_of_bar_pref    
    global num_of_bar_non_pref    
    global NUM_OF_BAR_IO


    puts "pref base : [format "0x%08x" $BAR_PREF_BASE]"
    puts "pref limit : [format "0x%08x" $BAR_PREF_LIMIT]"
    puts "pref num : $num_of_bar_pref"

    if { $num_of_bar_pref > 0 } {
        # 32-bit
        set prefMemBaseReg  [expr ($BAR_PREF_BASE & 0xFFF00000) >> 16]
        set prefMemLimitReg [expr ($BAR_PREF_LIMIT & 0xFFF00000) >> 16]
        set prefMemValue    [expr $prefMemBaseReg | (($prefMemLimitReg<<16) & 0xffff0000)]
        set prefMemBaseUpperReg     0x0
        set prefMemLimitUpperReg    0x0  
    } else {
        set prefMemValue            0x0
        set prefMemBaseUpperReg     0x0   
        set prefMemLimitUpperReg    0x0  
    }
    
    if { $num_of_bar_non_pref > 0 } {
        set nonPrefBaseReg  [expr ($BAR_NON_PREF_BASE & 0xFFF00000) >> 16]
        set nonPrefLimitReg [expr ($BAR_NON_PREF_LIMIT & 0xFFF00000) >> 16]
        set nonPrefValue    [expr $nonPrefBaseReg | (($nonPrefLimitReg<<16) & 0xffff0000)]
    } else {
        set nonPrefValue    0x0
    }
    
    set ioBaseReg   0x0    
    set ioLimitReg  0x0
    set ioValue     [expr $ioBaseReg | (($ioLimitReg<<16) & 0xffff0000)]

    puts "nonPref : [format "0x%08x" $nonPrefValue]"
    puts "pref : [format "0x%08x" $prefMemValue]"
    puts "io : [format "0x%08x" $ioValue]"

    rp.cfg_wr 0x20 [format 0x%x $nonPrefValue] 
    rp.cfg_wr 0x24 [format 0x%x $prefMemValue]
    rp.cfg_wr 0x28 $prefMemBaseUpperReg 
    rp.cfg_wr 0x2C $prefMemLimitUpperReg
    rp.cfg_wr 0x30 $ioValue 
}

proc p2p.wr_blr {bus devicec func mem_pref_base mem_non_pref_base} {
    
    global BAR_IO_BASE    
    global BAR_IO_LIMIT     

    global num_of_bar_pref    
    global num_of_bar_non_pref    
    global NUM_OF_BAR_IO

    puts "pref base : [format "0x%08x" $mem_pref_base]"
    puts "pref limit : [format "0x%08x" $mem_non_pref_base]"
    puts "num : $num_of_bar_pref"

    if { $num_of_bar_pref > 0 } {
        # 32-bit
        set prefMemBaseReg  [expr ($mem_pref_base & 0xFFF00000) >> 16]
        set prefMemLimitReg [expr ($next_bar_pref_base & 0xFFF00000) >> 16]
        set prefMemValue    [expr $prefMemBaseReg | (($prefMemLimitReg<<16) & 0xffff0000)]
        set prefMemBaseUpperReg     0x0
        set prefMemLimitUpperReg    0x0  
    } else {
        set prefMemValue            0x0
        set prefMemBaseUpperReg     0x0   
        set prefMemLimitUpperReg    0x0  
    }
    
    if { $num_of_bar_non_pref > 0 } {
        set nonPrefBaseReg  [expr ($mem_non_pref_base & 0xFFF00000) >> 16]
        set nonPrefLimitReg [expr ($next_bar_non_pref_base & 0xFFF00000) >> 16]
        set nonPrefValue    [expr $nonPrefBaseReg | (($nonPrefLimitReg<<16) & 0xffff0000)]
    } else {
        set nonPrefValue    0x0
    }
    
    set ioBaseReg   0x0    
    set ioLimitReg  0x0
    set ioValue     [expr $ioBaseReg | (($ioLimitReg<<16) & 0xffff0000)]

    puts "nonPref : [format "0x%08x" $nonPrefValue]"
    puts "pref : [format "0x%08x" $prefMemValue]"
    puts "io : [format "0x%08x" $ioValue]"

    rp.cfg_wr 0x20 [format 0x%x $nonPrefValue] 
    rp.cfg_wr 0x24 [format 0x%x $prefMemValue]
    rp.cfg_wr 0x28 $prefMemBaseUpperReg 
    rp.cfg_wr 0x2C $prefMemLimitUpperReg
    rp.cfg_wr 0x30 $ioValue
}

proc rp.rd_blr { } {
    dprint 1 [rp.cfg_rd 0x20 ]
    dprint 1 [rp.cfg_rd 0x24 ]
    dprint 1 [rp.cfg_rd 0x28 ]
    dprint 1 [rp.cfg_rd 0x2C ]
    dprint 1 [rp.cfg_rd 0x30 ]
}

####################################################################
##################  System Application  ############################
####################################################################

proc sys.init { } {
    rp.rd_device_vendor_id
    rp.wr_status_command
    rp.pciecapstructure

    rp.set_link_retrain
    rp.set_link_retrain
    rp.get_link_status
        
    set final_subordinate_bus [rp.enumeration 1]

    #finally write actual subordinate bus number to RP's config space
    puts "Writing final subordinate bus for RP: $final_subordinate_bus"
    rp.wr_bdf $final_subordinate_bus  
    rp.wr_blr
    
    #ep.set_device_control 0x10 ; #relaxed ordering
    rp.set_device_control 0x5010 ; #relaxed ordering
    
}

proc sys.mem_test { {max_iter 10} {verbose 0} } {
    #global EP_BAR_BASES
    global BAR_PREF_BASE
    global next_bar_pref_base
    #global cur_bar
    global TXS_BASE
    global debug_level
    
    set wdata_list []
    set rdata_list []
    
    for {set addr 0} {$addr < $max_iter && $addr < $next_bar_pref_base} {incr addr} {
        #set bar_addr [lindex $EP_BAR_BASES $cur_bar]
        set mem_addr [expr $TXS_BASE + $BAR_PREF_BASE + $addr*4]
        #set mem_addr [expr $TXS_BASE + $bar_addr + $addr*4]
        set value [expr int([expr rand() * 4294967295])]
        master_write $mem_addr $value
        vprint "MemWr [format "0x%08x : 0x%08x" $mem_addr $value]"
        lappend wdata_list $value
    }
    
    for {set addr 0} {$addr < $max_iter && $addr < $next_bar_pref_base} {incr addr} {
        set mem_addr [expr $TXS_BASE + $BAR_PREF_BASE + $addr*4]
        #set mem_addr [expr $TXS_BASE + $bar_addr + $addr*4]
        set ret [master_read $mem_addr] 
        vprint "MemRd [format "0x%08x : 0x%08x" $mem_addr $ret]"
        lappend rdata_list $ret
    }
    
    set test_fail  0
    for {set addr 0} {$addr < $max_iter} {incr addr} {
        set w_val [expr int([lindex $wdata_list $addr])]
        set r_val [expr int([lindex $rdata_list $addr])]
        if { $w_val != $r_val } {
            puts "addr_offset : [format "0x%08x" [expr $addr * 4]] data mismatch [format "0x%08x - 0x%08x" $w_val $r_val]"
            incr test_fail 
        }
    }
    
    if { $test_fail != 0 } {
        puts "Memory Test failed : $test_fail"
    } else {
        puts "Memory Test Done : No error"
    }
    
        puts "RP CFG SPACE::::::::::::"
        rp.print_cfg_space
        set debug_level 0
        puts "EP CFG SPACE::::::::::::"
        ep.print_cfg_space 1 0 0
    
}

proc sys.run_test { } {
    sys.init
    sys.mem_test 10 1
}
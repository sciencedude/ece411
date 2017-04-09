onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp0_tb/clk
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_address
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/F/if_id.intr -radix hexadecimal} {/mp0_tb/dut/F/if_id.pc_out -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/F/if_id.intr {-height 16 -radix hexadecimal} /mp0_tb/dut/F/if_id.pc_out {-height 16 -radix hexadecimal}} /mp0_tb/dut/F/if_id
add wave -noupdate -radix hexadecimal /mp0_tb/dut/D/id_ex1
add wave -noupdate -radix hexadecimal /mp0_tb/dut/E/ex_mem_out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/mem_wb
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/cc_out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/branch_enable
add wave -noupdate -radix hexadecimal /mp0_tb/dut/D/REGFILE/data
add wave -noupdate /mp0_tb/dut/CA/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9218771 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 254
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {9050 ns} {10050 ns}

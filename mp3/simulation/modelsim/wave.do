onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp0_tb/clk
add wave -noupdate -height 15 /mp0_tb/pmem_resp
add wave -noupdate -height 15 /mp0_tb/pmem_rdata
add wave -noupdate -height 15 /mp0_tb/pmem_read
add wave -noupdate -height 15 /mp0_tb/pmem_write
add wave -noupdate -height 15 /mp0_tb/pmem_wdata
add wave -noupdate -height 15 /mp0_tb/pmem_address
add wave -noupdate -height 15 -expand -subitemconfig {{/mp0_tb/dut/D/REGFILE/data[7]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[6]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[5]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[4]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[3]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[2]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[1]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[0]} {-height 15}} /mp0_tb/dut/D/REGFILE/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {999336 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {999050 ps} {1000050 ps}

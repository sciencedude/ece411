onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp0_tb/clk
add wave -noupdate -height 15 /mp0_tb/pmem_resp
add wave -noupdate -height 15 /mp0_tb/pmem_rdata
add wave -noupdate -height 15 /mp0_tb/pmem_read
add wave -noupdate -height 15 /mp0_tb/pmem_write
add wave -noupdate -height 15 /mp0_tb/pmem_wdata
add wave -noupdate -height 15 /mp0_tb/pmem_address
add wave -noupdate -height 15 /mp0_tb/clk
add wave -noupdate -height 15 /mp0_tb/pmem_resp
add wave -noupdate -height 15 /mp0_tb/pmem_rdata
add wave -noupdate -height 15 /mp0_tb/pmem_read
add wave -noupdate -height 15 /mp0_tb/pmem_write
add wave -noupdate -height 15 /mp0_tb/pmem_wdata
add wave -noupdate -height 15 /mp0_tb/pmem_address
add wave -noupdate -height 15 -radix binary /mp0_tb/dut/D/opcode
add wave -noupdate -height 15 /mp0_tb/dut/F/pc_out
add wave -noupdate -height 15 -expand -subitemconfig {{/mp0_tb/dut/D/REGFILE/data[7]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[6]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[5]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[4]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[3]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[2]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[1]} {-height 15} {/mp0_tb/dut/D/REGFILE/data[0]} {-height 15}} /mp0_tb/dut/D/REGFILE/data
add wave -noupdate -height 15 /mp0_tb/dut/E/id_ex_out.control_signals.aluop
add wave -noupdate -height 15 /mp0_tb/dut/E/ALU/f
add wave -noupdate -height 15 /mp0_tb/dut/M/ex_mem.alu_out
add wave -noupdate -height 15 /mp0_tb/dut/M/mem_wb_out.alu_out
add wave -noupdate -height 15 /mp0_tb/dut/W/cc_mux/f
add wave -noupdate -height 15 /mp0_tb/dut/M/stall
add wave -noupdate -height 15 /mp0_tb/dut/M/mem_resp_d
add wave -noupdate -height 15 /mp0_tb/dut/D_cache/found
add wave -noupdate -height 15 -label pmem_resp_d /mp0_tb/dut/D_cache/pmem_resp
add wave -noupdate -height 15 -label {pmem_resp_i
} /mp0_tb/dut/I_cache/pmem_resp
add wave -noupdate -height 15 /mp0_tb/dut/CA/state
add wave -noupdate -height 15 /mp0_tb/dut/F/mem_resp_i
add wave -noupdate -height 15 -label mem_read_i /mp0_tb/dut/I_cache/mem_read
add wave -noupdate -height 15 /mp0_tb/dut/D_cache/mem_read
add wave -noupdate -height 15 -label state_i /mp0_tb/dut/I_cache/CC/state
add wave -noupdate -height 15 /mp0_tb/dut/D_cache/CC/state
add wave -noupdate -height 15 /mp0_tb/dut/M/ptr/rwmux_sel
add wave -noupdate -height 15 /mp0_tb/dut/F/intr
add wave -noupdate -height 15 /mp0_tb/dut/F/if_id.intr
add wave -noupdate -height 15 /mp0_tb/dut/D/id_ex.intr
add wave -noupdate -height 15 /mp0_tb/dut/M/ex_mem.intr
add wave -noupdate -height 15 /mp0_tb/dut/W/mem_wb.intr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1282555 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
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
WaveRestoreZoom {1221003 ps} {1351751 ps}

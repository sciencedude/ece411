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
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/D/id_ex1.control_signals -radix hexadecimal} {/mp0_tb/dut/D/id_ex1.pc_out -radix hexadecimal} {/mp0_tb/dut/D/id_ex1.srca_out -radix hexadecimal} {/mp0_tb/dut/D/id_ex1.srcb_out -radix hexadecimal} {/mp0_tb/dut/D/id_ex1.intr -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/D/id_ex1.control_signals {-height 16 -radix hexadecimal} /mp0_tb/dut/D/id_ex1.pc_out {-height 16 -radix hexadecimal} /mp0_tb/dut/D/id_ex1.srca_out {-height 16 -radix hexadecimal} /mp0_tb/dut/D/id_ex1.srcb_out {-height 16 -radix hexadecimal} /mp0_tb/dut/D/id_ex1.intr {-height 16 -radix hexadecimal}} /mp0_tb/dut/D/id_ex1
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/E/ex_mem_out.control_signals -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.pc_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.alu_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.srcb_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.intr -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/E/ex_mem_out.control_signals {-height 16 -radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.pc_out {-height 16 -radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.alu_out {-height 16 -radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.srcb_out {-height 16 -radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.intr {-height 16 -radix hexadecimal}} /mp0_tb/dut/E/ex_mem_out
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/W/mem_wb.control_signals -radix hexadecimal} {/mp0_tb/dut/W/mem_wb.mem_data -radix hexadecimal} {/mp0_tb/dut/W/mem_wb.pc_out -radix hexadecimal} {/mp0_tb/dut/W/mem_wb.alu_out -radix hexadecimal} {/mp0_tb/dut/W/mem_wb.intr -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/W/mem_wb.control_signals {-radix hexadecimal} /mp0_tb/dut/W/mem_wb.mem_data {-radix hexadecimal} /mp0_tb/dut/W/mem_wb.pc_out {-radix hexadecimal} /mp0_tb/dut/W/mem_wb.alu_out {-radix hexadecimal} /mp0_tb/dut/W/mem_wb.intr {-radix hexadecimal}} /mp0_tb/dut/W/mem_wb
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/cc_out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/branch_enable
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D/REGFILE/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[0]} -radix hexadecimal}} -subitemconfig {{/mp0_tb/dut/D/REGFILE/data[7]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[6]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[5]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[4]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[3]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[2]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[1]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[0]} {-height 16 -radix hexadecimal}} /mp0_tb/dut/D/REGFILE/data
add wave -noupdate /mp0_tb/dut/CA/state
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/trapvector/out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/c
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/f
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mem_rdata
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/address
add wave -noupdate /mp0_tb/dut/D_cache/CD/tag_0/data
add wave -noupdate /mp0_tb/dut/D_cache/CD/tag_1/data
add wave -noupdate /mp0_tb/dut/M/mem_read_d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/c
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/e
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/f
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/g
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/h
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mdr_mux/out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/c
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/F/pc_mux/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25725000 ps} 0}
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
WaveRestoreZoom {24950 ns} {25950 ns}

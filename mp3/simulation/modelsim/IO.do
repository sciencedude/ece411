onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp0_tb/clk
add wave -noupdate -radix hexadecimal /mp0_tb/physical_resp
add wave -noupdate -radix hexadecimal /mp0_tb/physical_rdata
add wave -noupdate -radix hexadecimal /mp0_tb/physical_read
add wave -noupdate -radix hexadecimal /mp0_tb/physical_write
add wave -noupdate -radix hexadecimal /mp0_tb/physical_wdata
add wave -noupdate -radix hexadecimal /mp0_tb/physical_address
add wave -noupdate -radix hexadecimal /mp0_tb/out
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D/REGFILE/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D/REGFILE/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp0_tb/dut/D/REGFILE/data[7]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[6]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[5]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[4]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[3]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[2]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[1]} {-height 16 -radix hexadecimal} {/mp0_tb/dut/D/REGFILE/data[0]} {-height 16 -radix hexadecimal}} /mp0_tb/dut/D/REGFILE/data
add wave -noupdate -radix hexadecimal /mp0_tb/dut/L2_cache/L2_c/actual_hits
add wave -noupdate -radix hexadecimal /mp0_tb/dut/L2_cache/L2_c/miss
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/c
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/e
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/f
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/g
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/h
add wave -noupdate -radix hexadecimal /mp0_tb/dut/I1/IO_mux/out
add wave -noupdate /mp0_tb/dut/I_cache/CC/state
add wave -noupdate /mp0_tb/dut/D_cache/CC/state
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/F/if_id.intr -radix hexadecimal} {/mp0_tb/dut/F/if_id.pc_out -radix hexadecimal} {/mp0_tb/dut/F/if_id.brpredict -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/F/if_id.intr {-radix hexadecimal} /mp0_tb/dut/F/if_id.pc_out {-radix hexadecimal} /mp0_tb/dut/F/if_id.brpredict {-radix hexadecimal}} /mp0_tb/dut/F/if_id
add wave -noupdate -radix hexadecimal /mp0_tb/dut/D_cache/mem_address
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/E/ex_mem_out.control_signals -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.pc_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.alu_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.srcb_out -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.intr -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.destreg -radix hexadecimal} {/mp0_tb/dut/E/ex_mem_out.brpredict -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/E/ex_mem_out.control_signals {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.pc_out {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.alu_out {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.srcb_out {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.intr {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.destreg {-radix hexadecimal} /mp0_tb/dut/E/ex_mem_out.brpredict {-radix hexadecimal}} /mp0_tb/dut/E/ex_mem_out
add wave -noupdate /mp0_tb/dut/D_cache/mem_read
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/c
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/d
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mar_mux/f
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mari_mux/sel
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mari_mux/a
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mari_mux/b
add wave -noupdate -radix hexadecimal /mp0_tb/dut/M/mari_mux/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {68175000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
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
WaveRestoreZoom {67960669 ps} {68984653 ps}

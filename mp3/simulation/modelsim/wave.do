onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp0_tb/clk
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp0_tb/pmem_address
add wave -noupdate -radix hexadecimal -childformat {{/mp0_tb/dut/F/if_id.intr -radix hexadecimal} {/mp0_tb/dut/F/if_id.pc_out -radix hexadecimal}} -expand -subitemconfig {/mp0_tb/dut/F/if_id.intr {-height 15 -radix hexadecimal} /mp0_tb/dut/F/if_id.pc_out {-height 15 -radix hexadecimal}} /mp0_tb/dut/F/if_id
add wave -noupdate -radix hexadecimal /mp0_tb/dut/D/id_ex1
add wave -noupdate -radix hexadecimal /mp0_tb/dut/E/ex_mem_out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/mem_wb
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/cc_out
add wave -noupdate -radix hexadecimal /mp0_tb/dut/W/branch_enable
add wave -noupdate -radix hexadecimal /mp0_tb/dut/D/REGFILE/data
add wave -noupdate /mp0_tb/dut/CA/state
add wave -noupdate /mp0_tb/dut/D_cache/CC/state
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp0_tb/dut/D_cache/CD/Dataarray_0/data[7]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[6]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[5]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[4]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[3]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[2]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[1]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_0/data[0]} {-height 15 -radix hexadecimal}} /mp0_tb/dut/D_cache/CD/Dataarray_0/data
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp0_tb/dut/D_cache/CD/Dataarray_1/data[7]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[6]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[5]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[4]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[3]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[2]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[1]} {-height 15 -radix hexadecimal} {/mp0_tb/dut/D_cache/CD/Dataarray_1/data[0]} {-height 15 -radix hexadecimal}} /mp0_tb/dut/D_cache/CD/Dataarray_1/data
add wave -noupdate /mp0_tb/dut/D_cache/CD/LRU_0/data
add wave -noupdate /mp0_tb/dut/D_cache/CD/Dataarray_0/write
add wave -noupdate /mp0_tb/dut/D_cache/CD/Dataarray_1/write
add wave -noupdate /mp0_tb/dut/D_cache/CD/cout_1
add wave -noupdate /mp0_tb/dut/D_cache/CD/cout_2
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D_cache/CD/tag_0/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_0/data[0]} -radix hexadecimal}} -subitemconfig {{/mp0_tb/dut/D_cache/CD/tag_0/data[7]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[6]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[5]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[4]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[3]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[2]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[1]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_0/data[0]} {-radix hexadecimal}} /mp0_tb/dut/D_cache/CD/tag_0/data
add wave -noupdate -radix hexadecimal -childformat {{{/mp0_tb/dut/D_cache/CD/tag_1/data[7]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[6]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[5]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[4]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[3]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[2]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[1]} -radix hexadecimal} {{/mp0_tb/dut/D_cache/CD/tag_1/data[0]} -radix hexadecimal}} -subitemconfig {{/mp0_tb/dut/D_cache/CD/tag_1/data[7]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[6]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[5]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[4]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[3]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[2]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[1]} {-radix hexadecimal} {/mp0_tb/dut/D_cache/CD/tag_1/data[0]} {-radix hexadecimal}} /mp0_tb/dut/D_cache/CD/tag_1/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4255000 ps} 0}
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
WaveRestoreZoom {3800 ns} {4800 ns}

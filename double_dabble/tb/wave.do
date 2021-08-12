onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /TB_bcd_7seg/BCD_TO_7SEG/in_Bin
add wave -noupdate -radix unsigned -childformat {{{/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[3]} -radix unsigned} {{/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[2]} -radix unsigned} {{/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[1]} -radix unsigned} {{/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[0]} -radix unsigned}} -subitemconfig {{/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[3]} {-radix unsigned} {/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[2]} {-radix unsigned} {/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[1]} {-radix unsigned} {/TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens[0]} {-radix unsigned}} /TB_bcd_7seg/BCD_TO_7SEG/OT/o_Tens
add wave -noupdate -radix unsigned /TB_bcd_7seg/BCD_TO_7SEG/OT/o_Ones
add wave -noupdate /TB_bcd_7seg/BCD_TO_7SEG/out_T
add wave -noupdate /TB_bcd_7seg/BCD_TO_7SEG/out_O
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {32 ps}

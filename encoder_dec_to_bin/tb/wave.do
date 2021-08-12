onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Khaki /tb_dec_to_bin/clk
add wave -noupdate -color Plum /tb_dec_to_bin/i_d1
add wave -noupdate -color Plum /tb_dec_to_bin/i_d2
add wave -noupdate -color Plum /tb_dec_to_bin/i_d3
add wave -noupdate -color Plum /tb_dec_to_bin/i_d4
add wave -noupdate -color Plum /tb_dec_to_bin/i_d5
add wave -noupdate -color Plum /tb_dec_to_bin/i_d6
add wave -noupdate -color Plum /tb_dec_to_bin/i_d7
add wave -noupdate -color White /tb_dec_to_bin/o_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25000 ps} 0}
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
WaveRestoreZoom {0 ps} {128 ns}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /project_colead_tb/TOP/clk
add wave -noupdate /project_colead_tb/TOP/rst
add wave -noupdate /project_colead_tb/TOP/i_add_sec
add wave -noupdate /project_colead_tb/TOP/i_add_min
add wave -noupdate /project_colead_tb/TOP/i_add_hr
add wave -noupdate /project_colead_tb/TOP/i_Sw_Clk
add wave -noupdate /project_colead_tb/TOP/i_Start_Stop
add wave -noupdate /project_colead_tb/TOP/i_reset
add wave -noupdate -divider CLK_SEC
add wave -noupdate /project_colead_tb/TOP/CLK_SEC/i_add
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CLK_SEC/r_count
add wave -noupdate /project_colead_tb/TOP/CLK_SEC/r_toogle
add wave -noupdate /project_colead_tb/TOP/CLK_SEC/o_ovf
add wave -noupdate -divider CLK_MIN
add wave -noupdate /project_colead_tb/TOP/CLK_MIN/i_add
add wave -noupdate /project_colead_tb/TOP/CLK_MIN/i_ena
add wave -noupdate /project_colead_tb/TOP/CLK_MIN/r_toogle
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CLK_MIN/o_count
add wave -noupdate /project_colead_tb/TOP/CLK_MIN/o_ovf
add wave -noupdate -divider CLK_MIN
add wave -noupdate /project_colead_tb/TOP/CLK_HR/i_add
add wave -noupdate /project_colead_tb/TOP/CLK_HR/i_ena
add wave -noupdate /project_colead_tb/TOP/CLK_HR/r_toogle
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CLK_HR/o_count
add wave -noupdate -divider STP-WTCH_SEC
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/i_reset
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/i_Sw_Clk
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/i_Start_Stop
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CNT_SW_SEC/r_count
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/r_ovf
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/r_toogle
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CNT_SW_SEC/o_count
add wave -noupdate /project_colead_tb/TOP/CNT_SW_SEC/o_ovf
add wave -noupdate -divider STP-WTCH_MIN
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/i_reset
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/i_Sw_Clk
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/i_Start_Stop
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/i_ena
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CNT_SW_MIN/r_count
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/r_toogle
add wave -noupdate -radix unsigned /project_colead_tb/TOP/CNT_SW_MIN/o_count
add wave -noupdate /project_colead_tb/TOP/CNT_SW_MIN/o_ovf
add wave -noupdate -divider MUX_MIN
add wave -noupdate /project_colead_tb/TOP/MUX_SEC_MIN/i_slc
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_SEC_MIN/i_data1
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_SEC_MIN/i_data2
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_SEC_MIN/o_out
add wave -noupdate -divider MUX_HR
add wave -noupdate /project_colead_tb/TOP/MUX_MIN_HR/i_slc
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_MIN_HR/i_data1
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_MIN_HR/i_data2
add wave -noupdate -radix unsigned /project_colead_tb/TOP/MUX_MIN_HR/o_out
add wave -noupdate -divider DD_0
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD0/i_Bin
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD0/o_Tens
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD0/o_Ones
add wave -noupdate -divider DD_1
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD1/i_Bin
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD1/o_Tens
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DD1/o_Ones
add wave -noupdate -divider BCD
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DISPLAY/i_v0
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DISPLAY/i_v1
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DISPLAY/i_v2
add wave -noupdate -radix unsigned /project_colead_tb/TOP/DISPLAY/i_v3
add wave -noupdate -divider OUTPUTS
add wave -noupdate /project_colead_tb/TOP/a
add wave -noupdate /project_colead_tb/TOP/b
add wave -noupdate /project_colead_tb/TOP/c
add wave -noupdate /project_colead_tb/TOP/d
add wave -noupdate /project_colead_tb/TOP/e
add wave -noupdate /project_colead_tb/TOP/f
add wave -noupdate /project_colead_tb/TOP/g
add wave -noupdate /project_colead_tb/TOP/an
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25448 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 114
configure wave -valuecolwidth 41
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
WaveRestoreZoom {23372 ps} {32898 ps}

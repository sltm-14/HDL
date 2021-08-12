onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUT
add wave -noupdate /tb_stpm_full/BOARD/i_Clk
add wave -noupdate /tb_stpm_full/BOARD/i_Rst
add wave -noupdate /tb_stpm_full/BOARD/i_Dir
add wave -noupdate -radix unsigned /tb_stpm_full/BOARD/i_En
add wave -noupdate -radix unsigned /tb_stpm_full/BOARD/i_Cycles
add wave -noupdate -expand -group MOTOR_1 -divider inputs
add wave -noupdate -expand -group MOTOR_1 /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/dir
add wave -noupdate -expand -group MOTOR_1 /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/en
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/i_Cycles
add wave -noupdate -expand -group MOTOR_1 -divider wires
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/dutyCycle_1
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/dutyCycle_2
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/presentState
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/nextState
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/stepCycles
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/changeState
add wave -noupdate -expand -group MOTOR_1 -divider outputs
add wave -noupdate -expand -group MOTOR_1 -radix unsigned -childformat {{{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[7]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[6]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[5]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[4]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[3]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[2]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[1]} -radix unsigned} {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[0]} -radix unsigned}} -subitemconfig {{/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[7]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[6]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[5]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[4]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[3]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[2]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[1]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA[0]} {-height 15 -radix unsigned}} /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outA
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outB
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outC
add wave -noupdate -expand -group MOTOR_1 -radix unsigned /tb_stpm_full/BOARD/STPM_0/MOTOR_SM/outD
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group MOTOR_2 -divider inputs
add wave -noupdate -expand -group MOTOR_2 /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/dir
add wave -noupdate -expand -group MOTOR_2 /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/en
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/i_Cycles
add wave -noupdate -expand -group MOTOR_2 -divider wires
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/dutyCycle_1
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/dutyCycle_2
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/presentState
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/nextState
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/stepCycles
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/changeState
add wave -noupdate -expand -group MOTOR_2 -divider outputs
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/outA
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/outB
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/outC
add wave -noupdate -expand -group MOTOR_2 -radix unsigned /tb_stpm_full/BOARD/STPM_1/MOTOR_SM/outD
add wave -noupdate -divider OUTPUT
add wave -noupdate -radix unsigned -childformat {{{/tb_stpm_full/BOARD/o_Pwm_a[3]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_a[2]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_a[1]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_a[0]} -radix unsigned}} -expand -subitemconfig {{/tb_stpm_full/BOARD/o_Pwm_a[3]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_a[2]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_a[1]} {-height 15 -radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_a[0]} {-height 15 -radix unsigned}} /tb_stpm_full/BOARD/o_Pwm_a
add wave -noupdate -radix unsigned -childformat {{{/tb_stpm_full/BOARD/o_Pwm_b[3]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_b[2]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_b[1]} -radix unsigned} {{/tb_stpm_full/BOARD/o_Pwm_b[0]} -radix unsigned}} -expand -subitemconfig {{/tb_stpm_full/BOARD/o_Pwm_b[3]} {-radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_b[2]} {-radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_b[1]} {-radix unsigned} {/tb_stpm_full/BOARD/o_Pwm_b[0]} {-radix unsigned}} /tb_stpm_full/BOARD/o_Pwm_b
add wave -noupdate /tb_stpm_full/BOARD/o_Pwm_c
add wave -noupdate /tb_stpm_full/BOARD/o_Pwm_d
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {35341 ps} 0}
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
WaveRestoreZoom {0 ps} {193312 ps}

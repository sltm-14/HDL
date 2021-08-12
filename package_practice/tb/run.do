if [file exists work] {vdel -all}
vlib work
vlog -f files.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.tb_ff_d 
do wave.do
run 130ns

vlib work
vlog D_FF.v D_FF_ASYNC.v DSP_Project.v DSP_Project_TB.v
vsim -voptargs=+acc work.DSP_Project_TB
add wave *
run -all
#quit -sim


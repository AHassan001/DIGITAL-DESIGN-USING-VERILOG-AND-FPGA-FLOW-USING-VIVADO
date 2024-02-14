vlib work
vlog D_FF_A_L.v Four_Bit_Ripple_Counter.v Four_Bit_Ripple_Counter_TB.v
vsim -voptargs=+acc work.Four_Bit_Ripple_Counter_TB
add wave *
run -all
//#quit -sim
#!/bin/sh
vvp -n sim/sim.out
gtkwave sim/testbench.vcd

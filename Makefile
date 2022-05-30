
include config.mk

SRC = ${SRCDIR}/counter.v ${SRCDIR}/decoder.v ${SRCDIR}/mux81.v ${SRCDIR}/testbench.v ${SRCDIR}/toplevel.v

all: options circuit

options:
	@echo Build options:
	@echo "CFLAGS = ${CFLAGS}"
	@echo "CC = ${CC}"

circuit:
	${CC} ${CFLAGS} -o ${SIMDIR}/sim.out ${SRC}

clean:
	rm -f ${SIMDIR}/sim.out
	rm -f ${SIMDIR}/testbench.vcd

simulate:
	./simulation.sh

.PHONY: all options circuit clean simulate

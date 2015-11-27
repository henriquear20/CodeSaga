# ============================================================================
# Name        : Makefile
# Author      : 
# Version     :
# Copyright   : Your copyright notice
# Description : Makefile for Hello MPI World in Fortran
# ============================================================================

.PHONY: all clean

all: src/teste.f90
	mpif90 -O2 -g -o bin/teste.exe \
		src/teste.f90

clean:
	rm -f bin/teste.exe *.mod

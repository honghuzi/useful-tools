HOME=/usr/local
FC = ifort

#platform = my
platform = cngrid

ifeq ($(platform), cngrid)
	MKL_PATH=/public/software/compiler/mkl
else
	MKL_PATH=/opt/intel/mkl
endif

MKL_IN_PATH=-I$(MKL_PATH)/include
MKL_LIB_PATH=-L$(MKL_PATH)/lib/intel64
INC = -I/usr/include  -I/usr/local/include -I$(HOME)/include $(MKL_IN_PATH)
# library paths
LDPATH = -L$(HOME)/lib  $(MKL_LIB_PATH)

# library linking
MKL_LIB=-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core
LIBS = $(MKL_LIB)  -lpthread  #-lm
# optimization
OP= -parallel  -O3

all: runtdse

runtdse: const.o functions.o vectors.o laser.o tdse.f90 ground.f90 propagate.f90 analysis.f90
	$(FC) $(LDPATH) $(OP) $(LIBS) -o $@ $^

.SUFFIXES: .f90 .o .x

.f90.o:
	$(FC)  $(INC) -c $*.f90

# .o.x:
# 	$(FC) $(LDPATH) -o $*.x $*.o $(LIBS)

clean:
	rm -f  *.o *.mod *.x po pe err output

run:
	nohup ./runtdse 1>output 2>err&

.PHONY: clean all

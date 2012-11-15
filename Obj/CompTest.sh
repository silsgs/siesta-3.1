#!/bin/sh

pgf95 -acc -Minfo -fast -g -c ../Src/testpoison.F -I/usr/local/cuda/include -o ./testpoison.o
pgf95 -acc -Minfo -fast -g -c ../Src/poison.F -o ./poison.o
pgf95 -acc -Minfo -fast -g -c ../Src/poison_orig.F -o ./poison_orig.o

pgf95  testpoison.o poison.o poison_orig.o timer.o precision.o parallel.o sys.o alloc.o fft3d.o parallelsubs.o schecomm.o domain_decom.o spatial.o qsort.o io.o mmio.o sparse_matrices.o printmatrix.o pspltm1.o volcel.o reclat.o m_walltime.o lenstr.o pxf.o memory.o minvec.o sorting.o memoryinfo.o chkgmx.o -L$PWD/fdf -L$PWD/SiestaXC -lfdf -Mcuda -lblas -o testpoison

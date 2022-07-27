SHELL=/bin/sh
##
# Use:
# make -f makefile_name
# 
# Or from command line:
# ifort -O2 -assume byterecl -o read_satdump_VIIRS_91.x read_satdump_VIIRS_91.o [continues on next line]
# -L/scratch2/NCEPDEV/nwprod/NCEPLIBS/compilers/intel/18.0.5.274/lib $BUFR_LIB4 $W3NCO_LIB4 $W3EMC_LIB4
# 
# Prior to that command: 
# module load bufr | module load w3emc | module load w3nco
# module list - to see which /compilers/intel/ version is loaded and to point to
# module show bufr | moduel show w3emc | module show w3nco will show the path to the /compilers and /lib 
#
.SUFFIXES: .f
OBJS=chkdat.o
CMD=chkdat.x

FC=ftn #ifort
# ZEUS
# CORELIB=/contrib/nceplibs/nwprod/lib
# THEIA
# CORELIB=/scratch3/NCEPDEV/nwprod/lib
# HERA
CORELIB=/apps/ops/prod/libs/

#THEIA
#LIBS = -L$(CORELIB) -lw3nco_4 -lw3emc_4 -lbufr_4_64

#HERA
#LIBS= -L$(CORELIB)   #it seems to work w.out w3nco and w3emc !! 
#OR:
LIBS= -L$(CORELIB) $(BUFR_LIB4) $(W3EMC_LIB4) $(W3NCO_LIB4)

FFLAGS = -O2 -assume byterecl
LDFLAGS =

$(CMD):         $(OBJS)
		$(FC) $(LDFLAGS) ${FFLAGS} -o $(@) $(OBJS) ${LIBS}

clean:
		-rm -f *.o ${CMD}
clobber:	clean
		-rm -f $(CMD) $(CMD).prof
void:		clobber
		-rm -f $(SRCS)
.f.o:
		${FC} -c ${FFLAGS} $*.f
#.f90.o:
#        ${FC} -c ${FFLAGS} $*.f90

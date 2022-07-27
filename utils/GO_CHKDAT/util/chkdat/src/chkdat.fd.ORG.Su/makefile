# Makefile -  4 Apr 2020
# 
#  4 Dec 2019 - cp'd fr tide ver of 15 Jun 2016 ; 
#               mod'd for port to Dells/phase3
#  4 Apr 2020 - added rules for chkdat_x (external btab)
#----
CMD	= chkdat.x

FC = ifort
#LDFLAGS = -Xlinker -t
#LDFLAGS = -Xlinker -M
LIBS = $(W3NCO_LIB4) $(BUFR_LIB4)

#DEBUG =                -g -traceback
#DEBUG2 =        -ftrapuv  -check all  -fp-stack-check  -fstack-protector
#FFLAGS = -O2 $(DEBUG) $(DEBUG2)
FFLAGS = 

LIBS = $(BUFR_LIB4) $(W3EMC_LIB4) $(W3NCO_LIB4)

SRCS	= chkdat.f 
OBJS	= $(SRCS:.f=.o) 

all:	$(CMD)

$(CMD):	$(OBJS)
	$(FC) $(LDFLAGS) -o $(@) $(OBJS) $(LIBS)
	rm -f $(OBJS)

chkdat_x.x:	chkdat_x.o
	$(FC) $(LDFLAGS) -o $(@) chkdat_x.o $(LIBS)
	rm -f chkdat_x.o

.PHONY: clean clobber void install
clean:
	-rm -f $(OBJS) xref.db *.lst *.mod

clobber:	clean
	-rm -f $(CMD)

void:	clobber
	-rm -f $(SRCS) makefile

install:
	mv $(CMD) ../../exec/


# -- end of Makefile

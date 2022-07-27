# Makefile - 14 Jun 2016
# 
# 20 Nov 2008 - original makefile
#  3 Oct 2012 - added chkdat_x support;
#               set BLIB to latest ver (10.1.0)
#  7 Nov 2012 - config'd for Linux (wcoss)
# 14 Jun 2016 - updated LIBS to phase2 latest ver
#----
PROG	= chkdat
PROG_S	= chkdat_s
PROG_X  = chkdat_x

# WCOSS/Linux setttings
FC	= ifort
FFLAGS	= 
LDFLAGS	= 

# (old) pre-phase2 libs
#LIBS	= -L/nwprod/lib -lbufr_v10.2.0_4_64 -lw3emc_v2.0.3_4 -lw3nco_v2.0.3_4 -lw3emc_v2.0.3_4

W3ELIB	= /nwprod2/lib/w3emc/v2.2.0/libw3emc_v2.2.0_4.a
W3NLIB	= /nwprod2/lib/w3nco/v2.0.6/libw3nco_v2.0.6_4.a
BLIB	= /nwprod2/lib/bufr/v11.1.0/libbufr_v11.1.0_4_64.a
LIBS	= $(BLIB) $(W3ELIB) $(W3NLIB)

# (old) IBM/AIX settings
###FC	= xlf
###FFLAGS	= 
###LDFLAGS	= 
#LIBS	= /nwprod/bufrlib90/bufrlib_4 /nwprod/w3lib90/w3lib_4
#LIBS	= -L/nwprod/lib -lbufr_v10.1.0_4_64 -lw3_4
###LIBS_S	= -L/nwprod/lib -lbufr_v10.1.0_s_64 -lw3_4

SRCS	= $(PROG).f 
OBJS	= $(SRCS:.f=.o) 

$(PROG):  $(SRCS) $(OBJS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(PROG).x $(OBJS) $(LIBS)
	rm -f $(OBJS)

$(PROG_S):  $(SRCS) $(OBJS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(PROG_S).x $(OBJS) $(LIBS_S)
	rm -f $(OBJS)

$(PROG_X):  chkdat_x.o
	$(FC) $(FFLAGS) $(LDFLAGS) -o chkdat_x.x chkdat_x.o $(LIBS)
	/bin/rm -f chkdat_x.o
	rm -f $(OBJS)

# -- end of Makefile

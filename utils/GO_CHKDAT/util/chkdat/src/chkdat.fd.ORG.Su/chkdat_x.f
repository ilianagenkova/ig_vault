      program chkdat
c --Reports info on date range of msgs in Bufr file
c mods: 
c  24 Sep 2002 JAW Skip dummy msgs; detail print option
c  18 Mar 2004 JAW enable report of multi mesg types
c   3 May 2004 JAW enabled targeted dates (itarget)
c  20 Nov 2008 JAW added line for writing rpts/msg
c   2 Oct 2012 JAW requires external bufrtable spec (lundx)
c   4 Apr 2020 JAW trapped overlarge nrep in formats
c                  sych'd w/ chkdat.f updates
c
      implicit none

      integer nmsub, nsub, msub, ireadmg, iymdh, irdt
      integer i4dy, iodt, ireadsb, nlev, nrep, idtmin, idtmax
      integer nmsg, lunin, lundx, msgt

      integer     i, iargc,narg, itarget, nmsgtot
      character*1 copt
    
      character*8  cstr, ctyp, answer
      character*40 odstr, rdstr
      real*8       odt(4),rdt(4)

c     itarget=040420
      itarget=0

      narg=iargc()
      i=1
      do while (i .le. narg) 
        call getarg(i,cstr)
        if (cstr(1:1) .eq. '-') then
          copt=cstr(2:2)
          if (copt .eq. 'd') then 
            i=i+1
            call getarg(i,cstr)
            if (copt .eq. 'd') then
              read(cstr,*) itarget
              itarget = mod(itarget,100000)     ! goes w/ DATELEN(8)
            endif
          else
            write(*,*) "invalid option '",copt,"' - exiting"
            stop
          endif ! copt
        endif ! cstr(1:1)
        i=i+1
      enddo

      lunin = 20
      lundx = 21
      OPEN(LUNIN,FORM='UNFORMATTED')
      call MESGBF(lunin,msgt)                         ! skips table msgs
      call OPENBF(lunin,'IN',lundx)

      call DATELEN( 8)                          ! set dates to 8-digit

c --READ MSGS, COUNTING NUMBERS & CHECKING DATES
      nmsgtot = 0
      nmsg = 0
      ctyp = 'startup '

      do while (iREADMG(lunin,cstr,iymdh) .eq. 0)
        msub = nmsub(lunin)
        if ( msub .gt. 0 ) then 

         nmsgtot = nmsgtot + 1
         if ( itarget .eq. 0 .or. itarget .eq. iymdh/100 ) then 

          if ( cstr .ne. ctyp ) then    ! new message type

            if ( nmsg .ne. 0 ) then
              if (nrep.lt.1d7) then
                write(*,7) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
              else if (nrep.lt.1d8) then
                write(*,8) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
              else 
                write(*,9) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
              endif
            endif ! nmsg ne 0

            ctyp = cstr
            nmsg = 1
            nrep = msub
            idtmin=iymdh
            idtmax=iymdh

          else
            nmsg = nmsg + 1                               ! # of msgs

              nrep = nrep + nmsub(lunin)                    ! # of reports

              if ( iymdh .lt. idtmin ) idtmin = iymdh
              if ( iymdh .gt. idtmax ) idtmax = iymdh

          endif ! cstr != ctyp
         endif ! itarget = this day

        endif ! msub > 0

c write out # of subsets/reports per message
cccc    write(*,'(8x,i8," rpts",i7," msgs",i7)') nrep,nmsg,nmsub(lunin)

      enddo ! while iREADMG

      if (nrep.lt.1d7) then
        write(*,7) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
      else if (nrep.lt.1d8) then
        write(*,8) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
      else 
        write(*,9) ctyp, nrep, nmsg, I4DY(idtmin), I4DY(idtmax)
      endif

 7    format(a8,1x,i7,' rpts',i8,' msgs   date range:',2i11.10)
 8    format(a8,1x,i8,' rpts',i8,' msgs   date range:',2i11.10)
 9    format(a8,1x,i9,' rpts',i8,' msgs   date range:',2i11.10)

      stop
      end

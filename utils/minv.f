C-----------------------------------------------------------------------
C-----------------------------------------------------------------------
      PROGRAM MINV
 
      PARAMETER (MAXSUB=100)
 
      CHARACTER*200 FILE   
      CHARACTER*8   SUBSET
      CHARACTER*8   SUB(MAXSUB)
      integer       NINV(3,MAXSUB)
      integer       mindate(maxsub),maxdate(maxsub)
      integer       minminu(maxsub),maxminu(maxsub)
      logical       exist
      real(8)       minu
 
      DATA BMISS  /10E10/
      DATA LUNBF  /20/
 
C-----------------------------------------------------------------------
      nmbyt(lunit) = iupvs01(lunit,'LENM')
C-----------------------------------------------------------------------
 
      NINV = 0
      NSUB = 0
      mindate=2100000000
      maxdate=0000000000
      minminu=60
      maxminu=00

C  GET AND OPEN THE INPUT FILENAME
C  -------------------------------

      call getarg(1,file)
      file = TRIM(file)//CHAR(0)
      inquire(file=file,exist=exist)
      if (.not.exist) call bort(trim(file)//' does not exist')
      open(lunbf,file=file,form='unformatted')
      call datelen(10)
 
C  COMPUTE AN MESSAGE INVENTORY BY SUBSETS
C  ---------------------------------------
 
      CALL OPENBF(LUNBF,'IN',LUNBF)
      DO WHILE(IREADMG(LUNBF,SUBSET,IDATE).EQ.0)
      ISUB = 0
      DO I=1,NSUB
      IF(SUBSET.EQ.SUB(I)) ISUB = I
      ENDDO
      IF(ISUB.EQ.0) THEN
         IF(NSUB+1.GT.MAXSUB) CALL BORT('NSUB TOO BIG')
         SUB(NSUB+1) = SUBSET
         NSUB = NSUB+1
         ISUB = NSUB
      ENDIF
      NINV(1,ISUB) = NINV(1,ISUB)+1
      NINV(2,ISUB) = NINV(2,ISUB)+NMSUB(LUNBF)
      NINV(3,ISUB) = NINV(3,ISUB)+NMBYT(LUNBF)

      if(idate<mindate(isub)) mindate(isub)=idate
      if(idate>maxdate(isub)) maxdate(isub)=idate

      do while(ireadsb(lunbf,iret)==0)
      call ufbint(lunbf,minu,1,1,iret,'MINU')
      minut=nint(minu)
      if(minut<minminu(isub)) minminu(isub)=minut
      if(minut>maxminu(isub)) maxminu(isub)=minut
      enddo

      ENDDO

C  PRINT THE INVEBTORY
C  -------------------
 
      PRINT*
      PRINT'(a4,6x,3(a10,4x))','type','messages','subsets','date range'
      PRINT*
      DO J=1,NSUB
      PRINT1,SUB(J),(NINV(I,J),I=1,2),
     .       mindate(j),minminu(j),
     .       maxdate(j),maxminu(j)
1     format(A8,2X,2(I10,4X),2(i10,i2.2,2x))
      ENDDO

      end program 

  program temp_readmp
  character(200) file
  character*8 subset
  CHARACTER*40 hstr
  real(8) gcrchn,tab(3,200000)
  integer i_big
  real(8)    said_old
  logical exist
  real(8)       hdr(2,2)

  DATA hstr/'SAID YEAR '/

  iret=isetprm('MAXSS',1500000)

! Jack Woolen - test incoming NESDIS bufr files
! check if file exists, then open it, else abort
  call getarg(1,file)
  file = trim(adjustl(file))
  inquire(file=file,exist=exist)
  if (.not.exist) call bort(trim(file)//' does not exist')
  open(20,file=file,form='unformatted')

  said_old=12345.0
  call openbf(20,'IN',20)
  do while(ireadmg(20,subset,idate).eq.0)
  do while(ireadsb(20).eq.0)
  i_big=i_big+1
  !call ufbcnt(20,irec,isub)
  !call ufbint(20,GCRCHN,1,1,iret,'{GCRCHN}');
  
  !print *, said_old
  !print *, '_____'
  CALL UFBINT(20,hdr,2,1,iret,hstr)
  !call ufbint(20,SAID,1,1,iret," SAID ");
  ! print *,'said= ', SAID
  !print *, hdr(1,1)
  if(hdr(1,1) /= said_old)  print *,'SAID= ', hdr(1,1)
  if(hdr(1,1) /= said_old) then
          said_old = hdr(1,1)
  end if 

  !print *, 'said_old', said_old
  enddo
  enddo
  print *, 'i_big = ', i_big
  end program

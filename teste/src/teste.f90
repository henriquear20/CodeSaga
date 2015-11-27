! ============================================================================
! Name        : teste.f90
! Author      : 
! Version     :
! Copyright   : Your copyright notice
! Description : Hello MPI World in Fortran
! ============================================================================

use mpi
implicit none

integer, parameter :: LEN = 100               ! message length

integer            :: ierror                  ! error code
integer            :: my_rank                 ! rank of process
integer            :: p                       ! number of processes
integer            :: source                  ! rank of sender
integer            :: dest                    ! rank of receiver
integer            :: tag                     ! tag for messages
character(len=LEN) :: message                 ! storage for message
integer            :: status(MPI_STATUS_SIZE) ! return status for receive

tag = 0

! start up MPI

call MPI_Init(ierror)

! find out process rank
call MPI_Comm_rank(MPI_COMM_WORLD, my_rank, ierror)

! find out number of processes
call MPI_Comm_size(MPI_COMM_WORLD, p, ierror)


if (my_rank .ne. 0) then
    ! create message
    write (message, *) "Hello MPI Pi World from process ", my_rank
    dest = 0
    call MPI_Send(message, LEN, MPI_CHARACTER, &
            dest, tag, MPI_COMM_WORLD, ierror)
else
    print *, "Hello MPI Pi World From process 0: Num processes: ", p
    do source = 1, p-1
        call MPI_Recv(message, LEN, MPI_CHARACTER, source, tag, &
                MPI_COMM_WORLD, status, ierror)
        print *, message
    end do
end if

! shut down MPI
call MPI_Finalize(ierror)

stop
end program

program macro
    use ymmsl
    use libmuscle
    implicit none

    real (selected_real_kind(15)) :: t_cur, t_next, t_max, dt
    real (selected_real_kind(15)) :: a, b, s

    type(LIBMUSCLE_PortsDescription) :: ports
    type(LIBMUSCLE_Instance) :: instance

    type(LIBMUSCLE_Message) :: rmsg
    type(LIBMUSCLE_DataConstRef) :: rdata

    type(LIBMUSCLE_Message) :: smsg
    type(LIBMUSCLE_Data) :: sdata

    write(*,*) "Starting adder Fortran macro actor"
    
    ports = LIBMUSCLE_PortsDescription_create()
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_O_I, 'state_out')
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_S, 'state_in')
    instance = LIBMUSCLE_Instance_create(ports)
    call LIBMUSCLE_PortsDescription_free(ports)

    do while (LIBMUSCLE_Instance_reuse_instance(instance))
        ! F_INIT
        t_max = LIBMUSCLE_Instance_get_setting_as_real8(instance, 't_max')
        dt = LIBMUSCLE_Instance_get_setting_as_real8(instance, 'dt')

        t_cur = 0.0
        do while (t_cur + dt <= t_max)
            ! O_I
            t_next = t_cur + dt

            ! Send two random numbers to the micro model
            call random_number(a)
            call random_number(b)

            sdata = LIBMUSCLE_Data_create_nils(2_LIBMUSCLE_size)
            call LIBMUSCLE_Data_set_item(sdata, 1_LIBMUSCLE_size, a)
            call LIBMUSCLE_Data_set_item(sdata, 2_LIBMUSCLE_size, b)
  
            smsg = LIBMUSCLE_Message_create(t_cur, sdata)
            if (t_next + dt <= t_max) then
                call LIBMUSCLE_Message_set_next_timestamp(smsg, t_next)
            end if
            call LIBMUSCLE_Instance_send(instance, 'state_out', smsg)
            call LIBMUSCLE_Message_free(smsg)
            call LIBMUSCLE_Data_free(sdata)

            ! S
            ! Receive the sum from the micro model
            rmsg = LIBMUSCLE_Instance_receive(instance, 'state_in')
            rdata = LIBMUSCLE_Message_get_data(rmsg)

            s = LIBMUSCLE_DataConstRef_as_real8(rdata)
            call LIBMUSCLE_DataConstRef_free(rdata)
            if (abs(a + b - s) > 1e-10) then
                call LIBMUSCLE_Instance_error_shutdown(instance, "Received unexpected message")
                call exit(1)
            end if

            t_cur = t_cur + dt
        end do

    end do

end program macro

program micro
    use ymmsl
    use libmuscle
    implicit none

    real (selected_real_kind(15)) :: t_cur
    real (selected_real_kind(15)) :: a, b, s

    type(LIBMUSCLE_PortsDescription) :: ports
    type(LIBMUSCLE_Instance) :: instance

    type(LIBMUSCLE_Message) :: rmsg
    type(LIBMUSCLE_DataConstRef) :: rdata, ritem

    type(LIBMUSCLE_Message) :: smsg
    type(LIBMUSCLE_Data) :: sdata

    write(*,*) "Starting adder Fortran micro actor"
    
    ports = LIBMUSCLE_PortsDescription_create()
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_F_INIT, 'initial_state')
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_O_F, 'final_state')
    instance = LIBMUSCLE_Instance_create(ports)
    call LIBMUSCLE_PortsDescription_free(ports)

    do while (LIBMUSCLE_Instance_reuse_instance(instance))
        ! F_INIT
        rmsg = LIBMUSCLE_Instance_receive(instance, 'initial_state')
        rdata = LIBMUSCLE_Message_get_data(rmsg);

        ritem = LIBMUSCLE_DataConstRef_get_item(rdata, 1_LIBMUSCLE_size)
        a = LIBMUSCLE_DataConstRef_as_real8(ritem)
        call LIBMUSCLE_DataConstRef_free(ritem)

        ritem = LIBMUSCLE_DataConstRef_get_item(rdata, 2_LIBMUSCLE_size)
        b = LIBMUSCLE_DataConstRef_as_real8(ritem)
        call LIBMUSCLE_DataConstRef_free(ritem)
        call LIBMUSCLE_DataConstRef_free(rdata)

        t_cur = LIBMUSCLE_Message_timestamp(rmsg)
        call LIBMUSCLE_Message_free(rmsg)

        ! This is a simple function and no time integration is required
        ! Calculate the sum of a and b and send back as final_state
        s = a + b

        ! O_F
        ! we are a micro model and should send to macro
        sdata = LIBMUSCLE_Data_create(s)
        smsg = LIBMUSCLE_Message_create(t_cur, sdata)
        call LIBMUSCLE_Instance_send(instance, 'final_state', smsg)
        call LIBMUSCLE_Message_free(smsg)
        call LIBMUSCLE_Data_free(sdata)
        
    end do

end program micro

program helloworld
    use ids_routines
    use ymmsl
    use libmuscle
    implicit none

    type(ids_workflow) :: workflow
    real (selected_real_kind(15)) :: t_cur, t_next, t_max, dt
    character(len=1), dimension(:), allocatable :: serialized_ids

    type(LIBMUSCLE_PortsDescription) :: ports
    type(LIBMUSCLE_Instance) :: instance

    type(LIBMUSCLE_Message) :: rmsg
    type(LIBMUSCLE_DataConstRef) :: rdata

    type(LIBMUSCLE_Message) :: smsg
    type(LIBMUSCLE_Data) :: sdata

    write(*,*) "Starting helloworld Fortran actor"
    
    ports = LIBMUSCLE_PortsDescription_create()
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_F_INIT, 'initial_workflow_in')
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_O_I, 'workflow_out')
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_S, 'workflow_in')
    call LIBMUSCLE_PortsDescription_add(ports, YMMSL_OPERATOR_O_F, 'final_workflow_out')
    instance = LIBMUSCLE_Instance_create(ports)
    call LIBMUSCLE_PortsDescription_free(ports)

    do while (LIBMUSCLE_Instance_reuse_instance(instance))
        ! F_INIT
        t_max = LIBMUSCLE_Instance_get_setting_as_real8(instance, 't_max')
        dt = LIBMUSCLE_Instance_get_setting_as_real8(instance, 'dt')

        if (LIBMUSCLE_Instance_is_connected(instance, 'initial_workflow_in')) then
            ! we are the micro-model and should receive from macro
            rmsg = LIBMUSCLE_Instance_receive(instance, 'initial_workflow_in')
            rdata = LIBMUSCLE_Message_get_data(rmsg);

            allocate(serialized_ids(LIBMUSCLE_DataConstRef_size(rdata)))
            call LIBMUSCLE_DataConstRef_as_byte_array(rdata, serialized_ids)
            call LIBMUSCLE_DataConstRef_free(rdata)

            ! deserialize and verify received IDS
            call ids_deserialize(serialized_ids, workflow)
            deallocate(serialized_ids)
            if (.not. associated(workflow%ids_properties%comment) .or. .not. associated(workflow%code%name)) then
                write(*,*) "F_INIT received unexpected IDS. Fields missing: comment: ", associated(workflow%ids_properties%comment), " name: ", associated(workflow%code%name)
                call LIBMUSCLE_Instance_error_shutdown(instance, "Received unexpected message")
                call exit(1)
            end if
            if (workflow%ids_properties%comment(1) .eq. "Hello world!") then
                write(*,*) "F_INIT received '", trim(workflow%ids_properties%comment(1)), "' from '", trim(workflow%code%name(1)), "'"
            else
                write(*,*) "ERROR: F_INIT was expecting 'Hello world!' but received '", trim(workflow%ids_properties%comment(1)), "' from '", trim(workflow%code%name(1)), "'"
                call LIBMUSCLE_Instance_error_shutdown(instance, "Received unexpected message")
                call exit(1)
            end if
            call ids_deallocate(workflow)
            
            if (LIBMUSCLE_Message_has_next_timestamp(rmsg)) then
                t_max = LIBMUSCLE_Message_next_timestamp(rmsg)
            end if
            call LIBMUSCLE_Message_free(rmsg)
        end if

        t_cur = 0.0
        do while (t_cur + dt <= t_max)
            ! O_I
            t_next = t_cur + dt
            if (LIBMUSCLE_Instance_is_connected(instance, 'workflow_out')) then
                ! we are a macro model and should send to micro
                allocate(workflow%ids_properties%comment(1))
                workflow%ids_properties%comment(1) = 'Hello world!'
                workflow%ids_properties%homogeneous_time = IDS_TIME_MODE_INDEPENDENT
                allocate(workflow%code%name(1))
                workflow%code%name = 'HelloWorld Actor in Fortran'
                call ids_serialize(workflow, serialized_ids)
                call ids_deallocate(workflow)

                sdata = LIBMUSCLE_Data_create_byte_array(serialized_ids)
                
                smsg = LIBMUSCLE_Message_create(t_cur, sdata)
                if (t_next + dt <= t_max) then
                    call LIBMUSCLE_Message_set_next_timestamp(smsg, t_next)
                end if
                call LIBMUSCLE_Instance_send(instance, 'workflow_out', smsg)
                call LIBMUSCLE_Message_free(smsg)
                call LIBMUSCLE_Data_free(sdata)
                deallocate(serialized_ids)
            end if

            ! S
            if (LIBMUSCLE_Instance_is_connected(instance, 'workflow_in')) then
                ! we are the macro-model and should receive from micro
                rmsg = LIBMUSCLE_Instance_receive(instance, 'workflow_in')
                rdata = LIBMUSCLE_Message_get_data(rmsg);
    
                allocate(serialized_ids(LIBMUSCLE_DataConstRef_size(rdata)))
                call LIBMUSCLE_DataConstRef_as_byte_array(rdata, serialized_ids)
                call LIBMUSCLE_DataConstRef_free(rdata)
    
                ! deserialize and verify received IDS
                call ids_deserialize(serialized_ids, workflow)
                deallocate(serialized_ids)
                if (.not. associated(workflow%ids_properties%comment) .or. .not. associated(workflow%code%name)) then
                    write(*,*) "S received unexpected IDS. Fields missing: comment: ", associated(workflow%ids_properties%comment), " name: ", associated(workflow%code%name)
                    call LIBMUSCLE_Instance_error_shutdown(instance, "Received unexpected message")
                    call exit(1)
                end if
                if (workflow%ids_properties%comment(1) .eq. "Hello world!") then
                    write(*,*) "S received '", trim(workflow%ids_properties%comment(1)), "' from '", trim(workflow%code%name(1)), "'"
                else
                    write(*,*) "ERROR: S was expecting 'Hello world!' but received '", trim(workflow%ids_properties%comment(1)), "' from '", trim(workflow%code%name(1)), "'"
                    call LIBMUSCLE_Instance_error_shutdown(instance, "Received unexpected message")
                    call exit(1)
                end if
                call ids_deallocate(workflow)
                
                if (LIBMUSCLE_Message_has_next_timestamp(rmsg)) then
                    t_max = LIBMUSCLE_Message_next_timestamp(rmsg)
                end if
                call LIBMUSCLE_Message_free(rmsg)
            end if

            ! a simulation would actually update something here, but we're just saying
            ! hi to connected actors and don't do anything else
            t_cur = t_cur + dt
        end do

        ! O_F
        if (LIBMUSCLE_Instance_is_connected(instance, 'final_workflow_out')) then
            ! we are a micro model and should send to macro
            allocate(workflow%ids_properties%comment(1))
            workflow%ids_properties%comment(1) = 'Hello world!'
            workflow%ids_properties%homogeneous_time = IDS_TIME_MODE_INDEPENDENT
            allocate(workflow%code%name(1))
            workflow%code%name = 'HelloWorld Actor in Fortran'
            call ids_serialize(workflow, serialized_ids)
            call ids_deallocate(workflow)

            sdata = LIBMUSCLE_Data_create_byte_array(serialized_ids)
            
            smsg = LIBMUSCLE_Message_create(t_cur, sdata)
            call LIBMUSCLE_Instance_send(instance, 'final_workflow_out', smsg)
            call LIBMUSCLE_Message_free(smsg)
            call LIBMUSCLE_Data_free(sdata)
            deallocate(serialized_ids)
        end if

    end do

end program helloworld
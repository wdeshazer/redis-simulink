# Hello world persistent actor in Python

import sys
import logging
import itertools

# IMAS imports
import imas
from imas.imasdef import IDS_TIME_MODE_INDEPENDENT

try:
    from imas.imasdef import DEFAULT_SERIALIZER_PROTOCOL
except ImportError:
    logging.critical("Loaded IMAS library has no serialization support")
    sys.exit(1)

# MUSCLE3 imports
from libmuscle import Instance, Message
from ymmsl import Operator


HELLO_WORLD = "Hello world!"
CODE = "HelloWorld Actor in Python"

logger = logging.getLogger()


def verify_message(stage, msg):
    workflow = imas.workflow()
    workflow.deserialize(msg.data)

    comment = workflow.ids_properties.comment
    code = workflow.code.name

    if comment == HELLO_WORLD:
        logger.info(f"%s received '%s' from '%s'", stage, comment, code)
        return True
    else:
        logger.error(
            f"%s was expecting '%s' but received '%s' from '%s'",
            stage,
            HELLO_WORLD,
            comment,
            code,
        )
        return False


def construct_message(t_cur, t_next):
    workflow = imas.workflow()
    workflow.ids_properties.homogeneous_time = IDS_TIME_MODE_INDEPENDENT
    workflow.ids_properties.comment = HELLO_WORLD
    workflow.code.name = CODE
    return Message(t_cur, t_next, workflow.serialize())


def main():
    """Create hello world muscle instance and enter submodel execution loop"""
    # Create libmuscle instance, specify all Ports
    logger.info("Starting helloworld python actor")
    instance = Instance(
        {
            Operator.F_INIT: ["initial_workflow_in"],
            Operator.O_I: ["workflow_out"],
            Operator.S: ["workflow_in"],
            Operator.O_F: ["final_workflow_out"],
        }
    )

    # enter re-use loop
    while instance.reuse_instance():
        # F_INIT
        t_max = instance.get_setting("t_max", "float")
        dt = instance.get_setting("dt", "float")

        if instance.is_connected("initial_workflow_in"):
            # we are the micro-model and should receive from macro
            msg = instance.receive("initial_workflow_in")
            if not verify_message("F_INIT", msg):
                instance.error_shutdown("Received unexpected message")
                sys.exit(1)
            if msg.next_timestamp is not None:
                t_max = msg.next_timestamp

        t_cur = 0.0
        while t_cur + dt <= t_max:
            # O_I
            t_next = t_cur + dt
            if t_next + dt > t_max:
                t_next = None
            if instance.is_connected("workflow_out"):
                # we are a macro model and should send to micro
                msg = construct_message(t_cur, t_next)
                instance.send("workflow_out", msg)

            # S
            if instance.is_connected("workflow_in"):
                # we are a macro model and should receive from micro
                msg = instance.receive("workflow_in")
                if not verify_message("S", msg):
                    instance.error_shutdown("Received unexpected message")
                    sys.exit(1)

            # a simulation would actually update something here, but we're just saying
            # hi to connected actors and don't do anything else
            t_cur += dt

        # O_F
        if instance.is_connected("final_workflow_out"):
            # we are a micro model and should send to macro
            msg = construct_message(t_cur, None)
            instance.send("final_workflow_out", msg)


if __name__ == "__main__":
    logging.basicConfig(
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        level=logging.INFO,
    )
    main()

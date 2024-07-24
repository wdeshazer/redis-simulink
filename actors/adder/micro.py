"""MUSCLE3 actor adding two numbers"""
import time
import logging
import numpy
import scipy.io as sio

from libmuscle import Instance, Message
from ymmsl import Operator

logger = logging.getLogger()
    
def main():
    """Create adder micro instance and enter submodel execution loop"""
    # Create libmuscle instance, specify all Ports
    logger.info("Starting adder python micro actor")
    instance = Instance(
        {
            Operator.O_I: ["state_out"],
            Operator.S: ["control_in"],
        }
    )
    all_mat = sio.loadmat('/cscratch/share/anandh/ss_iter.mat',matlab_compatible=True) 
    A =  all_mat['iter_system']['amat'][0,0] 
    B =  all_mat['iter_system']['bmat'][0,0] 
    C =  all_mat['iter_system']['cmat'][0,0] 
    D =  all_mat['iter_system']['dmat'][0,0] 
    T = 1e-3

    x = numpy.zeros(160)

    # enter re-use loop
    while instance.reuse_instance():
        # F_INIT
        y = C@x
        t_cur = 0.0
        t_max = 10.0
        dt = 0.001

        while t_cur < t_max:
            # O_I 
            # time.sleep(0.004)
            msg = Message(t_cur, t_cur + dt, y)
            instance.send("state_out", msg)

            # S
            msg = instance.receive("control_in")

            # This is a simple function and no time integration is required
            # Calculate the sum of a and b and send back as final_state

            x_dot = (A @ x + B @ msg.data.array)
            x = x + x_dot * 1e-3
            y = C@x

            t_cur += dt


if __name__ == "__main__":
    logging.basicConfig(
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        level=logging.INFO,
    )
    main()

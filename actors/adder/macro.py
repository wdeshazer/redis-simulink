"""MUSCLE3 actor requesting a micro model to add two numbers"""

import logging
import random
import sys
from scipy.signal import butter, lfilter, freqz

from libmuscle import Instance, Message
from ymmsl import Operator

def butter_lowpass(cutoff, fs, order=5):
    return butter(order, cutoff, fs=fs, btype='low', analog=False)
    
logger = logging.getLogger()

def main():
    """Create adder macro instance and enter submodel execution loop"""
    # Create libmuscle instance, specify all Ports
    logger.info("Starting adder python macro actor")
    instance = Instance(
        {
            Operator.O_I: ["state_out"],
            Operator.S: ["state_in"],
        }
    )

    # enter re-use loop
    while instance.reuse_instance():
        # F_INIT
        t_max = instance.get_setting("t_max", "float")
        dt = instance.get_setting("dt", "float")

        t_cur = 0.0
        while t_cur + dt <= t_max:
            # O_I
            t_next = t_cur + dt
            if t_next + dt > t_max:
                t_next = None

            # Send two random numbers to the micro model
            a, b = random.random(), random.random()
            msg = Message(t_cur, t_next, [a, b])
            instance.send("state_out", msg)

            # S
            # Receive the sum from the micro model
            msg = instance.receive("state_in")
            s = msg.data
            if abs(a + b - s) > 1e-10:
                instance.error_shutdown("Received unexpected message")
                sys.exit(1)

            t_cur += dt


if __name__ == "__main__":
    logging.basicConfig(
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        level=logging.INFO,
    )
    main()

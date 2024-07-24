// MUSCLE3 actor requesting a micro model to add two numbers

#include <cstdlib>
#include <iostream>

// MUSCLE imports
#include <libmuscle/libmuscle.hpp>
#include <ymmsl/ymmsl.hpp>

int main(int argc, char *argv[]) {
  std::cout << "Starting adder C++ macro actor" << std::endl;
  libmuscle::Instance instance(argc, argv,
                               {
                                   {ymmsl::Operator::O_I, {"state_out"}},
                                   {ymmsl::Operator::S, {"state_in"}},
                               });

  while (instance.reuse_instance()) {
    // F_INIT
    double t_max = instance.get_setting_as<double>("t_max");
    double dt = instance.get_setting_as<double>("dt");

    double t_cur = 0.0;
    while (t_cur + dt <= t_max) {
      // O_I
      double t_next = t_cur + dt;

      // Send two random numbers to the micro model
      double a = (double)std::rand() / RAND_MAX;
      double b = (double)std::rand() / RAND_MAX;
      libmuscle::Message msg(t_cur, libmuscle::Data::list(a, b));
      if (t_next + dt <= t_max) msg.set_next_timestamp(t_next);
      instance.send("state_out", msg);

      // S
      // Receive the sum from the micro model
      msg = instance.receive("state_in");
      double s = msg.data().as<double>();
      if (std::abs(a + b - s) > 1e-10) {
        instance.error_shutdown("Received unexpected message");
        return 1;
      }

      t_cur += dt;
    }
  }
}

// MUSCLE3 actor requesting a micro model to add two numbers

#include <iostream>

// MUSCLE imports
#include <libmuscle/libmuscle.hpp>
#include <ymmsl/ymmsl.hpp>

int main(int argc, char *argv[]) {
  std::cout << "Starting adder C++ micro actor" << std::endl;
  libmuscle::Instance instance(argc, argv,
                               {
                                   {ymmsl::Operator::F_INIT, {"initial_state"}},
                                   {ymmsl::Operator::O_F, {"final_state"}},
                               });

  while (instance.reuse_instance()) {
    // F_INIT

    auto msg = instance.receive("initial_state");
    double a = msg.data()[0].as<double>();
    double b = msg.data()[1].as<double>();
    double t_cur = msg.timestamp();

    // This is a simple function and no time integration is required
    // Calculate the sum of a and b and send back as final_state
    double s = a + b;

    // O_F
    msg = libmuscle::Message(t_cur, s);
    instance.send("final_state", msg);
  }
}

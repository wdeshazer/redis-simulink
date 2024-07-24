
#include <iostream>

// IMAS import
#include "UALClasses.h"

// MUSCLE imports
#include <libmuscle/libmuscle.hpp>
#include <ymmsl/ymmsl.hpp>

#define HELLO_WORLD "Hello world!"
#define CODE "HelloWorld Actor in C++"

bool verify_message(std::string const &stage, libmuscle::Message const &msg) {
  IdsNs::IDS::workflow workflow;
  std::string ids_bytes(msg.data().as_byte_array(), msg.data().size());
  workflow.deserialize(ids_bytes);

  auto comment = workflow.ids_properties.comment;
  auto code = workflow.code.name;

  if (comment == HELLO_WORLD) {
    std::cout << stage << " received '" << comment << "' from '" << code << "'"
              << std::endl;
    return true;
  } else {
    std::cerr << stage << " was expecting '" << HELLO_WORLD
              << "' but received '" << comment << "' from '" << code << "'"
              << std::endl;
    return false;
  }
}

inline IdsNs::IDS::workflow create_workflow_ids() {
  IdsNs::IDS::workflow workflow;
  workflow.ids_properties.homogeneous_time = IDS_TIME_MODE_INDEPENDENT;
  workflow.ids_properties.comment = HELLO_WORLD;
  workflow.code.name = CODE;
  return workflow;
}

int main(int argc, char *argv[]) {
  std::cout << "Starting helloworld C++ actor" << std::endl;
  libmuscle::Instance instance(
      argc, argv,
      {
          {ymmsl::Operator::F_INIT, {"initial_workflow_in"}},
          {ymmsl::Operator::O_I, {"workflow_out"}},
          {ymmsl::Operator::S, {"workflow_in"}},
          {ymmsl::Operator::O_F, {"final_workflow_out"}},
      });

  while (instance.reuse_instance()) {
    // F_INIT
    double t_max = instance.get_setting_as<double>("t_max");
    double dt = instance.get_setting_as<double>("dt");

    if (instance.is_connected("initial_workflow_in")) {
      // we are the micro-model and should receive from macro
      auto msg = instance.receive("initial_workflow_in");
      if (!verify_message("F_INIT", msg)) {
        instance.error_shutdown("Received unexpected message");
        return 1;
      }
      if (msg.has_next_timestamp()) t_max = msg.next_timestamp();
    }

    double t_cur = 0.0;
    while (t_cur + dt <= t_max) {
      // O_I
      double t_next = t_cur + dt;
      if (instance.is_connected("workflow_out")) {
        // we are a macro model and should send to micro
        auto workflow = create_workflow_ids();
        // Note: ids_bytes must remain in scope until instance.send!
        auto ids_bytes = workflow.serialize();
        auto ids_data =
            libmuscle::Data::byte_array(ids_bytes.data(), ids_bytes.size());
        libmuscle::Message msg(t_cur, ids_data);
        if (t_next + dt <= t_max) msg.set_next_timestamp(t_next);
        instance.send("workflow_out", msg);
      }

      // S
      if (instance.is_connected("workflow_in")) {
        // we are a macro model and should receive from micro
        auto msg = instance.receive("workflow_in");
        if (!verify_message("S", msg)) {
          instance.error_shutdown("Received unexpected message");
          return 1;
        }
      }

      // a simulation would actually update something here, but we're just
      // saying hi to connected actors and don't do anything else
      t_cur += dt;
    }
    // O_F
    if (instance.is_connected("final_workflow_out")) {
      // we are a micro model and should send to macro
      auto workflow = create_workflow_ids();
      // Note: ids_bytes must remain in scope until instance.send!
      auto ids_bytes = workflow.serialize();
      auto ids_data =
          libmuscle::Data::byte_array(ids_bytes.data(), ids_bytes.size());
      libmuscle::Message msg(t_cur, ids_data);
      instance.send("final_workflow_out", msg);
    }
  }
}
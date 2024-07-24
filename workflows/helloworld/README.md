# Hello world demo

The `helloworld` workflow is a demonstration for integrating IMAS with MUSCLE3.

## Workflow overview

The workflow consists of two actors: *macro* and *micro*:

- The **macro** actor initializes itself, then executes a time integration loop.
  Time starts at `t=0` and is increased in two steps to `t=2`. Inside the loop,
  the *macro* actor communicates with the *micro* actor: it sends a message over
  its `state_out` port to the *micro* actor, then waits for a return message on
  its `state_in` port.
- The **micro** actor initializes itself and waits for a message from the
  *macro* actor on its `initial_state` port. It verifies the message and sends a
  message in return on its `final_state` port. MUSCLE3 restarts the model as
  often as needed to communicate with the *macro* actor.

## Message contents

Messages sent between the two actors are IMAS IDSs. Actors populate the
`ids_properties.comment` ("Hello world") and `code.name` fields of the
`workflow` IDS. `ids_properties.homogeneous_time` is also set to prevent errors
with IDS parsing.

## Running the workflow

First follow the instructions in [the repository readme](../../README.md). This
workflow is executed as part of the `ctest` tests, so if that step completed
successfully you can also run the workflow manually. The following commands run
the workflow. The Python implementation is used for the *micro* actor and the
Fortran implementation for the *macro* actor.

```Shell
# 1. Navigate to the helloworld workflow folder
cd persistent-actor-framework/workflows/helloworld
# 2. Run the workflow on this machine
muscle_manager --start-all helloworld.ymmsl \
    helloworld_impl_micro_python.ymmsl \
    helloworld_impl_macro_fortran.ymmsl
```

### Workflow output

If the workflow completes successfully, the above command produces no output.
However, the actors did write output for logging, so where did that go?

When using the `--start-all` flag with `muscle_manager`, by default the manager
creates a run directory in the current folder called
`run_helloworld_<date>_<time>`. For muscle 0.5.0 this folder has the following
structure:

- `instances/`
  - `<actor>/`
    - `workdir/` was the working directory of the actor during execution. We
      aren't writing any files to the working directory in our actors, so this
      folder remains empty for either actor.
    - `stderr.txt` is the captured output from the actor on the standard error
      stream.
    - `stdout.txt` is the captured output from the actor on the standard output
      stream.
- `qcgpj/`
- `configuration.ymmsl` is the configuration used by muscle for this workflow
  run. Note that it is the result of merging all provided `ymmsl` files provided
  to the `muscle_manager`.
- `muscle3_manager.log` is the logfile produced by `muscle_manager`. When any
  error occurred during workflow execution, this file is a good starting point
  for investigating the problem. After checking which actor was likely the
  problem, you can check its output in the `instances/<actor>/` folder.

### Workflow implementations

You can change between actor implementations by providing the `muscle_manager`
with different configuration (`ymmsl`) files. You must provide exactly one
configuration file each for the two actors. See below table for the options:

| Implementation | Micro actor                           | Macro actor
| -------------- | ------------------------------------- | --------------------------------------
| Python         | `helloworld_impl_micro_python.ymmsl`  | `helloworld_impl_macro_python.ymmsl`
| C++            | `helloworld_impl_micro_cpp.ymmsl`     | `helloworld_impl_macro_cpp.ymmsl`
| Fortran        | `helloworld_impl_micro_fortran.ymmsl` | `helloworld_impl_macro_fortran.ymmsl`

## Actor code structure

Actors are written such that they can act as either *micro* or *macro* actor.
This makes them slightly more complex than if separate programs were written for
either actor, however it saves in code duplication for these demonstration
actors.

Below shows the structure of the actor programs in pseudo-code, followed by an
explanation of the different parts of the program. The structure is the same for
all three languages that actor implementations are available for:

- [Python](../../actors/helloworld/helloworld.py)
- [C++](../../actors/helloworld/helloworld.cpp)
- [Fortran](../../actors/helloworld/helloworld.f90)

### Pseudo-code structure

```Python
# Create a libmuscle instance managing the actor
instance = Instance(...)

# enter re-use loop
while instance.reuse_instance():
    # perform submodel execution loop
    # F_INIT
    ... = instance.get_settings(...)

    # Receive on our initial_state port when acting as micro model
    if instance.is_connected("initial_state"):
        msg = instance.receive("initial_state")
        verify_message(msg)

    # Perform "time integration loop" when acting as macro model
    t_cur = 0
    while t_cur + dt <= dt:
        # O_I
        # Send message to micro model on our state_out port
        if instance.is_connected("state_out"):
            msg = ...
            instance.send("state_out", msg)

        # S 
        # Wait for micro model to send a message back on our state_in part
        if instance.is_connected("state_in"):
            msg = instance.receive("state_in")
            verify_message(msg)

        # update 'simulation' time
        t_cur += dt

    # O_F
    # Send message to macro model on our final_state port
    if instance.is_connected("final_state"):
        msg = ...
        instance.send("final_state", msg)
```

### MUSCLE3 flow

The structure of our actors is determined by the MUSCLE3 workflow. We create a
MUSCLE3 instance, enter the re-use loop and then go into a Submodel Execution
Loop.

> **Note:** In this document we only give a high-level overview. For a more
> detailed introduction to MUSCLE3, it is worth following the [tutorial on the
> official MUSCLE3
> documentation](https://muscle3.readthedocs.io/en/latest/tutorial.html).

- The **MUSCLE3 instance** object takes care of communicating with the workflow
  manager (`muscle_manager`) and connected actors.
- The actual implementation of the actor is inside the **re-use loop**. In
  MUSCLE3, actors may need to run multiple times from the beginning (as is the
  case for our *micro* model). By doing this in the same program, MUSCLE3 avoids
  potentially very expensive tear-down and set-up costs between restarts (think
  about setting up MPI contexts, initializing internal model state, etc.). The
  MUSCLE3 library determines whether an actor is reused (through
  `instance.reuse_instance()`) or exits after a single execution.
- The **Submodel Execution Loop** (SEL) consists of four phases:
  - `F_INIT` is the initialization step. An actor may retrieve settings defined
    in the workflow through `instance.get_setting(...)` and can *receive* state
    from other actors on any ports defined for this phase of the (SEL) - which
    our *micro* model does.
  - During the `O_I` (intermediate observation) phase, an actor may share its
    state with other actors. Our *macro* model does this by sending a message to
    the *micro* model.
  - During the `S` step, the actor may receive messages from connected actors
    and solve a step of its time-integration loop. Our *macro* model receives a
    message from the *micro* model here and updates `t_cur`.
  - In the `O_F` (final observation) stage, the actor may share its final state
    with connected actors, like our *micro* model does.
  
  > **Note:** while `F_INIT` and `O_F` should only happen once per reuse-loop,
  > the time-integration loop with `O_I` and `S` may happen an arbitrary amount
  > of times (as much as needed). When an actor is a simple function, these may
  > even be skipped completely.

### Executed flow

A brief overview of noteworthy events during execution of this workflow is given
below:

1. The workflow manager `muscle_manager` is started as well as the individual
   actors.

   > **Note:** `muscle_manager` has the capability to start all actors with the
   > `--start-all` flag. This can happen locally or inside a HPC allocation. See
   > the MUSCLE3 documentation for more info.
2. The actors contact the `muscle_manager` to announce themselves and retrieve a
   list of connected actors.
3. The *micro* model starts waiting for a message on its `initial_state` port.
4. The *macro* model sends a message from its `state_out` port, which is
   connected to the `initial_state` port of *micro*. After sending the message
   it starts waiting for a message on its `state_in` port.
5. The *micro* model processes the incoming message then sends a message on its
   `final_state` port which is connected to the `state_in` port of *macro*.
   After sending the message, it starts waiting if a reuse of the model is
   required (in `instance.reuse_instance()`).
6. The *macro* model processes the incoming message and continues in its
   time-integration loop. When sending a new message to the `initial_state` port
   of the *micro*, MUSCLE3 detects that the *micro* model needs to be reused.
   Steps 4 and 5 are repeated.
7. The time-integration loop of the macro model completes (because `t_cur ==
   2.0`) and the *macro* model ends its Submodel Execution Loop
8. At this point both actors are done with the simulation, and MUSCLE3
   determines that no reuse is required for either actor.
   `instance.reuse_intance()` returns `False` for both actors, so the exit the
   reuse loop and shut down. Once all actors are shut down, `muscle_manager`
   exits as well.

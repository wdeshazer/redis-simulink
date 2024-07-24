% matlab-ified version of the micro python actor

logger = py.logging.getLogger()

py.logging.basicConfig( ...
    pyargs( ...
        "format", "%(asctime)s - %(name)s - %(levelname)s - %(message)s", ...
        "level", py.logging.INFO ...
    ) ...
)

% Create libmuscle instance, specify all Ports
logger.info("Starting adder matlab/python macro actor")
ports = py.dict()
ports{py.getattr(@py.ymmsl.Operator,"F_INIT")} = py.list({"initial_state"})
ports{py.getattr(@py.ymmsl.Operator,"O_F")} = py.list({"final_state"})

instance = py.libmuscle.Instance(ports)


% enter re-use loop
while instance.reuse_instance()
    % F_INIT
    msg = instance.receive("initial_state")
    a = msg.data{1} % takes the first item from the python list
    b = msg.data{2} % takes the second item from the python list
    t_cur = msg.timestamp

    % This is a simple function and no time integration is required
    % Calculate the sum of a and b and send back as final_state
    s = a + b

    % O_F
    msg = py.libmuscle.Message(t_cur, py.None, s)
    instance.send("final_state", msg)
end

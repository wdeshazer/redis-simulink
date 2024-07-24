% matlab-ified version of the macro python actor

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
ports{py.getattr(@py.ymmsl.Operator,"O_I")} = py.list({"state_out"})
ports{py.getattr(@py.ymmsl.Operator,"S")} = py.list({"state_in"})

instance = py.libmuscle.Instance(ports)

% enter re-use loop
while instance.reuse_instance()
    % F_INIT
    t_max = instance.get_setting("t_max", "float")
    dt = instance.get_setting("dt", "float")

    t_cur = 0.0
    while t_cur + dt <= t_max
        % O_I
        t_next = t_cur + dt
        if t_next + dt > t_max
            t_next = py.None
        end

        % Send two random numbers to the micro model
        a = rand()
        b = rand()
        msg = py.libmuscle.Message(t_cur, t_next, py.list({a, b}))
        instance.send("state_out", msg)

        % S
        % Receive the sum from the micro model
        msg = instance.receive("state_in")
        s = msg.data
        if abs(a + b - s) > 1e-10
            instance.error_shutdown("Received unexpected message")
            sys.exit(1)
        end

        t_cur = t_cur + dt
    end
end
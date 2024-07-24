% matlab-ified version of the macro python actor

logger = py.logging.getLogger();
setdefault(py.os.environ,'MUSCLE_INSTANCE','macro');


py.logging.basicConfig( ...
    pyargs( ...
        "format", "%(asctime)s - %(name)s - %(levelname)s - %(message)s", ...
        "level", py.logging.INFO ...
    ) ...
)

% Create libmuscle instance, specify all Ports
logger.info("Starting adder matlab/python macro actor")
ports = py.dict();
ports{py.getattr(@py.ymmsl.Operator,"O_I")} = py.list({"control_out"});
ports{py.getattr(@py.ymmsl.Operator,"S")} = py.list({"state_in"});

% declare muscle3 as non-codegen compatible
coder.extrinsic('py.libmuscle.Instance');

% write instance object to matlab workspace. Currently, there is no other
% way than to retrieve it from there within simulink with nasty 'evalin'
% statements.
% only populate when not yet there
if ~exist('instance','var') == 1
    instance = py.libmuscle.Instance(ports);
end


if ~instance.reuse_instance()
    error('Communication with MUSCLE3 failed')
end
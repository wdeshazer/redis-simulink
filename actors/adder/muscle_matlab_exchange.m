function [y] = muscle_matlab_exchange(in1,t_cur)
% This function receives the current simulation time and
% two input signals from simulink. It then sends these signals over the
% muscle3 framework to an external python script (the micro actor) that
% adds them together and sends them back here.


% retrieve instance object from base ws (is really there no cleaner way?)
instance = evalin('base','instance');

% O_I
msg = py.libmuscle.Message(t_cur, py.None, py.numpy.array((in1)));
instance.send("control_out", msg);

% S
% Receive the sum from the micro model
msg = instance.receive("state_in");

y = double(msg.data.array);


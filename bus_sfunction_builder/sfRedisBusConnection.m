function sfRedisBusConnection() 
% SFREDISBUSCONNECTION initializes a set of bus objects in the MATLAB base workspace 

% Connection bus object: sfRedisConnectionBus 
clear elems;
sfRedisConnectionBus = Simulink.ConnectionBus;
sfRedisConnectionBus.Description = '';
assignin('base','sfRedisConnectionBus', sfRedisConnectionBus);


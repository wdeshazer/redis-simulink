function sfRedisCredentialsBus() 
% SFREDISCREDENTIALSBUS initializes a set of bus objects in the MATLAB base workspace 

% Bus object: redisCrentialsBus 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'hostname';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'string';
elems(1).Complexity = 'real';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = '';
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'ip';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'string';
elems(2).Complexity = 'real';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = '';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'port';
elems(3).Dimensions = 1;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'string';
elems(3).Complexity = 'real';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = '';
elems(3).Description = '';

elems(4) = Simulink.BusElement;
elems(4).Name = 'passwd';
elems(4).Dimensions = 1;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'string';
elems(4).Complexity = 'real';
elems(4).Min = [];
elems(4).Max = [];
elems(4).DocUnits = '';
elems(4).Description = '';

elems(5) = Simulink.BusElement;
elems(5).Name = 'timestamp';
elems(5).Dimensions = 1;
elems(5).DimensionsMode = 'Fixed';
elems(5).DataType = 'string';
elems(5).Complexity = 'real';
elems(5).Min = [];
elems(5).Max = [];
elems(5).DocUnits = '';
elems(5).Description = '';

redisCrentialsBus = Simulink.Bus;
redisCrentialsBus.HeaderFile = '';
redisCrentialsBus.Description = '';
redisCrentialsBus.DataScope = 'Auto';
redisCrentialsBus.Alignment = -1;
redisCrentialsBus.PreserveElementDimensions = 0;
redisCrentialsBus.Elements = elems;
clear elems;
assignin('base','redisCrentialsBus', redisCrentialsBus);


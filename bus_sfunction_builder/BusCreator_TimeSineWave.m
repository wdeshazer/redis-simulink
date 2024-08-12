sfRedisBus = Simulink.Bus;
sfRedisBus.Description = 'sfRedisBus';
sfRedisBus.HeaderFile = 'sfRedisBus.h';


sfRedisBus.Elements(1) = Simulink.BusElement;
sfRedisBus.Elements(1).Name = 'Time';
sfRedisBus.Elements(1).Unit = 's';
sfRedisBus.Elements(1).Description = 'Used to pass a clock time Redis';

sfRedisBus.Elements(2).Name = 'SineWave';
sfRedisBus.Elements(2).Description = 'A signal';


%               Name: 'SineWave'
%         Complexity: 'real'
%         Dimensions: 1
%           DataType: 'double'
%                Min: []
%                Max: []
%     DimensionsMode: 'Fixed'
%               Unit: ''
%        Description: 'A signal'
% disp(a)
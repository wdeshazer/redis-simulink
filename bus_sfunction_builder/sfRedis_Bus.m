function sfRedis_Bus()
  % SFREDIS_BUS initializes a set of bus objects in the MATLAB base workspace

  sfRedisBus = Simulink.Bus;
  sfRedisBus.HeaderFile = 'sfRedisBus.h';
  sfRedisBus.Description = sprintf('sfRedisBus');
  sfRedisBus.DataScope = 'Auto';
  sfRedisBus.Alignment = -1;
  sfRedisBus.PreserveElementDimensions = 1;


  % Bus object: sfRedisBus
  clear elems;
  elems = sfRedisBus.elems;
  elems(1) = Simulink.BusElement;

  elems(1).Name = 'Time';
  elems(1).Dimensions = 1;
  elems(1).DimensionsMode = 'Fixed';
  elems(1).DataType = 'double';
  elems(1).Complexity = 'real';
  elems(1).Min = [];
  elems(1).Max = [];
  elems(1).DocUnits = sprintf('s');
  elems(1).Description = sprintf('Used to pass a clock time Redis');

  elems(2) = Simulink.BusElement;
  elems(2).Name = 'SineWave';
  elems(2).Dimensions = 1;
  elems(2).DimensionsMode = 'Fixed';
  elems(2).DataType = 'double';
  elems(2).Complexity = 'real';
  elems(2).Min = [];
  elems(2).Max = [];
  elems(2).DocUnits = '';
  elems(2).Description = sprintf('A signal');

  sfRedisBus.Elements = elems;
  clear elems;
  assignin('base','sfRedisBus', sfRedisBus);

end


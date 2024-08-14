%% ------------------------------------------------------------------
%  You can modify the values of the fields in sfRedisBus_MATLABStruct
%  and evaluate this cell to create/update sfRedisBus_Param
%  in the MATLAB base workspace.
% -------------------------------------------------------------------


sfRedisBus_MATLABStruct = struct;
sfRedisBus_MATLABStruct.Time = 0;
sfRedisBus_MATLABStruct.SineWave = 0;


sfRedisBus_Param = Simulink.Parameter;
sfRedisBus_Param.Value = sfRedisBus_MATLABStruct;
sfRedisBus_Param.Complexity = 'real';
sfRedisBus_Param.CoderInfo.StorageClass = 'Auto';
sfRedisBus_Param.Description = '';
sfRedisBus_Param.DataType = 'Bus: sfRedisBus';
sfRedisBus_Param.Min = [];
sfRedisBus_Param.Max = [];
sfRedisBus_Param.DocUnits = '';

clear sfRedisBus_MATLABStruct;

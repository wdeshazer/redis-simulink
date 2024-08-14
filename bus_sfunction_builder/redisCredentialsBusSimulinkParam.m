%% ------------------------------------------------------------------
%  You can modify the values of the fields in redisCrentialsBus_MATLABStruct
%  and evaluate this cell to create/update redisCrentialsBus_Param
%  in the MATLAB base workspace.
% -------------------------------------------------------------------


redisCrentialsBus_MATLABStruct = struct;
redisCrentialsBus_MATLABStruct.hostname = '';
redisCrentialsBus_MATLABStruct.hostname = convertCharsToStrings( ...
redisCrentialsBus_MATLABStruct.hostname);
redisCrentialsBus_MATLABStruct.ip = '';
redisCrentialsBus_MATLABStruct.ip = convertCharsToStrings( ...
redisCrentialsBus_MATLABStruct.ip);
redisCrentialsBus_MATLABStruct.port = '';
redisCrentialsBus_MATLABStruct.port = convertCharsToStrings( ...
redisCrentialsBus_MATLABStruct.port);
redisCrentialsBus_MATLABStruct.passwd = '';
redisCrentialsBus_MATLABStruct.passwd = convertCharsToStrings( ...
redisCrentialsBus_MATLABStruct.passwd);
redisCrentialsBus_MATLABStruct.timestamp = '';
redisCrentialsBus_MATLABStruct.timestamp = convertCharsToStrings( ...
redisCrentialsBus_MATLABStruct.timestamp);


redisCrentialsBus_Param = Simulink.Parameter;
redisCrentialsBus_Param.Value = redisCrentialsBus_MATLABStruct;
redisCrentialsBus_Param.Complexity = 'real';
redisCrentialsBus_Param.CoderInfo.StorageClass = 'Auto';
redisCrentialsBus_Param.Description = '';
redisCrentialsBus_Param.DataType = 'Bus: redisCrentialsBus';
redisCrentialsBus_Param.Min = [];
redisCrentialsBus_Param.Max = [];
redisCrentialsBus_Param.DocUnits = '';

clear redisCrentialsBus_MATLABStruct;
clear comp

project = currentProject;

comp = RMCompileClass;
comp.report()

% comp.iPath
% comp.hiredis_lib

% comp.headers_list
% 1×4 cell array
%   {'hiredis.h'}    {'sds.h'}    {'read.h'}    {'alloc.h'}

% mex -DLIN64 -DUNIX -DNDEBUG -D_USRDLL -O xfft_v9_1_bitacc_mex.cpp ...
%       -output xfft_v9_1_bitacc_mex -lIp_xfft_v9_1_bitacc_cmodel
% -L./ 'LDFLAGS=$LDFLAGS -Wl,-rpath,\$ORIGIN'

% mex('-v', '-R2018a', comp.iPath,comp.hfile('hiredis.h'), comp.hiredis_lib)

% compile just the original

mex 
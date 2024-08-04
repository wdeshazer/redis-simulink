% REDIS_comopile compiles a Simulink/Matlab compatible version of the `HIREDIS C-API`
% HSimulink, MEX compatible IREDIS API requires removal of:
% 1.  Dynamically sized strings
%     - string buffers need to be pre-allocated
%     - the buffers are passed to sprintf
%     ```C
%         static char msg[35];
%         sprintf(msg,"Error connecting to REDIS SERVER %s:%d: %s\n",host,port,ctx->errstr);
%         ssSetLocalErrorStatus(S,msg);
%     ```
% 2.  Use of `Variadic Input`
%      - `Vararg` is short for `Variadic Arguments`
%      - Any attempts to use functions with Variadic Input will cause an error
%     Resolution:
%      - Do not `#include` `hiredis.h` in the programmatic interface file `.h`
%      - Instead `#include` them in the implementation file `.cpp`
%
%      This is just for the headers that will be used in Simulink and Mex.
% Author: Will DeShazer
% Date: Aug 2, 2024

% mex -R2018a -DDEBUG -v REDIS.cpp REDIS_custom.cpp REDIS_wrapper.cpp -L./hiredis -lhiredis

% preallocate summary with 15 lines and then increase in blocks of 15 (Redis Reader Approach)


function announce(label, value, indent_level, indent_num, indent_char)
    arguments
        label (1, 1) string
        value (1, 1) string
        indent_level (1, 1) double
        indent_num (1, 1)  double = 2
        indent_char (1, 1) char = ' '
    end

    if ~isempty(indent_level)
        indent = repelem(indent_char, indent_num);
        string(indent);
    end
    fprintf('%s%s: %s\n', indent, label, value)
end

fprintf("Compiling the HiRedis API using Mex\n")

[proj_dir, root_dir] = 
   announce('Project Directory', proj_dir, 1)

hiredis_dir = proj_dir + 'hiredis';
   hiredis_dir_label = 'HiRedis Source Directory';
   announce(hiredis_dir_label, hiredis_dir, 1)

iPath = ['-I' char(hiredis_dir)];
    iPath_label = 'Library Path Flag';
    announce(iPath_label, iPath, 1)

hiredislib = fullfile(hiredis_dir,'libhiredis.dylib');
    hiredislib_label = 'Hiredis compiled library';
    announce(hiredislib_label, char(hiredislib), 2)

headers_list = {'hiredis.h', 'sds.h', 'read.h', 'alloc.h'};
    delim = ', ';
    hList = join(headers_list, delim);
    announce('Interface Files (.h)', hList)

mex('-v','-R2018b',ipath,'hiredis.h',fortfile,lapacklib)


% RMCompile compiles a Simulink/Matlab compatible version of the `HIREDIS C-API`
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

classdef RMCompileClass

  properties
    project
    root
    shf_path
    headers_list
    hiredis_lib
    hiredis_path
    hr_relpath
    lib_path
    iPath

  end

  methods

    function obj = RMCompileClass()
      project = currentProject;
      obj.project = project;

      root = strrep(project.ProjectStartupFolder, userpath, '');
      obj.root = root;

      shf_path = project.ProjectPath(1);
      obj.shf_path = shf_path;

      hiredis_path = project.ProjectPath(3);
      obj.hiredis_path = hiredis_path;

      hr_relpath = fullfile('../../', hiredis_path.StoredLocation);
      obj.hr_relpath = hr_relpath;

      % iPath = ['-I' char(hr_relpath)];
      iPath = '-I./hiredis_mex';
      obj.iPath = iPath;

      lib_path = '-L./hiredis_mex';
      obj.lib_path = lib_path;

      hiredislib = fullfile(hr_relpath,'libhiredis.dylib');
      obj.hiredis_lib = hiredislib;

      headers_list = {'hiredis.h', 'sds.h', 'read.h', 'alloc.h'};
      obj.headers_list = headers_list;
    end

    function report(obj)
      fprintf("\nCompiling the HiRedis API using Mex\n")

      fprintf('%-29s %s\n\n', 'Project Startup Folder:', obj.root)

      obj.announce('Project Directory:', obj.shf_path.StoredLocation, 1)

      hiredis_dir_label = 'HiRedis Source Directory:';
      obj.announce(hiredis_dir_label, obj.hr_relpath, 1)

      iPath_label = 'Library Path Flag:';
      obj.announce(iPath_label, obj.iPath, 1)

      hiredislib_label = 'Hiredis compiled library:';
      obj.announce(hiredislib_label, char(obj.hiredis_lib), 2)

      hList = char(join(obj.headers_list, ', '));
      obj.announce('Interface Files (.h)', hList, 1)
    end

    function out = hfile(obj, file)
      out = fullfile("hiredis_mex",file);
    end


    function compile(obj, files)
      mex('-v','-R2018a',obj.iPath,files,fortfile,lapacklib)
    end

  end

  methods (Static)

    function announce(label, value, indent_level, ...
        indent_num, indent_char)
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
      fprintf('%s%-27s %s\n', indent, label, value)
    end

    function original_comp()
      fprintf("\n\nmex -R2018a -DDEBUG -v REDIS.cpp REDIS_custom.cpp\n")
      fprintf("     REDIS_wrapper.cpp -L./hiredis -lhiredis\n\n")

      fprintf("mex -DLIN64 -DUNIX -DNDEBUG -D_USRDLL -O\n")
      fprintf(" xfft_v9_1_bitacc_mex.cpp ...\n")
      fprintf("-output xfft_v9_1_bitacc_mex -lIp_xfft_v9_1_bitacc_cmodel\n")
      fprintf("-L./ 'LDFLAGS=$LDFLAGS -Wl,-rpath,$ORIGIN'\n\n\n")

    end

  end

end


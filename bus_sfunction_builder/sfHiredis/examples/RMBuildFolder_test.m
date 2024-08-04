classdef RMBuildFolder_test

    properties
        projectPath     (1,1) string {mustBeFolder} = pwd
        buildPath (1,1) string {mustBeFolder} = pwd
        buildType     (1,1) string { ...
            mustBeMember(buildType, ...
                {'Interface', 'Library', 'Implementation'} )} = 'Interface'
        subfolders cell {mustBeFolder} = {}
        buildFiles cell {mustBeFile} = {}
        ignored_items cell ={}
        file_exts cell = {'.h','.hpp', '.hxx'}
    end

    properties (Dependent)
        available_files
    end

    properties (Hidden, Access=protected)
        ext_dict dictionary = dictionary( ...
                "Interface", {{'.h','.hpp', '.hxx'}},      ...
                'Library', {{'.dylib', '.a', '.so'}},      ...
                'Implementation', {{'.c', '.cpp', '.cxx'}} ...
                );
    end




end
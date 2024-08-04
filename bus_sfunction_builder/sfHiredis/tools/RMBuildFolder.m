classdef RMBuildFolder
    %RMFolder - Encodes structural information of the build hierarchy.
    %   This class overloads the keyHash and keyMap methods functionally
    %   making this a dictionary.
    %
    %   Build components like libs, srcs, and headers are often
    %       co-located which flattens the hierarchy or they can be
    %       in various locations according to whether they are
    %       system level resources, shared resources between
    %       resources or personal resources.
    %
    %   This class takes components that get inserted into a
    %       makefile, command-line, or build system and uses
    %       the path information to reconstruct the information.
    %   It is imature as a tool so be aware.

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

    methods        
        function self = addBuildFile(self, file)
            persistent p;
            if isempty(p)
                p = inputParser;
                p.FunctionName = 'addBuildFile';
                addRequired(p,'file',@(x)validateattributes(x,{'char'},...
                    {'nonempty'}))
            end
            self.buildFiles = parse(p, file);


        end
        % Dependent Functions

        function available_files = get.available_files(self)
            ext_filter = append('*.', self.file_exts);
            filtered_paths = fullfile(self.fullpath, ext_filter);
            available_files = ...
                cellfun(@dir, filtered_paths, 'UniformOutput', false);
        end

        function self = set.available_files(self,~)
            fprintf('%s%d\n','available_files is: ',self.available_files)
            error('You cannot set the fullpath property');
        end

        function dir(self)
            dir(self.fullpath);
        end

        % Dictionary Definition

        function h = keyHash(self)
            h = keyHash(self.buildPath);
        end

        function tf = keyMatch(objA,objB)
            tf = keyMatch(objA.buildPath,objB.dataValue);
        end

        % Custom Validation

        function validity = isProjectSubfolder(self, buildPath)
            rp = fullfile(self.projectPath, buildPath);
            validity = isfolder(rp);
        end

        function validity = isBuildSubfolder(self, subPath)
            rp = fullfile(self.projectPath, subPath);
            validity = isfolder(rp);
        end

        function validity = isBuildType(~, aType)
            validity = any(validatestring(aType,validFinishes));
        end
    end
end
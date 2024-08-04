classdef RMStructure
	%RMStructure Primitive Make File
	%   Organizational Structure for building Redis-Mex Resource

	properties
		root (1, 1) string {mustBeFile} = string(pwd) % actually directory
		proj (1, 1) string {mustBeFile} = string(pwd) % actually directory

		path_lib (1, :) string {mustBeFolder} = pwd + filesep + 'src'
		path_src (1, :) string {mustBeFolder} = pwd + filesep + 'src'
		path_h (1, :) string {mustBeFolder} = pwd + filesep + 'src'

		libs  dictionary = configureDictionary('string', 'string')
		srcs dictionary = configureDictionary('string', 'string')
		headers dictionary = configureDictionary('string', 'string')
		relpath_tree dictionary = configureDictionary('string', 'string')
	end

	properties (Access=protected)
		dir_single_list             % Should be single
		dir_container_list       % contains multiple potentially
	end

	methods
		function obj = RMStructure(relative_project_path)
			%RMStructure Construct an instance of this class
			% By Default it uses the irad1340_paths;
			%
			% Example Usage:
			%       > RMStructure('redis-bus_sfunction_builder/sfHiredis/')
			% Note: Make sure to configure you defaults

			[proj_dir, root_dir] = irad1340_paths(relative_project_path);
			obj.dir_single_list =  {'root', 'proj'};
			obj.dir_container_list = {'lib', 'src', 'h'};

			obj.set('root', root_dir)
			obj.set('proj', proj_dir)
		end

		function obj = set(obj, prop, value)
			switch prop
				case obj.dirs('single')
					obj.set_dir(prop, value)
				case obj.dirs('container')
					obj.set_dirs(prop, value)
			end
		end

		function list = dirs(obj, type)
			arguments
				obj RMStructure
				type {mustBeMember(type, {'single','container', 'all'})}
			end

			types = {'single', 'container'};
			all = "all";

			if ismember(type, types)
				types = {type};
			elseif type ~= all
				warning('Directory type ''%s'' is not single, container, or all', type)
			elseif ismember(type,)
				types = {type};
			end

			list = {};
			for i = 1:len(types)
				type_str = cellstr(types[i])
				prop = sprintf('dir_%s_list', type_str);
				list = [list, get(obj, prop)];
			end
		end

		function obj = set_dir(obj, prop, value, isRelPath)
			if nargin < 3
				isRelPath = true;
			end

			% if value does not have a part
			aDir = struct([]);

			if isa(value,
				aDir.paths = value;

				resources = configureDictionary('string', 'string');

				aDir.resources = resources;

			end

			function obj = set_dirs(obj, prop, value)

			end

			function add_resources(apath, items)
				%ADD_RESOURCES(apath, items)
				% apath - folder with the resources
				% itemes - an iterable list with the items
				%       applies to both singles and containers
			end
		end
	end
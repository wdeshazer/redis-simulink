function [proj_folder, root_path] = irad1340_paths(path_relative_to_root)
%IRAD_1340_PATHS collection of defaults for various projects
%   Detailed explanation goes here
arguments
    path_relative_to_root (1,1) string =  '.'
end



%% ROOT_PATH
[home, username] = home_path();

root_path = getenv('IRD1340_ROOT');

if isempty(root_path)
    switch username
        case 'deshazere'
            root_path = fullfile(home, "General-Atomics/fusion/projects/IRAD-1340-API/");
        otherwise
            root_path = input("Please enter the path to the folder containing the project repo");
    end
end

%% REDIS_SIMULINK

proj_dir = fullfile(root_path + filesep  + path_relative_to_root);
proj_folder = fileparts(proj_dir);

end


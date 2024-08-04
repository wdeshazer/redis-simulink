%% sfHiredis Project Creation
% This project builds the Hiredis API
projectName = 'sfHiredis';
projectPkg = 'SfHiredis.prj';

% The relative path is built off of MATLAB's default userpath
% `userpath` defaults to `~/MATLAB/projects` 
% To redefine that `userpath(newpath)`. Note - This is global.
relPath = 'IRAD-1340-API/redis-simulink/bus_sfunction_builder/sfHiredis';
projectFolder = fullfile(userpath,relPath);
projectPkgPath =  fullfile(projectFolder, projectPkg);

try
  cd(projectFolder)
catch ME
  if (strcmp(ME.identifier,'MATLAB:cd:NonExistentFolder'))
    if input('Would you like to create this directory')
      mkdir(projectFolder)
    else
      msgbox('Please create the path or update `setup_sfHiredis');
    end
  else
    rethrow(ME)
  end
end
%% Open Project

if (~isfolder(projectPkgPath) && ~isfile(projectPkgPath))
  mp_createProject = @matlab.project.createProject;
  mp_createProject('Name', projectName, 'Folder',projectFolder);
else
  openProject(projectName)
end

%% Setup and Configure
project = currentProject;


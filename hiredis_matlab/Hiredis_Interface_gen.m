home = getenv('HOME');
git_dir = fullfile(home, 'General-Atomics/fusion/projects/IRAD-1340-API/redis-simulink');

hFile = fullfile(git_dir, 'hiredis_matlab/hiredis.h');
iPath = fullfile(git_dir, '/redis_client/hiredis/');
libFile = fullfile(iPath, 'libhiredis.dylib');

clibgen.generateLibraryDefinition(hFile,IncludePath=iPath,Libraries=libFile, Verbose=true, OverwriteExistingDefinitionFiles=true)

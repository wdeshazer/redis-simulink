function [dir_tree] = rdir(aDirectory)
%RDIR Recursive dir
%   Convenience function to avoid remembering the pattern.
arguments (Input)
    aDirectory (1,1) string = pwd;
end

dir_tree = dir(aDirectory + filesep + '**/*');

end


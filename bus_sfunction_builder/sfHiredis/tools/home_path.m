function [home, username] = home_path()
%HOME_PATH Summary of this function goes here
%   Detailed explanation goes here
        if ispc
            home = getenv('USERPROFILE');
        else
            home = getenv('HOME');
        end

        [~, username, ~] = fileparts(home);

end


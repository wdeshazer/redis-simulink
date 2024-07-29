function [redisHost, redisPort, redisKey] = readConfigFile(redisConfigPath)
    % Connect to the Redis server, configure channels

    % Use Default Config File location
    if nargin < 1
        if ispc
            HOME = getenv('USERPROFILE');
        else
            HOME = getenv('HOME');
        end

        redisConfigPath = fullfile([HOME '/.config/redis/irad_redis.config']);
    end

    fileContent = fileread(redisConfigPath); % Read the file

    lines = strsplit(fileContent, '\n'); % Split by line
    redisHost = strtrim(lines{1}); % Server name
    redisPort = str2double(strtrim(lines{2})); % Port number
    redisKey = strtrim(lines{3}); % Password/key
end
function [redisCreds]  = readConfigFile(redisConfigRelPath) %#CODEGEN
arguments (Input)
  redisConfigRelPath (1,:) char {mustBeVector} = '/.config/redis/irad_redis.config'
end

arguments (Output)
  redisCreds (1,1) struct
  % sfRedisStruct (1,1) struct
end


% Connect to the Redis server, configure channels

% Use Default Config File location
if nargin < 1 || strcmpi(redisConfigRelPath, 'default')
  if ispc
    HOME = getenv('USERPROFILE');
  else
    HOME = getenv('HOME');
  end

  redisConfigPath = fullfile([HOME char(redisConfigRelPath)]);
end

% Read the file and process lines
% Make arrangement of values flexible. By looking at lengths

fileContent = fileread(redisConfigPath);
lines = strtrim(strsplit(fileContent, '\n'));
[redisHostname, redisPort, redisPasswd] = lines{:};

keys = {'hostname', 'ip', 'port', 'passwd', 'timestamp'};
vals = {
  redisHostname, ...
  resolvehost(redisHostname, 'address'), ...
  redisPort, ...
  redisPasswd, ...
  datetime, ...
  };

cf = size(keys, 2); cv = size(vals, 2);

if cf ~= cv
  error("Something is wrong with the redis credentials locating.")
else
  r1 = colon(1, cf);
  r2 = r1*2;

  % The arguments to struct need to be field value.
  alt = cell(1, cf+cv);
  alt(r2) = vals;
  alt(r2-1) = keys;

  redisCreds = struct(alt{:});
end
end
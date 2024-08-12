% function [redisCreds, rcStruct] = redisCredentials(values)
  values = char_lines; 
  [redisHostname, redisPort, redisPasswd] = values{:};

  fields = {'hostname', 'ip', 'port', 'passwd', 'timestamp'};
  vals = {
    redisHostname, ...
    resolvehost(redisHostname, 'address'), ...
    redisPort, ...
    redisPasswd, ...
    datetime, ...
    };
  
  cf = size(fields, 2); cv = size(vals, 2);

  if cf ~= cv
    error("Something is wrong with the redis credentials locating.")
  else
    r1 = colon(1, cf);
    r2 = r1*2;
    
    % The arguments to struct need to be field value.
    alt = cell(1, cf+cv);
    alt(r2) = values;
    alt(r2-1) = fields;

    redisCred = struct(alt{:});
    
  end
  
  rcStruct = libstruct('c_struct', redisCreds);

  % wsp = {'base', 'caller'};
  % for i=1:2
  %   assignin(wsp{i}, 'redisCreds', 'redisCreds')
  %   assignin(wsp{i}, 'hostname'  , "HOSTNAME" );
  %   assignin(wsp{i}, 'ip'        , "IP"       );
  %   assignin(wsp{i}, 'port'      , "PORT"     );
  %   assignin(wsp{i}, 'passwd'    , "PASSWD"   );
  %   assignin(wsp{i}, 'timestamp' , "timestamp");
  % end
% end

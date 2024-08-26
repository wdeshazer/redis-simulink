function log_path = d(varargin)
  dt = datetime('now', Format='yyyyMMdd_HHmm');

  if contains(pwd, 'sfunction_clean/redis_connect_demo')
    diary_path = fullfile(ndirs("~sfun"), "logs");
    logname = "redcon_demo_" + string(dt) + ".log";
  end

  if exist('diary_path', 'var')
    fname = diary_path + filesep + logname;
    assignin("base", "session_log", string(fname));
    log_path = fname;
  end

end
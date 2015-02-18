def current_dive_log
  if session[:dive_log_id]
    return DiveLog.find(session[:dive_log_id])
  else
    return nil
  end
end
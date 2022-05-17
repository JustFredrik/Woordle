
attempts = 0;																					// used to count amount of failed upload attempts. 
max_attempts = CRASHR_MAX_CONNECT_ATTEMPT;		// Max count of attempts before ending upload attempts.

#region -- Get names of all files to upload -----------------------------------------------
logs = [];
var _file_name = "";

if directory_exists(CRASHR_LOCAL_TMP_DIR ){
	_file_name = file_find_first(CRASHR_LOCAL_TMP_DIR + "*.json", 0);
	
	while _file_name != "" {
		array_push(logs, _file_name);
		_file_name = file_find_next();
	}
			
	file_find_close();
	logs_length = array_length(logs);
	i = 0
	
	http_response = "ready";
	http_request_id = -1
	
} else {
	show_debug_message("CrashR :: Ending upload attempt. Can't find Crash report directory.")	
}
#endregion

// Kill o_crashr and stop trying to upload immediately if there is no connection to the internet,
if !os_is_network_connected(){ 
	show_debug_message("CrashR :: ERROR! Tried uploading crash reports but could not connect to the internet.")
	instance_destroy();
}
	

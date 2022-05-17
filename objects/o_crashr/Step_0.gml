
if ( !os_is_network_connected()){ // Increment failed attempts if Internet connection is lost
	attempts += 1;
	exit
}

if (attempts >= max_attempts){ // End uploading if too many failed attempts.
	show_debug_message("CrashR :: Ending uploading... Too many failed attempts.")
	instance_destroy();
}

switch(http_response){ // Main Segment of the Uploader

case "ready": // Prep file and send HTTP POST request.
		var _data;
		try {
			var _file = file_text_open_read(CRASHR_LOCAL_TMP_DIR + logs[i])
			_data = file_text_read_string(_file);
			file_text_close(_file)
			http_request_id = crashr_send_error_report(logs[i], _data);
			http_response = "waiting"
		}
		catch(_exception){
			attempts += 1;
			show_debug_message("CrashR :: ERROR! Something went wrong with uploading crash report.")
		}
		break

case "200":  // Upload was successful  delete local file and move to next file
	file_delete(CRASHR_LOCAL_TMP_DIR + logs[i])
	i++
	http_response = "ready"
	break
	
case "waiting":
	break
	
default:  // Something went wrong, increment attempts
	attempts += 1;
	show_debug_message("CrashR :: ERROR! Unexpected HTTP resonse code:" + string(http_response));
	break
}
	
if (i >= logs_length){ // End uploading if all files are uploaded.
	show_debug_message("CrashR :: Finished uploading " + string(logs_length) + " crash reports.")
	instance_destroy();	
}
	

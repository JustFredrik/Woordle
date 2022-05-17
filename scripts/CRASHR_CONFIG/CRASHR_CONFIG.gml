/*
CRASHR v 0.1

Change macros and the function at the bottom of this file to configure your CrashR expereince.
If you wish to do more changes you can dive into the scr_crashr file.
 */
 
// Base address to post crash reports to.
#macro CRASHR_DATABASE_ADRESS ("https://sampledatabase.databasewebsiteaddress.app/")

// Default Crash Message shown to Players when the game crashes.
#macro CRASHR_REPORT_MESSAGE ("The game has run into an unexpected error and will now exit.\n\n### Cause of Crash ###\n " + string(exception.message))

// Subdirectory path to POST the reports to
#macro CRASHR_TARGET_DATABASE_DIRECTORY ( CRASHR_LOCAL_FILE_NAME  + ".json")

// Crash report file naming convention
#macro CRASHR_LOCAL_FILE_NAME ( string(current_year) + "_" + string(current_month) + "_" + string(current_day) + "_" + string(current_hour) +"_"+ string(current_minute) +"_"+ string(current_second))

// Local directory path to save crash reports to
#macro CRASHR_LOCAL_DIRECTORY (working_directory + "/crash_reports/")

// Local directory path to temporarily save crash reports that have not yet been uploaded to
#macro CRASHR_LOCAL_TMP_DIR +  (working_directory + "/crash_reports_tmp/")

// The maximum amount of attempts that CrashR will try to upload files before giving up.
#macro CRASHR_MAX_CONNECT_ATTEMPT (5)

/// @func							crashr_generate_report(exception)
/// @desc							This function determines the contents of the crash report.
/// @param	exception	Exception passed into the report generator
function crashr_generate_report(_exception){
// Customize the return statement to change the format of the report.
#region Create sub structs

	var os_data_struct = {
			"os_version" : crashr_get_os_version_string(),
			"os_type" : crashr_get_os_type_string(),
			"os_language" : crashr_get_os_language_string()
	};
	
	var build_data_struct =  {
			"GM_build_date" : date_time_string(GM_build_date),
			"GM_runtime_version" : string(GM_runtime_version),
			"GM_version" : string(GM_version)
		};
		
	var game_data_struct = {
			"current_room" : room_get_name(room),
			"uptime" : current_time
	};
#endregion
	return  { // Return a Struct/JSON with the nested data
		
		"os_data" : os_data_struct,
		
		"build_data": build_data_struct,
		
		"game_data" : game_data_struct,
		
		"crash_data": _exception
	}
}
	

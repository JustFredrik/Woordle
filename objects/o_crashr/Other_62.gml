
var _id = async_load[? "id"];
if (_id = http_request_id){  // If the recieved http response is a response to the worker, then save the response.
	http_response = async_load[? "http_status"];
}


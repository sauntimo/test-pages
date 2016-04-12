component displayname="upload"{

	remote function upload( required string qqfile){

		var requestData = getHTTPRequestData();
		var response = {};
		response['filename'] = ARGUMENTS.qqfile;

		if( len( requestData.content ) ){
			FileWrite( getTempDirectory() & ARGUMENTS.qqfile, requestData.content);
		} else {
			response['success'] = false;
			response['msg'] = 'Failed to write file';
			
		}

		response['success'] = true;
		response['type'] = 'FORM';

		return response;
	}

}

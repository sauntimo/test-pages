
<cfoutput>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Test</title>
	<link href="/page/external/jquery/plugins/fileUploader/fileUploader.css" rel="stylesheet" />
</head>
<body>
	<h1>This is a test page</h1>
		
		<div id="myForm"></div>

		<img id="myImage" />

<script src="/page/external/jquery/plugins/fileUploader/fileUploader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>

	function createUploader(){
		var uploader = new qq.FileUploader({
			element: document.getElementById('myForm'),
			action: 'upload.cfc',
			params: {method: 'Upload', returnFormat: 'JSON'},
			onSubmit: function(id, fileName){
				// console.log('submit', id, fileName);
			},
			onProgress: function(id, fileName, loaded, total){
				// console.log('progress', id, fileName, loaded, total);
			},
			onComplete: showImage,
			onCancel: function(id, fileName){
				console.log('cancel', id, fileName);
			},
		});
	}

	function showImage( id, filename, json ) {
		var img = document.getElementById( 'myImage' );

		console.log( id, filename, json );

		$.ajax({
			method: 'GET',
			url: 'imageView.cfm?fileName=' + filename,
			success: function( data ) {
				console.log( data );
				img.src = data;
			}
		})
	}

	// in your app create uploader as soon as the DOM is ready
	// don't wait for the window to load
	window.onload = createUploader;

</script>


</body>
</html>

</cfoutput>

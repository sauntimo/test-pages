
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Page</title>

<!--- style --->
	<!--- Uncomment for bootstrap --->
	<!--- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"> --->
	<style>

		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body{
			font-family: helvetica, arial, sans-serif;
			padding: 20px;
		}

	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="container">

		<h1>New Page</h1>

		<p>Here is some text to go on the new page.</p>

	</div>
</cfoutput>

<!--- Javascript --->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<!--- Uncomment for bootstrap --->
	<!--- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> --->
	<script type="text/javascript">

		$(document).ready(function($) {
		

		});

	</script>
</body>
</html>

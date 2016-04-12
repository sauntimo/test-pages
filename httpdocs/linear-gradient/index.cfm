
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Linear Gradient</title>

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

		div.gradient{
			height: 300px;
			width: 300px;
			background: linear-gradient(to bottom, yellow 0px, yellow 100px),
						linear-gradient(to bottom, red 0px, yellow 200px);
			background-size: 300px 100px,
							 300px 200px;
			background-position: 0 0,
								 0 100px;
			background-repeat: no-repeat;
		}

	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="container">

		<h1>Linear Gradient</h1>

		<p>Here is some text to go on the new page.</p>

		<div class="gradient"></div>

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

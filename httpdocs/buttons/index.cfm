
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Buttons</title>

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
			background-color: #333333;
		}

		input{
			padding: 20px 40px 20px 20px;
			border: 1px solid white;
			color: white;
			font-size: 2rem;
		}

		input.background-color{
			background-color: #3B9FDA;
		}

		input.background{
			background-color: #3B9FDA;
			background: linear-gradient( to bottom, #3B9FDA 10%, #296699 90% );
		}

		input.background-image{
			background-color: #3B9FDA;
			background-image: url(/buttons/chevron-right.svg);
			background-size: 30px;
			background-repeat: no-repeat;
			background-position: right 0 top 50%;
		}

		input.both{
			background-color: #3B9FDA;
			background: linear-gradient( to bottom, #3B9FDA 10%, #296699 90% );
			background: url(/buttons/chevron-right.svg) right 0 top 50% / 30px 30px no-repeat,
						linear-gradient( to bottom, #3B9FDA 10%, #296699 90% ) center center / 100% 100% no-repeat;
		}

	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="container">

		<h1>Buttons</h1>

		<input class="normal" type="submit"><br /><br />

		<input class="background-color" type="submit"><br /><br />

		<input class="background" type="submit"><br /><br />
		
		<input class="background-image" type="submit"><br /><br />

		<input class="both" type="submit"><br /><br />


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

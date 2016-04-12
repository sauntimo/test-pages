
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Comcar Colours</title>

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

		.box{
			height: 200px;
			width: 200px;
			float: left;
			margin: 20px;
			border-radius: 10px;
			text-align: center;
			position: relative;
		}

		.box .caption{
			position: relative;
			top: 75px;
			color: white;
			font-size: 30px;			
		}

		.box1{
			background-color: #002f82;
		}

		.box2{
			background-color: #112360;
		}

		.box3{
			background-color: #0d195b;
		}

		.box4{
			background-color: #121c3d;
		}

		.box5{
			background-color: #110f2e;
		}

		.box6{
			background-color: #334088;
		}

		.box7{
			background-color: #0d195b;
		}

		.box8{
			background-color: #020726;
		}



	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="container">

		<h1>Comcar Colours</h1>

		<p>These are the colours on the comcar home page</p>

		<div class="box box1"><span class="caption">Lightest</span></div>
		<div class="box box2"><span class="caption">Lighter</span></div>
		<div class="box box3"><span class="caption">Primary</span></div>
		<div class="box box4"><span class="caption">Darker</span></div>
		<div class="box box5"><span class="caption">Darkest</span></div>


		<div class="box box6"><span class="caption">Lighter</span></div>
		<div class="box box7"><span class="caption">Primary</span></div>
		<div class="box box8"><span class="caption">Darker</span></div>

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

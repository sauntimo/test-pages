
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>:nth-child()</title>

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

		div.container{
			height: 150px;
			width: 650px;
			padding: 10px;
			border: 2px solid #333333;
			margin: 20px;
			background-color: #cccccc;
		}


		/* Normal Red Boxes */
		.container > .box{
			height: 100px;
			width: 100px;
			padding-top: 10px;
			margin: 10px;
			border: 2px solid #333333;
			float: left;
			text-align: center;
			font-size: 4rem;
			-webkit-text-stroke: 2px black;
			color: white;
			background-color: yellow;
			border-radius: 20px 0 0 20px;
		}

		/* Starter Yellow Boxes */
		.container > .box ~ .box{
			background-color: red;
			color: black;
			border-radius: 0;
		}

		/* Final Blue Boxes */
		.container .box:last-of-type{
			background-color: blue;
			color: white;
			border-radius: 0 20px 20px 0;
		}

		/* Single Green Boxes */
		.container .box:only-of-type{
			background-color: green;
			color: white;
			border-radius: 20px;
		}
		


	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>

		<div class="container container1">
			<div class="phantom">Naughty 1</div>
			<div class="box box1">1</div>
			<div class="box box2">2</div>
			<div class="box box3">3</div>
			<div class="box box4">4</div>
			<div class="box box5">5</div>
			<!--- <div class="phantom">Naughty 2</div> --->
		</div>

		<div class="container container2">
			<div class="box box1">1</div>
			<div class="box box2">2</div>
			<div class="box box3">3</div>
		</div>

		<div class="container container3">
			<div class="box box1">1</div>
			<div class="box box2">2</div>
		</div>

		<div class="container container4">
			<div class="box box1">1</div>
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

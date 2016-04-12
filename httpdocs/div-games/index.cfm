
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Div Height Games</title>

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
			position: absolute;
			top: 0;
			bottom: 0;
		}
	
		div.box{
			float: left;
			padding: 5px;
			border: 2px solid #ccc;
		}

		div.body{
			position: absolute;
			top: 0;
			bottom: 0;
		}

		div.container{
			/*height: 400px;*/
			width: 400px;
			position: relative;
		}

		div.content{
			position: relative;
		}

		div.content1{
			height: 300px;
		}

		div.content2{
			height: 2000px;
		}

		div.footer{
			position: absolute;
			bottom: 0;
			clear: both;
		}


	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<!--- <div class="container"> --->

		<div class="box body">
	
			<div class="box container">

				<div class="box content content1">Content 1</div>
				<div class="box content content2">Content 2</div>

			</div>

			<div class="box footer">Footer</div>

		</div>

	<!--- </div> --->
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

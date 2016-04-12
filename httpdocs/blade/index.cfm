
<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Blade Test</title>

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
			padding: 5px;

		}

		.box p{
			float: left;
			clear: left;
		}

		.channel-header,
		.channel-top-nav,
		.page-content,
		.channel-bottom-nav,
		.channel-footer{
			float: left;
			clear: left;
		}

		.body{
			position: relative;
			max-width: 1300px;
			margin: 0 auto;
		}

		.channel-header{
			width: 100%;
			height: 100px;
			background-color: lightblue;
		}

		.channel-top-nav{
			background-color: aquamarine;
			max-width: 1000px;
			height: 50px;
		}

		.page-content{
			background-color: deepskyblue;
			max-width: 1000px;
			/*height: 700px;*/
		}

		.content-box{
			float: left;
			margin: 10px;
			padding: 10px;
			height: 250px;
			width: 250px;
			background-color: royalblue;
		}


		.channel-bottom-nav{
			background-color: palevioletred;
			max-width: 1000px;
			height: 50px;
		}

		.channel-footer{
			background-color: yellow;
			max-width: 1300px;
			height: 50px;
		}

		.channel-skyscraper{
			width: 300px;
			height: 800px;
			background-color: lime;
			float: right;
			clear: none;
		}

	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="body box">

		<div class="channel-header box">
			<p>div.channel-header</p>
		</div>

		<div class="channel-skyscraper box">
			<p>div.channel-skyscraper</p>
		</div>

		<div class="channel-top-nav box">
			<p>div.channel-top-nav</p>
		</div>

		<div class="page-content box">
			<!--- <p>div.page-content</p> --->

			<div class="content-box cb1">div.content-box 1</div>
			<div class="content-box cb2">div.content-box 2</div>
			<div class="content-box cb3">div.content-box 3</div>
			<div class="content-box cb4">div.content-box 4</div>
			<div class="content-box cb5">div.content-box 5</div>
			<div class="content-box cb6">div.content-box 6</div>

		<div class="channel-bottom-nav box">
			<p>div.channel-bottom-nav</p>
		</div>
		


		<div class="channel-footer box">
			<p>div.channel-footer</p>
		</div>


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


<!--- cfscript --->
<cfscript>
	
</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Footer Games</title>

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

		html,
		body {
			margin:0;
			padding:0;
			height:100%;
		}

		h1, p{
			padding: 20px;
		}

		.wrapper {
			min-height:100%;
			position:relative;
		}

		.header {
		}

		.content {
			padding-bottom:100px;   /* Height of the footer element */
		}

		.footer {
			width:100%;
			height:100px;
			position:absolute;
			bottom:0;
			left:0;
			background-color: #666666;
		}

		.footer p{
			color: white;
		}




	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="wrapper">

		<div class="header">
			<h1>Footer Games</h1>
		</div>

		<div class="content"> <!--- http://www.cipsum.com/ --->
			<p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>

			<p>Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.</p>

			<p>Completely synergize resource taxing relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service.</p>

			<p>Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.</p>
		</div>

		<div class="footer">
			<p>This is the footer text</p>
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

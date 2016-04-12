
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
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<style>

/*		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}*/

		body{
			font-family: helvetica, arial, sans-serif;
			padding: 5px;

		}

/*		.channel-header,
		.channel-top-nav,
		.page-content,
		.channel-bottom-nav,
		.channel-footer{
			float: left;
			clear: left;
		}
*/
		.body{
			max-width: 1300px;
			margin: 0 auto;
		}

		.channel-header{
			background-color: #0d195b;
		}


		.title{
			margin: 0;
			text-align: right;
			color: white;
			font-weight: bold;
		}

		.site-title{
			font-size: 50px;
		}

		.site-sub-title{
			font-size: 30px;
		}

		.channel-top-nav{
			background-color: aquamarine;
		}

		.page-content{
			background-color: deepskyblue;
		}

		.intro,
		.outro{
			background-color: royalblue;
		}

		.content-box{
			height: 150px;
			margin: 10px;
			padding: 10px;
			background-color: royalblue;
		}

		.channel-bottom-nav{
			background-color: palevioletred;
		}

		.channel-footer{
			background-color: yellow;
		}

		.channel-skyscraper{
			background-color: lime;
			float: right;
		}

		.ad-content{
			margin: 10px;
			padding: 10px;
			background-color: darkgreen;
		}

		.news{
			height: 250px;
			margin: 10px;
			padding: 10px;
			background-color: royalblue	;
		}

		.mpu .ad-content{
			height: 250px;
		}

		.tall .ad-content{
			background-color: darkgreen;
			height: 360px;
		}


	</style>

</head>
<body>

<!--- Markup --->
<cfoutput>
	<div class="body box">

		<div class="row">
			<div class="channel-header box col-sm-12">
				<p class="title site-title">comcar.co.uk</p>
				<p class="title site-sub-title">company car tax</p>
			</div>
		</div>

		<div class="row">
			<div class="channel-skyscraper box clearfix col-lg-3 col-md-4 hidden-sm hidden-xs">
				<cfinclude template="skyscraper-content.inc.cfm">
			</div>

			<div class="channel-top-nav box col-lg-9 col-md-8 col-sm-12">
				<p>div.channel-top-nav</p>
			</div>

			<div class="page-content box col-lg-9 col-md-8 col-sm-12">
				<div class="row">
					<div class="col-lg-12">
						<div class="intro">
							<h1>Welcome to Comcar</h1>
							<p>This is a website about stuff for people who need things.</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb1">div.content-box 1</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb2">div.content-box 2</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb3">div.content-box 3</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb4">div.content-box 4</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb5">div.content-box 5</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content-box cb6">div.content-box 6</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="outro">
							<p>This is some more information.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="channel-skyscraper box clearfix hidden-lg hidden-md col-sm-12 col-xs-12">
				<cfinclude template="skyscraper-content.inc.cfm">
			</div>


			<div class="channel-bottom-nav box col-lg-9 col-md-8 col-sm-12 col-xs-12">
				<p>div.channel-bottom-nav</p>
			</div>
		</div>		

		<div class="row">
			<div class="channel-footer box col-sm-12">
				<p>div.channel-footer</p>
			</div>
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

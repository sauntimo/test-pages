<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JS Tabs</title>

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

		.hidden{
			display: none;
		}

		div.container{
			position: absolute;
			width: 500px;
			height: 500px;
		}

		div.label-container{
			float: left;
		}

		div.label{
			z-index: 1;
			position: relative;
			top: 6px;
			display: block;
			float: left;
			font-size: 20px;
			padding: 14px 21px;
			border-radius: 5px 5px 0 0;
			border: 1px solid #ddd;
			border-bottom: none;
			cursor: pointer;
		}

		div.label.active{
			z-index: 100;
			top: 1px;
			border-color: lightblue;
			background-color: white;
		}

		div.label:not(.active):hover{
			background: #eee;
		}

		div.tab-container{
			position: relative;
			clear: left;
			float: left;
			width: 100%;
			height: 90%;
		}

		div.tab-content{
			z-index: 20;
			float: left;
			clear: left;
			padding: 25px;
			border-top: 1px solid lightblue;
			background-color: white;
			position: absolute;
			top: 0;
		}

		div.tab-content.active{
			z-index: 50;
			height: 100%;
		}

		div.tab-content:not(.active){
			z-index: 10;
		}


	</style>

</head>
<body>
	
	<div class="container">

		<div class="label-container">
	
			<div class="label active" data-tab="1">Tab 1</div>
			<div class="label" data-tab="2">Tab 2</div>
			<div class="label" data-tab="3">Tab 3</div>
		
		</div>

		<div class="tab-container">
	
			<div id="tab-content1" class="tab-content active">
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
			</div>

			<div id="tab-content2" class="tab-content">
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
			</div>

			<div id="tab-content3" class="tab-content">
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
			</div>

		</div>

	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

	<script type="text/javascript">

		$(document).ready(function($) {
		
			$('div.label').click(function(event) {
				
				var tab = $(this).data('tab');

				$('.active').removeClass('active');
				$(this).addClass('active');
				$('div#tab-content' + tab).addClass('active');

			});

		});

	</script>
</body>
</html>
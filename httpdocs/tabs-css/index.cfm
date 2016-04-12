<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CSS tabs</title>

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
	
		div.tab-container{
			position: absolute;
			width: 500px;
		}

		.tab{
			float: left;
			display: block;
		}

		input[type="radio"] {
			position: absolute;
			top: -9999px;
			left: -9999px;
		}

		.tab label{
			top: 6px;
			display: block;
			padding: 14px 21px;
			border-radius: 5px 5px 0 0;
			border: 1px solid #ddd;
			border-bottom: none;
			font-size: 20px;
			cursor: pointer;
			position: relative;
			background-color: white;
		}

		.tab label:hover{
			background: #eee;
		}
	
		input[id^="tab"]:checked + label {
			top: 1px;
			z-index: 10;
			border: 1px solid lightblue;
			border-bottom: none;
			background: white;
		}

		div.tab-content {
			z-index: 2;
			display: none;
			overflow: hidden;
			padding: 25px;
			position: absolute;
			left: 0;
			border-top: 1px solid lightblue;
			background-color: white;
		}

		input[id^="tab"]:checked ~ div[id^="tab-content"] {
			display: block;
		}

	</style>

</head>
<body>

	<div class="tab-container">

		<div class="tab">
			<input type="radio" name="tabs" id="tab1" checked />
			<label for="tab1">Tab 1</label>
			<div id="tab-content1" class="tab-content">
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
				<p>Tab ONE Text. Tab ONE Text. Tab ONE Text. Tab ONE Text.</p><br />
			</div>
		</div>

		<div class="tab">
			<input type="radio" name="tabs" id="tab2"/>
			<label for="tab2">Tab 2</label>
			<div id="tab-content2" class="tab-content">
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
				<p>Tab TWO Text. Tab TWO Text. Tab TWO Text. Tab TWO Text.</p><br />
			</div>
		</div>
	
		<div class="tab">
			<input type="radio" name="tabs" id="tab3"/>
			<label for="tab3">Tab 3</label>
			<div id="tab-content3" class="tab-content">
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
				<p>Tab THREE Text. Tab THREE Text. Tab THREE Text. Tab THREE Text.</p><br />
			</div>
		</div>

	</div>

</body>
</html>
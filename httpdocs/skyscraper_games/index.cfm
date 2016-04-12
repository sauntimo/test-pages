<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>blerg</title>
	
		<style type="text/css">
	
			div.box{
				width: 300px;
				height: 300px;
				border: 2px solid black;
				padding: 10px;
				box-sizing: border-box;
				float: left;
				font-size: 2.2em;
				font-family: helvetica, arial, sans-serif
			}

			div.container{
				width: 1500px;
				height: 1000px;
				padding: 0;
				background-color: #333;
			}

			div.sky{
				height: 200px;
				/*position: absolute;*/
				bottom: 0;
				background-color: red;
				float: right;
			}

			div.content{
				float: left;
				background-color: blue;
				/*width: 100%;*/
			}

			div.c2{
				clear: left;
			}

		</style>
	
</head>


<body>

	<div class="box container">

		<div class="box sky">sky box</div>

		<div class="box content c1">content box 1</div>

		<div class="box content c2">content box 2</div>

	</div>


</body>
</html>
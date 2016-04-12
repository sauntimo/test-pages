<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CSS Radial Gradient Experiment</title>

	<style type="text/css">

		div.box1{
			height: 314px;
			width: 1000px;
			margin: 20px;
			border: 1px solid #333;

			background-color: #fff;
			background-image: radial-gradient(circle 1000px at top left , #fff 0%, #fff 10%,  #333 100%);
			filter:progid:DXImageTransform.Microsoft.Alpha(opacity=100, finishopacity=0, style=2);
			-ms-filter: "progid:DXImageTransform.Microsoft.gradient (GradientType=0, startColorstr=#1471da, endColorstr=#1C85FB)";

		}

	</style>

</head>
<body>
	
	<h1>Hello Radial Gradient</h1>

	<div class="box1"></div>


</body>
</html>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Susy Grid</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="body">
	<div class="header">
		<h1>Susy Grid</h1>
	</div>
	<div class="content">
		<div class="container">
			<div class="gallery">
				<div class="gallery__item item1"><span class="caption">item1</span></div>
				<div class="gallery__item item2"><span class="caption">item2</span></div>
				<div class="gallery__item item3"><span class="caption">item3</span></div>
				<div class="gallery__item item4"><span class="caption">item4</span></div>
				<div class="gallery__item item5"><span class="caption">item5</span></div>
				<div class="gallery__item item6"><span class="caption">item6</span></div>
				<!--- (div.gallery__item.item$>span.caption{item$})*12 --->
				<div class="intro">
					<span>
						Welcome to this demo page. I'm using SASS plugin called Susy
						 to generate a grid and grunt to run a task to compile the 
						 SCSS in to good old normal CSS.
					</span>
				</div>
			</div>

			<div class="sidebar">
			</div>
		</div>
	</div>
	<div class="footer">
		<span>footer text.</span>
	</div>
</div>
</body>
</html>

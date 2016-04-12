<!DOCTYPE html>
<html class="responsive-games">
	<head>
		<meta charset="UTF-8">
		<title>Responsive Games</title>
		<link href="/responsive/css/style.css" rel="stylesheet">
	</head>

	<body>

	<header>
		<div id="logo"></div>
		<h1>Some Company</h1>
		
		<div id="contact-details">
			<address id="address">
				<a href="https://maps.google.co.uk/?q=SW1A+0AA">
					<span class="headBlocks street-address">100 Main Street</span>
					<span class="headBlocks street-address">London</span>
					<span class="headBlocks street-address">SW1A 0AA</span>
					<span class="headBlocks map-link">map</span>
				</a>
			</address>
			<div id="other-contacts">
				<span class="headBlocks">
					<a href="tel:+441234567891">
						<span class="shortVersion">phone us</span>
						<span class="longVersion">+44 (0)1234 567891</span>
					</a>
				</span>
				<span class="headBlocks">
					<a href="mailto:hello@somecompany.com">
						<span class="shortVersion">email us</span> 
						<span class="longVersion">hello@somecompany.com</span>
					</a>
				</span>
			</div>
		</div>

	</header>

	<div id="main-wrapper">

		<div id="main-content">

			<!--- 
				table>caption{Example Table}+thead>(tr>th{Heading $}*4)+tbody>(tr>(td.col${Cell $}*4))*6 
			--->

			<table>
				<caption>Example Responsive Table</caption>
				<thead>
					<tr>
						<th class="col-model tbl-text">Model</th>
						<th class="col-colour tbl-text">Colour</th>
						<th class="col-price tbl-numeric">Price (£)</th>
						<th class="col-age tbl-numeric">Age (Years)</th>
					</tr>
					<tbody>
						<tr>
							<td class="col-model tbl-text">Model A</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample grey"></div>
								<span class="colour-span">Grey</span>
							</td>
							<td class="col-price tbl-numeric">6,000</td>
							<td class="col-age tbl-numeric">2</td>
						</tr>
						<tr>
							<td class="col-model tbl-text">Model B</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample blue"></div>
								<span class="colour-span">Blue</span>
							</td>
							<td class="col-price tbl-numeric">10,000</td>
							<td class="col-age tbl-numeric">1</td>
						</tr>
						<tr>
							<td class="col-model tbl-text">Model C</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample green"></div>
								<span class="colour-span">Green</span>
							</td>
							<td class="col-price tbl-numeric">8,500</td>
							<td class="col-age tbl-numeric">2</td>
						</tr>
						<tr>
							<td class="col-model tbl-text">Model D</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample yellow"></div>
								<span class="colour-span">Yellow</span>
							</td>
							<td class="col-price tbl-numeric">15,000</td>
							<td class="col-age tbl-numeric">1.5</td>
						</tr>
						<tr>
							<td class="col-model tbl-text">Model E</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample orange"></div>
								<span class="colour-span">Orange</span>
							</td>
							<td class="col-price tbl-numeric">20,000</td>
							<td class="col-age tbl-numeric">5</td>
						</tr>
						<tr>
							<td class="col-model tbl-text">Model F</td>
							<td class="col-colour tbl-text">
								<div class="colour-sample red"></div>
								<span class="colour-span">Red</span>
							</td>
							<td class="col-price tbl-numeric">12,000</td>
							<td class="col-age tbl-numeric">3</td>
						</tr>
					</tbody>
				</thead>
			</table>
		

		</div>

		<div id="side-bar">
			<a href="/responsive/" class="side-bar-box">
				<h3>Home</h3>
				<div class="fake-picture"></div>
			</a>
			<a href="/responsive/table/" class="side-bar-box">
				<h3>Table</h3>
				<div class="fake-picture"></div>
			</a>
			<a href="/responsive/" class="side-bar-box">
				<h3>Other</h3>
				<div class="fake-picture"></div>
			</a>
		</div>


	</div>
	
	<footer>
		<p>&#169; 2015 Some Company</p>
	</footer>

	</body>
</html>
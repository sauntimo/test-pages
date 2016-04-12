<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Test Page</title>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/styles.css">

		<cfscript>

		function buildSites(){


			VARIABLES.arrDomains = [
				{"type"  = "L", 
				 "prefix" = "http://"},
				{"type"  = "S", 
				 "prefix" = "http://d5114."},
				{"type"  = "D", 
				 "prefix" = "http://d51ts."}
			];

			VARIABLES.arrSites = [ 
				{"name" = "Carmen Data",
				 "url" = "carmendata.co.uk"},
				{"name" = "Squirrel",
				 "url" = "squirrel.comcar.co.uk"},
				{"name" = "Comcar",
				 "url" = "comcar.co.uk"},
				{"name" = "Rates Panel",
				 "url" = "ratespanel.co.uk"},
				{"name" = "Fleet World",
				 "url" = "fleetworld.co.uk"},
				{"name" = "CBVC",
				 "url" = "toolbox.cbvcvehiclemanagement.co.uk"},
				{"name" = "Kia",
				 "url" = "kia.comcar.co.uk"},
				{"name" = "Seat",
				 "url" = "seat.comcar.co.uk"},
				{"name" = "Vauxhall",
				 "url" = "vauxhall.comcar.co.uk"},
				{"name" = "Fordquote",
				 "url" = "fordquote.comcar.co.uk"},
				{"name" = "Mazda Demo",
				 "url" = "mazda.demo.comcar.co.uk"}
			];

			var numSites = arrayLen(arrSites);
			var numDomains = arrayLen(arrDomains);
			var strHTML = '<div class="table sites"><div class="tbody">';
			for( var i = 1; i LTE numDomains; i++ ){
				strHTML &= '<div class="row">';
				for( var j = 1; j LTE numSites; j++ ){ 
					strHTML &= '<div class="cell type-' & arrDomains[i]['type'] & ' group-' & j & '"><a href="' & arrDomains[i]['prefix'] & arrSites[j]['url'] & '">' & arrSites[j]['name'] & ' [' & arrDomains[i]['type'] & ']</a></div>';
				} 
				strHTML &= '</div>';
			}
			strHTML &= '</div></div>';
			return strHTML;
		}			
		</cfscript>
	</head>
	<body>
		<h1>// Test Page</h1>

		<cfdirectory
		action="list"
		directory="#ExpandPath( './' )#"
		recurse="false"
		listinfo="name"
		sort="name asc"
		name="qFile"
		type="dir"
		/>
		
		<div class="section experiments">
			<h2>Experiments</h2>

			<cfoutput>
				<div class="test_pages">
					<cfloop query="qFile">
						<cfif !ArrayFind( ['Packages', 'node_modules', 'js', 'css', 'page' ], qFile.name) >
							<a class="test_page" href="#qFile.name#/index.cfm">#ReReplace(qFile.name, '-', ' ', 'ALL')#</a>
						</cfif>
					</cfloop>
				</div>
			</cfoutput>
		</div>

		<div class="section common_destinations">
			<h2>Common Destinations</h2>
			<cfoutput>#buildSites()#</cfoutput>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>

	</body>
</html>

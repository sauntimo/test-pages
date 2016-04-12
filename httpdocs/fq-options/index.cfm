
<cfscript>
	
	URL.fmake = 'Kia';
	URL.fmodel = 'Picanto 5 Door';
	URL.fderv = '1.0 1 65hp';
	URL.id = 1599141;

</cfscript>



<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Finance Quote Options Test</title>
	</head>
	<body>
		
		<div class="vehicleOptionsDetails">

			<h1>Finance Quote Options Test</h1>

			<ul>
				<li><cfdump var="#URL.fmake#"></li>
				<li><cfdump var="#URL.fmodel#"></li>
				<li><cfdump var="#URL.fderv#"></li>
				<li><cfdump var="#URL.id#"></li>
			</ul>
			
		</div>

		<cfinclude template="/newcar/companycar/taxcalc/g3options.cfm">

	</body>
	</html>
</cfoutput>

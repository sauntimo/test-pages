<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Query Example</title>
	
	<style type="text/css">

		div.item_list {
			list-style: none;
		}
	
		div.item_list div.item{ 
			display: inline-block;
			padding: 5px;
			margin: 5px;
			border-radius: 3px;
			background-color: #eee;
		}

	</style>
	

	<cfscript>
		
		VARIABLES.makesQry = new query(datasource=application.db.comcar);
	
		VARIABLES.strQuery = 	'SELECT DISTINCT
									acc.`make`
								FROM
									`allcars`.`cars` AS acc
								ORDER BY
									acc.`make` ASC';

		VARIABLES.makesQry.setSQL(VARIABLES.strQuery);

		VARIABLES.makesResults = VARIABLES.makesQry.execute().getResult();

	</cfscript>

</head>
<body>

	<h1>Query Example</h1>	
		<div class="item_list">
		<cfloop index="i" from="1" to="#makesResults.recordCount#">
			<cfoutput>
				<div class="item"><a href="http://d51ts.comcar.co.uk/hub/#makesResults['make'][i]#">#makesResults['make'][i]#</a></div>
			</cfoutput>
		</cfloop>
		</div>
	
</body>
</html>


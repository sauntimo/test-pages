<cfscript>

param name="strTest" type="string" default="Test article. [symbol|encoded] ampersand [&|&amp;] Pound sign [£|&pound;]";

objStringUtils = new core.utility.string(); 



</cfscript>

<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>String Utils</title>
	</head>
	<body>
		<h1>String Utils</h1>
		
		<p>#strTest#</p>

		<p>#objStringUtils.toHtmlCharReference(strTest)#</p>

	</body>
	</html>
</cfoutput>

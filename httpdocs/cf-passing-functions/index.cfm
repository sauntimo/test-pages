<cfscript>
		
	function printGreeting(required string name, required fnGreeting){
		return ARGUMENTS.fnGreeting( ARGUMENTS.name );
	};

	function greeting1( required string name ){
		return 'Hello, ' & ARGUMENTS.name & ', and how are you today?';
	};

	function greeting2( required string name ){
		return 'Top o'' the mornin'' to ya, ' & ARGUMENTS.name & ', you be having a crackin'' day now boyo.';
	};

</cfscript>

<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Cold Fusion Function Test</title>
	</head>
	<body>
		<h1>#printGreeting('Tim', greeting1 )#</h1>
	</body>
	</html>
</cfoutput>

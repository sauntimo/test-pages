<cfscript>
	

	list1 = 'one,two,three,four,five';
	list2 = listDeleteAt(list1, 4, ',');
	list3 = listDeleteAt(list1, listFind(list1, 'three', ','), ',');
	list4 = listAppend(list1, 'six', ',');

</cfscript>

<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Cold Fusion Function Test</title>
	</head>
	<body>
		<p>#list1#</p>
		<p>#list2#</p>
		<p>#list3#</p>
		<p>#list4#</p>
	</body>
	</html>
</cfoutput>

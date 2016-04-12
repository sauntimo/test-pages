<cfscript>

	// Get 12 News Articles
	config['count'] 		= 12;
	config['type'] 			= 'News';
	objNewsArticles 		= new core.editor.articlePreviews(config);

	writeDump(objNewsArticles);

</cfscript>


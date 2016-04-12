<cfscript>
	param name="URL.clk" default="1";
	
	param name="showGoogleAd" default="false";
	param name="forecourtWidgetOnPage" default=false;

	// page parameters
	param name="page.channelSetupIncluded" default=false;
	param name="page.title" default="";
	param name="page.content" default="";
	param name="page.css" default="";
	param name="page.cssConcat" default="";
	param name="page.js" default="";
	param name="page.jsConcat" default="";
	param name="page.metadesc" default="";
	param name="page.metakey" default="";
	param name="page.metanewskeywords" default="";

	param name="page.layout" default="baselayout.inc.cfm";

	// NOTE: Deprecating strToolClassName, use page.htmlElemClass instead
	param name="strToolClassName" default="tool-generic"; 
	param name="page.htmlElemClass" default="";

	if( Len(page.htmlElemClass) ){
		strToolClassName = page.htmlElemClass;
	}

	param name="channelInt_pageTitle" default="#page.title#";
	param name="metadesc" default="#page.metadesc#";
	param name="metakey" default="#page.metakey#";


	// include channel decoder, and decode
	objChannelDecoder = new core.channel.decoder();

	// include channel setup
	if(
		objChannelDecoder.getIncludeSetup() != '' &&
		page.channelSetupIncluded == false
	) {
		include "#objChannelDecoder.getIncludeSetup()#";
	}
	
	// Check tool is valid on this channel. If not, relocate to an appropriate channel
	objValidTools = new core.channel.validTools( objChannelDecoder.getClk() );
	checkTool = objValidTools.isValidChannelTool(CGI.SCRIPT_NAME,CGI.QUERY_STRING);

	if(checkTool.valid) {
		objUser = new core.user();
		if( objValidTools.isLoginRequired( CGI.SCRIPT_NAME ) && !objUser.checkloggedIn() ) {
			location('/profile?ref=#CGI.SCRIPT_NAME#',false);	
		}
	} else {
		location( checkTool.relocate,false );	
	}

	// Does the forecourt widget go in this page
	forecourtWidgetOnPageAndChannel = (
		forecourtWidgetOnPage	/* Page allows widget */
		&&
		objChannelDecoder.getObjMiscSetup().forecourtWidget.active	/* Channel allows widget */
	);

	// create an instance of the User component (if needed)
	//objUser = new core.user();
</cfscript>

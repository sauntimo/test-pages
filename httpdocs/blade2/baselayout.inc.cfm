
<!DOCTYPE html>
<cfoutput>
	<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7 #strToolClassName#"><![endif]-->
	<!--[if IE 7]><html class="lt-ie9 lt-ie8 #strToolClassName#"><![endif]-->
	<!--[if IE 8]><html class="lt-ie9 #strToolClassName#"><![endif]-->
	<!--[if gt IE 8]><!--><html class="#strToolClassName#" lang="en"><!--<![endif]-->
	<head>

<!--
   ____                                  ____        _        
  / ___|__ _ _ __ _ __ ___   ___ _ __   |  _ \  __ _| |_ __ _ 
 | |   / _` | '__| '_ ` _ \ / _ \ '_ \  | | | |/ _` | __/ _` |
 | |__| (_| | |  | | | | | |  __/ | | | | |_| | (_| | || (_| |
  \____\__,_|_|  |_| |_| |_|\___|_| |_| |____/ \__,_|\__\__,_|
 
 This website was built by Carmen Data Ltd http://carmendata.co.uk 
-->                                                             

		<title><cfif Len(page.title)>#reReplace(page.title, '<[^>]*>', '', 'all')# | </cfif>#objChannelDecoder.getTitlePrepend()#</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<cfif Len(metadesc)>	
			<meta name="description" content="#metadesc#" />
		</cfif>
		<cfif Len(metakey)>
			<meta name="keywords" content="#metakey#" />
		</cfif>

		<cfif Len(page.metanewskeywords)>
			<meta name="news_keywords" content="#page.metanewskeywords#">
		</cfif>


		<cfinclude template="openGraphTags.inc.cfm">

		<cfinclude template="/newcar/assets/code/iHead.cfm">
		<cfinclude template="/newcar/standardNames.cfm">

		<!--- ATTENTION! Before adding includes/imports, refer to the "HTML Head Include Standards" Wiki entry, http://wiki.carmendata.co.uk/index.php?HTML_Head_Include_Standards --->
		
		
		
		<!--- include channel head if available --->
		<cfif objChannelDecoder.getIncludeHead() IS NOT "">
			<cfinclude template="#objChannelDecoder.getIncludeHead()#" />
		</cfif>
		
		<!--- Page stylesheets --->
		<cfif page.css NEQ ''>
			<cfinclude template="#page.css#">
		</cfif>

		<!--- Forecourt widget stylesheet --->
		<cfif forecourtWidgetOnPageAndChannel>
			<link href="/advanced/forecourt/widget/css/forecourt_widget.css" rel="stylesheet" type="text/css" />
		</cfif>

		<!--- include channel styles if available --->
		<cfif objChannelDecoder.getStyleSheet() IS NOT "">
			<cfset cssHref = "#objChannelDecoder.getStyleSheet()#">
			<!--- Append cssConcat --->
			<cfif len(page.cssConcat)>
				<cfif find('?', cssHref)>
					<cfset cssHref &= '&'>
				<cfelse>
					<cfset cssHref &= '?'>
				</cfif>
				<cfset cssHref &= 'concat=#page.cssConcat#'>
			</cfif>

			<link href="#cssHref#" rel="stylesheet" type="text/css" />
		</cfif>

		<!--- include google ad setup script if set true in channel setup --->
		<cfif showGoogleAd>
			<script type="text/javascript" src="http://partner.googleadservices.com/gampad/google_service.js"></script>
			<script type="text/javascript">
				GS_googleAddAdSenseService("ca-pub-9876074324849028");
				GS_googleEnableAllServices();

				var googletag = googletag || {};
				googletag.cmd = googletag.cmd || [];
				(function() {
					var gads = document.createElement('script');
					gads.async = true;
					gads.type = 'text/javascript';
					var useSSL = 'https:' == document.location.protocol;
					gads.src = (useSSL ? 'https:' : 'http:') + 
					'//www.googletagservices.com/tag/js/gpt.js';
					var node = document.getElementsByTagName('script')[0];
					node.parentNode.insertBefore(gads, node);
				})();
			</script>
		</cfif>			
	</head>
	<body class="default borderless">
		<div class="main">
			<cfif Len( objChannelDecoder.getIncludeHeader() )>	
				<cfinclude template="#objChannelDecoder.getIncludeHeader()#">
			</cfif>
			<div class="main-left">
				<cfif Len( objChannelDecoder.getIncludeNav() )>	
					<cfinclude template="#objChannelDecoder.getIncludeNav()#">
				</cfif>
				<div class="body">
					<!--- TOOL CONTENT GOES HERE --->
					<cfif page.content NEQ ''>
						<cfinclude template="#page.content#">
					</cfif>
				</div>
				<cfif Len( objChannelDecoder.getIncludeBottomnav() )>	
					<cfinclude template="#objChannelDecoder.getIncludeBottomnav()#">
				</cfif>
			</div>
			<div class="main-right">
				<cfif Len( objChannelDecoder.getIncludeSkyscraper() )>	
					<cfinclude template="#objChannelDecoder.getIncludeSkyscraper()#">
				</cfif>
			</div>
			<cfif Len( objChannelDecoder.getIncludeFooter() )>	
				<cfinclude template="#objChannelDecoder.getIncludeFooter()#">
			</cfif>
		</div>
		
		<!--- Page JavaScript --->
		<cfif page.js NEQ ''>
			<cfinclude template="#page.js#">
		</cfif>

		<script type="text/javascript" src="/newcar/assets/commonjs/behaviour.js"></script>

		<!--- Forecourt widget JavaScript --->
		<cfif forecourtWidgetOnPageAndChannel>
			<script type="text/javascript" src="/advanced/forecourt/widget/js/fcw.js"></script>
		</cfif>

		<!--- include channel js if available --->
		<cfif objChannelDecoder.getJavascript() IS NOT "">
			<cfinclude template="#objChannelDecoder.getJavascript()#" />
		</cfif>	

		<cfscript>
			param name = 'isDev' default = false;

			objServer = new core.server();
			isDev = objServer.isDev();
		</cfscript>
		
		<!--- include browsersync code if we're running locally --->
		<cfif isDev EQ true>
			<script type='text/javascript' id="__bs_script__">//<![CDATA[
		    	document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.2.11.1.js'><\/script>".replace("HOST", location.hostname));
		//]]></script>			
		</cfif>

	</body>
</cfoutput>	
</html>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Channel Experiemnt</title>
	
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

	<cfscript>
		
		VARIABLES.defaultsQry = new query(datasource=application.db.comcar);
		VARIABLES.strQuery = 	'SELECT 
									csd.`setup_defaults_id` AS id,
									csd.`variable`,
									csd.`value`,
									csd.`parent`,
									csd.`type`
								FROM
									`channels`.`setup_defaults` AS csd
								ORDER BY
									id ASC';
		VARIABLES.defaultsQry.setSQL(VARIABLES.strQuery);
		VARIABLES.defaultsQryResults = VARIABLES.defaultsQry.execute().getResult();

		VARIABLES.skvAncestry = buildStructOfAncestry( defaultsQryResults );
		VARIABLES.skvDefaults = buildDefaultStruct( defaultsQryResults );

		VARIABLES.channelsQry = new query(datasource=application.db.comcar);
		VARIABLES.strQuery = 	'SELECT 
									csc.`channel_id` AS id,
									csc.`setup_defaults_id`,
									IFNULL(csc.`value`,"NULL") as value
								FROM
									`channels`.`setup_channel` AS csc
								ORDER BY
									id ASC';
		VARIABLES.channelsQry.setSQL(VARIABLES.strQuery);
		VARIABLES.channelsQryResults = VARIABLES.channelsQry.execute().getResult();

		VARIABLES.channels_defaultsQry = new query(datasource=application.db.comcar);
		VARIABLES.strQuery = 	'SELECT 
									csc.`channel_id` AS id,
									csc.`setup_defaults_id`,
									csd.`variable`,
									IFNULL(csc.`value`,"NULL") as value
								FROM
									`channels`.`setup_channel` AS csc
								LEFT JOIN `channels`.`setup_defaults` as csd ON csc.`setup_defaults_id` = csd.`setup_defaults_id`
								ORDER BY
									id ASC';
		VARIABLES.channels_defaultsQry.setSQL(VARIABLES.strQuery);
		VARIABLES.channels_defaultsQryResults = VARIABLES.channels_defaultsQry.execute().getResult();


		private struct function buildStructOfAncestry( required query qryRes ){
			skvReturn = {};
			for( i = 1; i LTE ARGUMENTS.qryRes.recordCount; i++ ){
				skvReturn[ARGUMENTS.qryRes['id'][i]] = {
					'id' = ARGUMENTS.qryRes['id'][i],
					'parent' = ARGUMENTS.qryRes['parent'][i]
				};
			}
			return skvReturn;
		}

		private array function buildArrPathToAncestor( required numeric descendantID, required array arrPath ){
			var arrNewPath = ARGUMENTS.arrPath;
			arrayPrepend(arrNewPath, ARGUMENTS.descendantID);
			if( len(VARIABLES.skvAncestry[ ARGUMENTS.descendantID ]['parent']) ){
				arrNewPath = buildArrPathToAncestor( VARIABLES.skvAncestry[ ARGUMENTS.descendantID ]['parent'], arrNewPath );
			}
			return arrNewPath;
		}


		private struct function buildDefaultStruct( required query qryRes ){

			var skvReturn = {};
			for( i = 1; i LTE ARGUMENTS.qryRes.recordCount; i++ ){
				skvItem = {
					'id' 		= ARGUMENTS.qryRes['id'][i],
					'variable'	= ARGUMENTS.qryRes['variable'][i],
					'value'		= ARGUMENTS.qryRes['value'][i],
					'parent' 	= ARGUMENTS.qryRes['parent'][i],
					'type' 		= ARGUMENTS.qryRes['type'][i],
					'children' 	= {}
				};
				
				var arrPath = buildArrPathToAncestor(skvItem['id'], []);
				var level = arrayLen(arrPath);

				switch(level){
					case 4:
						skvReturn[arrPath[1]]['children'][arrPath[2]]['children'][arrPath[3]]['children'][arrPath[4]] = skvItem;
					break;
					
					case 3:
						skvReturn[arrPath[1]]['children'][arrPath[2]]['children'][arrPath[3]] = skvItem;
					break;

					case 2:
						skvReturn[arrPath[1]]['children'][arrPath[2]] = skvItem;
					break;
				
					default:
						skvReturn[arrPath[1]] = skvItem;
					break;
				}
			}
			return skvReturn;
		} 

		// build the html for showing the setup defaults
		private string function buildStrHTML( required struct skvDefaults ){
			var strHTML = '<div class="defaults">';
			var arrParentIDs = structKeyArray( ARGUMENTS.skvDefaults );
			var numParents = arrayLen( arrParentIDs );

			for( var i = 1; i LTE numParents; i++ ){
				strHTML &= buildItemHTML( ARGUMENTS.skvDefaults[arrParentIDs[i]], 1 );
			}

			strHTML &= '</div>';
			return strHTML;
		}

		// Build the html for each variable
		private string function buildItemHTML( required struct skvItem, required numeric level ){

			var arrFields = ['id','variable','type','value'];
			var numFields = arrayLen( arrFields );
			var parentClass = '';
			if(structCount(ARGUMENTS.skvItem['children'])){
				familyClass = 'parent';
			}else{
				familyClass = 'child';
			}

			var strHTML = '<div class="item item-' & ARGUMENTS.skvItem['id'] & ' level-' & ARGUMENTS.level & ' ' & familyClass & '" ';
			strHTML &= 'data-id="' & ARGUMENTS.skvItem['id'] & '" data-level="' & ARGUMENTS.level & '">'; 
				for(var i = 1; i LTE numFields; i++){

					if( ARGUMENTS.skvItem['type'] EQ 'struct' AND !len(ARGUMENTS.skvItem['value']) AND arrFields[i] EQ 'value' ){
						// don't print blank values for parent elements
					} else {
						strHTML &= '<div class="data ' & arrFields[i] & '">' & ARGUMENTS.skvItem[ arrFields[i] ] & '</div>';
					}
				}

			if( structCount( ARGUMENTS.skvItem['children'] ) ){
				strHTML &= '<div class="data show-children pull-right" data-show-level="' & (ARGUMENTS.level + 1) & '" data-show-children-of-item="' & ARGUMENTS.skvItem['id'] & '">Show Children</div>';
			}

			strHTML &= '</div>';

			// Recursively build any child variables using same function
			if( structCount( ARGUMENTS.skvItem['children'] ) ){
				strHTML &= buildChildHTML( ARGUMENTS.skvItem['children'], ARGUMENTS.level, ARGUMENTS.skvItem['id']);
			}

			
			return strHTML;
		}

		private string function buildChildHTML( required struct skvChildren, required numeric level, required numeric parentID ){
			var strHTML = '';
			var strHTML &= '<div class="children children-of-' & ARGUMENTS.parentID & '">';
			var arrChildren = structKeyArray( ARGUMENTS.skvchildren );
			var numChildren = arrayLen( arrChildren );
			for(var j = 1; j LTE numChildren; j++){
				strHTML &= buildItemHTML( ARGUMENTS.skvchildren[arrChildren[j]], ARGUMENTS.level + 1);
			}
			strHTML &= '</div>';
			return strHTML;
		} 


	</cfscript>

</head>
<body>

	<h1>Channel Experiment</h1>	

		<cfoutput>#buildStrHTML( VARIABLES.skvDefaults )#</cfoutput>

		<div class="section defaults">
			<h2>setup_defaults</h2>
			
			<div class="item_list">
			<cfloop index="i" from="1" to="#defaultsQryResults.recordCount#">
				<cfif !isNumeric(#defaultsQryResults['parent'][i]#)> <!--- Loop over parent structs --->
				<cfoutput>
					<div id="parent-#defaultsQryResults['id'][i]#" class="record parent">
						<div class="item">#defaultsQryResults['id'][i]#</div>
						<div class="item">#defaultsQryResults['variable'][i]#</div>
						<div class="item">#defaultsQryResults['value'][i]#</div>
						<div class="item">#toString(defaultsQryResults['parent'][i])#</div>
						<div class="item">#defaultsQryResults['type'][i]#</div>
					</div>

				</cfoutput>
				</cfif> <!--- End of parent loop --->
			</cfloop>
			</div>
		</div>

		<div class="section channels">
			<h2>setup_channel</h2>
			<div class="item_list">
			<cfloop index="i" from="1" to="#channelsQryResults.recordCount#">
				<cfoutput>
					<div class="record">
						<div class="item">#channelsQryResults['id'][i]#</div>
						<div class="item">#channelsQryResults['setup_defaults_id'][i]#</div>
						<div class="item">#channelsQryResults['value'][i]#</div>
					</div>
				</cfoutput>
			</cfloop>
			</div>
		</div>

		<div class="section channels_defaults">
			<h2>setup_channel joined to setup_defaults</h2>
			<div class="item_list">
			<cfloop index="i" from="1" to="#channels_defaultsQryResults.recordCount#">
				<cfoutput>
					<div class="record">
						<div class="item">#channels_defaultsQryResults['id'][i]#</div>
						<div class="item">#channels_defaultsQryResults['setup_defaults_id'][i]#</div>
						<div class="item">#channels_defaultsQryResults['variable'][i]#</div>
						<div class="item">#channels_defaultsQryResults['value'][i]#</div>
					</div>
				</cfoutput>
			</cfloop>
			</div>
		</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>

</body>
</html>


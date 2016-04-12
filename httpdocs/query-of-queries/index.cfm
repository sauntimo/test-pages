<cfscript>
	
	/*
	*	Initial Query
	* 	
	*	I'm the one that goes to the database and gets yo data.
	*/

	VARIABLES.rs1 = new query(
			datasource=application.db.comcar,
			sql='SELECT * FROM `mango`.`rates_vauxhallquotePersonal` AS mv ORDER BY mv.`id` ASC'
			).execute().getResult(); 

	// writeDump(arrayMin( listToArray( valueList( rs1.price ) ) ) );

	/*
	*	Query of Queries
	* 	
	*	The following query just queries the data returned by the first query
	*	which is already in the ram. This is faster and saves resources.
	*/


	// Run query of query - having got results back, query this for extreme vals.
	function getExtreme( required string strField, required string strType ){
		var strOrder = ARGUMENTS.strType EQ 'min' ? 'ASC' : 'DESC';
		var strSQL = 'SELECT id, ' & ARGUMENTS.strField & ' FROM rs ORDER BY ' & ARGUMENTS.strField & ' ' & strOrder;
		
		// query of query
		VARIABLES.rst = new query(
			DBType='query',
			rs=VARIABLES.rs1,
			maxrows=1,
			sql=strSQL
			).execute().getResult(); 

			// Get data in to struct. Struct may require building along the way!
			if( !isdefined('extremes.' & ARGUMENTS.strField ) OR !isStruct(extremes[ARGUMENTS.strField]) ){
				extremes[ARGUMENTS.strField] = {};
			}
			if( !isdefined('extremes.' & ARGUMENTS.strField & '.' & ARGUMENTS.strType) OR !isStruct(extremes[ARGUMENTS.strField][ARGUMENTS.strType]) ){
				extremes[ARGUMENTS.strField][ARGUMENTS.strType] = {};
			}

			// set data in struct
			extremes[ARGUMENTS.strField][ARGUMENTS.strType]['id'] = rst['id'][1];
			extremes[ARGUMENTS.strField][ARGUMENTS.strType]['value'] = rst[ARGUMENTS.strField][1];
	}

	function getExtremes( required array arrExtremeCols ){
		var numRangeCols = arrayLen(ARGUMENTS.arrExtremeCols);
		for(var i = 1; i LTE numRangeCols; i++){
			getExtreme( ARGUMENTS.arrExtremeCols[i], 'min' );
			getExtreme( ARGUMENTS.arrExtremeCols[i], 'max' );
		}

	}

	function printExtremes( required struct extremes ){
		var arrKeys = structKeyArray(ARGUMENTS.extremes);
		var numKeys = arrayLen(arrKeys);
		var strHTML = '<div class="extremes">';

		for(var i = 1; i LTE numKeys; i++){
			strHTML &='<div class="type ' & arrKeys[i] & '">';
			strHTML &='<div class="row name">';
			strHTML &='<div class="label name">Name</div>';
			strHTML &='<div class="data name">' & arrKeys[i] & '</div>';
			strHTML &='<div class="data id">id</div>';
			strHTML &='</div>';

			strHTML &='<div class="row min">';
			strHTML &='<div class="label min">Min Value</div>';
			strHTML &='<div class="data value">' & ARGUMENTS.extremes[arrKeys[i]]['min']['value'] & '</div>';
			strHTML &='<div class="data id">' & ARGUMENTS.extremes[arrKeys[i]]['min']['id'] & '</div>';
			strHTML &='</div>';

			strHTML &='<div class="row max">';
			strHTML &='<div class="label max">Max Value</div>';
			strHTML &='<div class="data value">' & ARGUMENTS.extremes[arrKeys[i]]['max']['value'] & '</div>';
			strHTML &='<div class="data id">' & ARGUMENTS.extremes[arrKeys[i]]['max']['id'] & '</div>';
			strHTML &='</div>';
			strHTML &='</div>';
		}
		strHTML &= '</div>';
		return strHTML;
	}

	extremes = {};

	VARIABLES.arrExtremeCols = ['price','p11dPrice','cctax','CO2gpkm'];

	getExtremes(VARIABLES.arrExtremeCols);

</cfscript>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Query of Queries Example</title>
	
	<style type="text/css">

		html{
			font-family: helvetica, arial, sans-serif;
		}
		
		div.extremes div.type{ 
			display: inline-block;
			padding: 5px;
			margin: 5px;
			border-radius: 5px;
			border: 2px solid #333;
		}

		div.extremes div.type div.row div{ 
			width: 80px;
			display: inline-block;
			padding: 5px;
			margin: 5px;
			border-radius: 3px;
			background-color: #eee;
		}

		div.extremes div.type div.row div.data{
			text-align: right;
		}

	</style>
</head>
<body>

	<h1>Query of Queries Example</h1>	
	
		<cfoutput>#printExtremes(extremes)#</cfoutput>

</body>
</html>


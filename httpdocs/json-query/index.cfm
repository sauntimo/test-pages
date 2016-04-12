<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSON to SQL Generator</title>
	
	<style type="text/css">

		html {
			font-family: helvetica, arial, sans-serif;
		}

		div.item_list {
			list-style: none;
		}
	
		div.item_list div.item{ 
			display: inline-block;
			float: left;
			clear: both;
			padding: 5px;
			margin: 5px;
			border-radius: 3px;
			background-color: #eee;

		}

		table {
			border-collapse: collapse;
		}

		div.item_list div.item table td,
		div.item_list div.item table th {
			padding: 3px;
			border: 1px solid #000;
		}

		h2 {
			margin: 0;
		}

		.correct{
			background-color: green;
		}
		
		.incorrect{
			background-color: red;
		}


	</style>
	

	<cfscript>
		
		VARIABLES.qry = new query(datasource=application.db.comcar);
		VARIABLES.strQuery = 	'SELECT
									css.`channel_id` AS channel_id,
									acc.titlePrepend AS title,
									acc.url AS url,
									css.`value` AS value

								FROM
									`channels`.`setup_selector` AS css
								INNER JOIN `allcars`.`channels` AS acc ON acc.id = css.`channel_id`
								WHERE
									`variable` = "actionLinks"';
		VARIABLES.qry.setSQL(VARIABLES.strQuery);
		VARIABLES.qryResults = VARIABLES.qry.execute().getResult();

		numRecords = qryResults.recordCount;

		skvStandard = {
			taxcalc = {
				isDisplayed = { value = true,
								id = 52 },
				class 		= { value = "taxLink",
								id = 55	},
				order 		= { value = 1,
								id = 56	},
				href 		= { value = "/newcar/companycar/taxcalc/g3options.cfm?id=##id##",
								id = 54	},
				title 		= {	value = "Company car tax calculation",
								id = 53	}
				},
			options = {	
				isDisplayed	= { value = true,
								id = 57	},
				class 		= { value = "optionsLink",
								id = 60	},
				order 		= { value = 2,
								id = 61	},
				href 		= { value = "/newcar/companycar/priceopt/g3options.cfm?id=##id##",
								id = 59	},
				title 		= { value = "Options",
								id = 58	}
				},
			details = {
				isDisplayed = { value = true,
								id = 62	},
				class 		= { value = "detailsLink",
								id = 65	},
				order 		= { value = 3,
								id = 66	},
				href 		= { value = "/details/##make##/##model##/##derivative##",
								id = 64	},
				title 		= { value = "Vehicle details",
								id = 63	}
				},
			forecourt = {	
				isDisplayed = { value = true,
								id = 67	},
				class 		= { value = "addtoforecourt",
								id = 70	},
				order 		= { value = 4,
								id = 71	},
				href 		= { value = "",
								id = 69	},
				title 		= { value = "Add to forecourt",
								id = 68	}
				},
			financeQuote = {	
				isDisplayed = { value = false,
								id = 72	},
				class 		= { value = "addtoforecourt",
								id = 75	},
				order 		= { value = 4,
								id = 76	},
				href 		= { value = "/finance/quote/detail/?vehicleid=##id##&priceid=##priceid##",
								id = 74	},
				title 		= { value = "Get a financeQuote",
								id = 73	}
				}
			};

		// writeDump(skvStandard);

		VARIABLES.strSQLInsert = '';

		private string function buildTable( required any channel, required struct skvRecord ){
			var strHTML = '<table>';
			strHTML &= '<thead>';
			strHTML &= '<tr>';
			strHTML &= '<th>item</th>';
			strHTML &= '<th>title</th>';
			strHTML &= '<th>isDisplayed</th>';
			strHTML &= '<th>href</th>';
			strHTML &= '<th>class</th>';
			strHTML &= '<th>order</th>';
			strHTML &= '</tr>';
			strHTML &= '</thead>';
			strHTML &= '<tbody>';

			strHTML &= buildRow( channel, 'taxcalc', skvRecord['taxcalc'] );
			strHTML &= buildRow( channel, 'options', skvRecord['options'] );
			strHTML &= buildRow( channel, 'details', skvRecord['details'] );
			strHTML &= buildRow( channel, 'forecourt', skvRecord['forecourt'] );

			if(structKeyExists(skvRecord, 'financeQuote')){
				strHTML &= buildRow( channel, 'financeQuote', skvRecord['financeQuote'] );	
			}

			strHTML &= '</tbody>';
			strHTML &= '</table>';
			return strHTML;

		}

		private string function buildRow( required any channel, required string strItem, required struct skvRow ){
			var strHTML = '<tr>';
			strHTML &= '<td>' & strItem & '</td>';
			

			var arrCols = ['title','isDisplayed','href','class','order'];
			var arrLen = arrayLen(arrCols);

			for(var i = 1; i LTE arrLen; i++){
				strHTML &= '<td class="';

				if( skvRow[arrCols[i]] EQ skvStandard[strItem][arrCols[i]]['value'] ){
					strHTML &= 'correct';
				} else{
					strHTML &= 'incorrect';

					// writeDump(channel);
					// writeDump(skvStandard[strItem][arrCols[i]]['id']);
					// writeDump(skvRow[arrCols[i]]);

					buildInsertStatement( channel, skvStandard[strItem][arrCols[i]]['id'], skvRow[arrCols[i]] );

				}

				strHTML &= '">' & skvRow[arrCols[i]] & '</td>';
			}

			strHTML &= '</tr>';
			return strHTML;
		}

		private string function buildInsertStatement( required any channel, required any id, required any value){

			if( value EQ 'NO' ){
				newVal = 'false';
			} else if ( value EQ 'YES' ){
				newVal = 'true';
			} else {
				newVal = value;
			}

			VARIABLES.strSQLInsert &= '<p>INSERT INTO `channels`.`setup_channel` (`channel_id`, `setup_defaults_id`, `value`) VALUES (' & channel & ', ' & id & ', "' & newVal & '");</p>';

		}

		private string function getSQL(){
			return VARIABLES.strSQLInsert;
		}

	</cfscript>

</head>
<body>

	<h1>JSON to SQL Generator for Channel Setup Tool</h1>

		<div class="item_list">
		<cfloop index="i" from="1" to="#qryResults.recordCount#">
			<cfoutput>
				<div class="item">
					<h2>Channel #qryResults['channel_id'][i]#</h2>
					<p>#qryResults['title'][i]# - <a href="http://d51ts.#qryResults['url'][i]#">http://d51ts.#qryResults['url'][i]#</a></p>
					#buildTable( qryResults['channel_id'][i], deserializeJSON(qryResults.value[i]) )#
				</div>
			</cfoutput>
		</cfloop>
		</div>
		
		

		<div class="sql" style="clear: left">
			<cfoutput>#getSQL()#</cfoutput>
		</div>

</body>
</html>


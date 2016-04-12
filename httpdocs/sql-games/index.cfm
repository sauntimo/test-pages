<cfscript>
	
// Query to populate temp table from pricing_leasing
// strCompaniesId arguments is the list of owned companyes for the current
// managing one
	remote function getQryPopulateTempTable( strCompanyId, clientSiteId, joinExtra, inclExcess_ppm_low ) {
		// Populate temp table with cap_vehicle_id, as it involves less joins than if we inserted comcar's vehicle_id
		var strSQL =				'INSERT INTO `mango`.`rates_vauxhallquotePersonal_temp`(
										`company_id`,
										`cap_vehicle_id`,
										`mileage`,
										`deposit`,
										`months`,
										`maintenance`,
										`price`,
										`vehicle_id` ';
			if( ARGUMENTS.joinExtra ){
				if( ARGUMENTS.inclExcess_ppm_low ){
					strSQL &= 			', `excess_ppm_low`';	
				}
				strSQL &= 				', `excess_ppm`, `service_fee`, `avgmonthlycoycost` ';
			}
			strSQL &=				') SELECT
										#strCompanyId#,
										`pricing_leasing`.`cap_vehicle_id`,
										`contract_mileage`.`value`,
										`contract_deposit`.`value`,
										`contract_length`.`value`,
										`contract_maintenance_type`.`value`,
										`pricing_leasing`.`price`,
										0';
		if( ARGUMENTS.joinExtra ){
			if( ARGUMENTS.inclExcess_ppm_low ){
				strSQL &= 			' , `pricing_extra`.`excess_ppm_low`';	
			}
			strSQL &= 			' , `pricing_extra`.`excess_ppm`
									, `pricing_extra`.`service_fee` 
									, `pricing_extra`.`tco` ';
		}


		strSQL &=					'FROM
										`rates`.`pricing_leasing`';
		if( ARGUMENTS.joinExtra ){
			strSQL &= 				' LEFT JOIN `rates`.`pricing_extra`         ON `pricing_leasing`.`id`                           = `pricing_extra`.`pricing_leasing_id` ';
		}

		strSQL &=					'LEFT JOIN `rates`.`contract_length` ON `pricing_leasing`.`contract_length_id` = `contract_length`.`id`
									LEFT JOIN `rates`.`contract_deposit` ON `pricing_leasing`.`contract_deposit_id` = `contract_deposit`.`id`
									LEFT JOIN `rates`.`contract_mileage` ON `pricing_leasing`.`contract_mileage_id` = `contract_mileage`.`id`
									LEFT JOIN `rates`.`contract_maintenance_type` ON `pricing_leasing`.`contract_maintenance_type_id` = `contract_maintenance_type`.`id`
									LEFT JOIN `rates`.`company_client_site` ON `pricing_leasing`.`company_id` = `company_client_site`.`company_id`
									WHERE
										`company_client_site`.`client_id` = #clientSiteId#
									AND `pricing_leasing`.`active` = 1
									AND `pricing_leasing`.`company_id` = #strCompanyId#
									AND `pricing_leasing`.`contract_agreement_type_id` = 2
									AND `pricing_leasing`.`contract_deposit_id` IN (3,6,12)';

		return strSQL;
	}

</cfscript>

<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	
	<div class="stuff">

		#getQryPopulateTempTable(12, 44, true, true)#

	</div>

</body>
</html>
</cfoutput>
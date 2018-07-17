CREATE VIEW FilteredTransactionForecast
AS
SELECT mt.*, 
fcdt.consumer_full_name, 
fcdt.consumer_id_number, 
fcdt.consumer_account_number,
fpdt.poc_name,
fpdt.stand_number,
fpdt.address_line_1,
fpdt.address_line_2,
fpdt.address_line_3,
fpdt.address_city,
fpdt.address_postal_zip,
fpdt.defined_vending_district_name
FROM
	(SELECT 
	consumer_install_id,
	consumer_unit_id,
	consumer_id,
	poc_install_id,
	poc_unit_id,
	poc_id,
	algorithm,
	manufacturer_code,
	meter_serial_number,
	AVG(absolute_percentage_error) AS mape
	FROM
		(SELECT
				consumer_install_id,
				consumer_unit_id,
				consumer_id,
				poc_install_id,
				poc_unit_id,
				poc_id,
				algorithm,
				manufacturer_code,
				meter_serial_number,
				DATE,
				sum_item_amount as actual_item_amount,
				
				AVG(sum_item_amount) OVER (PARTITION BY consumer_id
											ORDER BY DATE 
											ROWS BETWEEN 2 PRECEDING and CURRENT ROW) AS forecast_item_amount,
											
				ABS(sum_item_amount - AVG(sum_item_amount) OVER (PARTITION BY consumer_id
											ORDER BY DATE
											ROWS BETWEEN 2 PRECEDING and CURRENT ROW)) AS absolute_error,
											
				ABS(sum_item_amount - AVG(sum_item_amount) OVER (PARTITION BY consumer_id
											ORDER BY DATE
											ROWS BETWEEN 2 PRECEDING and CURRENT ROW)) / sum_item_amount AS absolute_percentage_error
			FROM
				(SELECT
					datefromparts(YEAR(dbo.transaction_entry.transaction_date),MONTH(dbo.transaction_entry.transaction_date),1) AS DATE, 
					SUM(transaction_item_amount) AS sum_item_amount,
					consumer_install_id,
					consumer_unit_id,
					consumer_id,
					poc_install_id,
					poc_unit_id,
					poc_id,
					algorithm,
					manufacturer_code,
					meter_serial_number
					FROM transaction_item
					LEFT JOIN dbo.transaction_entry
					ON transaction_item.installation_id = transaction_entry.installation_id AND transaction_item.unit_id = transaction_entry.unit_id AND transaction_item.transaction_id = transaction_entry.transaction_id
					AND transaction_type  = 1
					AND transaction_item_type = 100
				GROUP BY 
					YEAR(transaction_date), 
					MONTH(transaction_date), 
					consumer_install_id, 
					consumer_unit_id, 
					consumer_id,
					poc_install_id,
					poc_unit_id,
					poc_id,
					algorithm,
					manufacturer_code,
					meter_serial_number) AS SUMMARYTABLE ) AS MAPESUMMARY
GROUP BY consumer_install_id, 
		consumer_unit_id, 
		consumer_id,
		poc_install_id,
		poc_unit_id,
		poc_id,
		algorithm,
		manufacturer_code,
		meter_serial_number) AS mt

LEFT JOIN dbo.FilteredConsumerDetails as fcdt
ON mt.consumer_install_id = fcdt.consumer_install_id
AND mt.consumer_unit_id = fcdt.consumer_unit_id
AND mt.consumer_id = fcdt.consumer_id

LEFT JOIN dbo.FilteredPOCDetails as fpdt
ON mt.poc_install_id = fpdt.poc_install_id
AND mt.poc_unit_id = fpdt.poc_unit_id
AND mt.poc_id = fpdt.poc_id
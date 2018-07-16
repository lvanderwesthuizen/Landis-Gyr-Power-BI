CREATE VIEW FilteredConsumerDetails
AS
SELECT
	c.consumer_id,
	cd.consumer_title,
	cd.consumer_first_names,
	cd.consumer_surname,
	CONCAT(cd.consumer_first_names, ' ', cd.consumer_surname) AS consumer_full_name,
	cd.consumer_id_number,
	c.consumer_account_number,
	cd.consumer_tax_number,
	istring.item_string AS consumer_type_name,
	cd.consumer_address_1 AS address_line_1,
	cd.consumer_address_2 AS address_line_2,
	cd.consumer_address_3 AS address_line_3,
	tstring.item_string AS defiuned_town_name,
	cd.consumer_post_zip AS postal_zip,
	c.consumer_active
FROM dbo.consumer AS c
LEFT JOIN consumer_details AS cd
ON c.consumer_id = cd.consumer_id 
AND c.consumer_install_id = cd.consumer_install_id 
AND c.consumer_unit_id = cd.consumer_unit_id

LEFT JOIN dbo.item_string AS istring
ON c.consumer_type = istring.item_string_id
AND istring.item_string_index = 0
AND istring.language_id = 'en'
AND istring.item_string_type = '152'

LEFT JOIN dbo.item_string AS tstring
ON cd.defined_town = tstring.item_string_id
AND tstring.item_string_index = 0
AND tstring.language_id = 'en'
AND tstring.item_string_type = '135'
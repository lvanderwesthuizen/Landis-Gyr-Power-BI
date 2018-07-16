CREATE VIEW FilteredPOCDetails
AS
SELECT
	p.poc_install_id,
	p.poc_unit_id,
	p.poc_id,
	p.poc_name,
	pd.stand_number,
	pd.poc_address_1 AS address_line_1,
	pd.poc_address_2 AS address_line_2,
	pd.poc_address_3 AS address_line_3,
	tstring.item_string AS address_city,
	pd.poc_post_zip AS address_postal_zip,
	istring.item_string AS defined_vending_district_name
FROM dbo.poc AS p

LEFT JOIN dbo.poc_details AS pd
ON p.poc_install_id = pd.poc_install_id
AND p.poc_unit_id = pd.poc_unit_id
AND p.poc_id = pd.poc_id

LEFT JOIN dbo.item_string AS tstring
ON pd.defined_town = tstring.item_string_id
AND tstring.item_string_index = 0
AND tstring.language_id = 'en'
AND tstring.item_string_type = '135'

LEFT JOIN dbo.item_string AS istring
ON pd.defined_town = istring.item_string_id
AND istring.item_string_index = 0
AND istring.language_id = 'en'
AND istring.item_string_type = '136'
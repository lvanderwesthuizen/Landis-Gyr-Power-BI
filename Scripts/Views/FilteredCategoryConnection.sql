CREATE VIEW FilteredCategoryConnection
AS
SELECT cc.poc_install_id,
cc.poc_unit_id, 
cc.poc_id, 
cc.service_category_id, 
istr.item_string AS service_category_name,
cc.service_connect_date,
cc.vending_category_id, 
vstr.item_string AS vending_category_name,
cc.category_connect_date, 
cc.category_disconnect_date, 
cc.category_will_change_to
FROM Suprima4_Matzikama.dbo.category_connections AS cc

LEFT JOIN item_string AS istr
ON cc.service_category_id = istr.item_string_id
AND istr.item_string_index = 0
AND istr.language_id = 'en'
AND istr.item_string_type = 117

LEFT JOIN item_string AS vstr
ON cc.vending_category_id = vstr.item_string_id
AND vstr.item_string_index = 0
AND vstr.language_id = 'en'
AND vstr.item_string_type = 136
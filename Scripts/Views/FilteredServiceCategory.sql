CREATE VIEW FilteredServiceCategory 
AS
SELECT 
sc.service_category_id, 
istr.item_String AS service_category_name,
sc.service_type
FROM dbo.service_category AS sc
LEFT JOIN item_string AS istr
ON sc.service_category_id = istr.item_string_id
AND istr.item_string_index = 0
AND istr.language_id = 'en'
AND istr.item_string_type = 117
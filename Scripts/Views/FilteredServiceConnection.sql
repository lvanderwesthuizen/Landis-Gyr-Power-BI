CREATE VIEW FilteredServiceConnection
AS
SELECT sc.poc_install_id,
sc.poc_unit_id,
sc.poc_id,
fpd.poc_name,
sc.service_category_id,
istr.item_string AS service_type_name,
sc.service_connect_date,
sc.service_disconnect_date,
sc.service_account_number,
vcs.vending_charge_id,
ea.algorithm_name,
sac.system_area_code,
vcg.vend_cat_group_min_periods,
vcg.vend_cat_group_max_periods,
vcg.vend_cat_group_checked
FROM dbo.service_connections AS sc

LEFT JOIN dbo.FilteredPOCDetails AS fpd
ON sc.poc_install_id = fpd.poc_install_id
AND sc.poc_unit_id = fpd.poc_unit_id
AND sc.poc_id = fpd.poc_id

LEFT JOIN dbo.service_category AS scat
ON sc.service_category_id = scat.service_category_id
LEFT JOIN dbo.item_string AS istr
ON scat.service_type = istr.item_string_id
AND istr.language_id = 'en'
AND istr.item_string_index = 0
AND istr.item_string_type = 117

LEFT JOIN dbo.vending_charge_structure AS vcs
ON sc.vending_charge_id = vcs.vending_charge_id

LEFT JOIN dbo.system_area_code AS sac
ON sc.algorithm = sac.algorithm
AND sc.system_area_code = sac.system_area_code
LEFT JOIN dbo.encryption_algorithm AS ea
ON sac.algorithm = ea.algorithm

LEFT JOIN dbo.vending_category_group AS vcg
ON sc.vend_cat_group_id = vcg.vend_cat_group_id
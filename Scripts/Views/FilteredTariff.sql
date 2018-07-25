CREATE VIEW FilteredTariff
AS
SELECT 
charge_install_id, 
charge_type, 
charge_id, 
charge_index, 
tariff_eff_date, 
transaction_item_type, 
tariff_units_charge, 
tariff_min_vend_amount, 
tariff_max_vend_amount, 
tariff_active, 
tariff_expired
FROM dbo.tariff
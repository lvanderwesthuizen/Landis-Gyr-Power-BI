CREATE VIEW FilteredArrears
AS
SELECT charge_install_id, 
charge_type, 
charge_id, 
charge_index,
arrears_eff_date, 
transaction_item_type,
arrears_rate, 
arrears_max, 
arrears_active, 
arrears_expired
FROM dbo.arrears

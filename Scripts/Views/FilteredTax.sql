CREATE VIEW FilteredTax
AS
SELECT charge_install_id,
charge_type, 
charge_id,
charge_index,
tax_eff_date,
transaction_item_type,
tax_rate, 
tax_active, 
tax_expired
FROM dbo.tax

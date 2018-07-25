CREATE VIEW FilteredVendCatCharges
AS
SELECT 
vending_category_id,
category_eff_date,
charge_install_id, 
charge_type, charge_id,
charge_index, 
calculation_order
FROM dbo.vend_cat_charges
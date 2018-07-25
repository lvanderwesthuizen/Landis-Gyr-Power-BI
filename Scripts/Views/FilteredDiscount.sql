CREATE VIEW FilteredDiscount
AS
SELECT charge_install_id, charge_type, charge_id, charge_index, discount_eff_date, transaction_item_type, discount_rate, discount_active, discount_expired, discount_expiry_date
FROM dbo.discount
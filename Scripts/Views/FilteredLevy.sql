CREATE VIEW FilteredLevy
AS
SELECT charge_install_id, charge_type, charge_id, charge_index, levy_eff_date, transaction_item_type, levy_amount, levy_active, levy_expired
FROM dbo.levy
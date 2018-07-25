CREATE VIEW FilteredInterest
AS
SELECT charge_install_id, charge_type, charge_id, charge_index, interest_eff_date, transaction_item_type, interest_rate, interest_period, interest_calc_type, interest_active, interest_expired
FROM dbo.interest
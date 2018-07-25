CREATE VIEW FilteredPocChargeHistory
AS
SELECT poc_install_id, poc_unit_id, poc_id, charge_install_id, charge_type, charge_id, charge_index, poc_charge, poc_charge_reset, poc_charge_initial_date, poc_charge_initial_amount
FROM dbo.poc_charge_history

CREATE VIEW FilteredConsumerChargeHistory
AS
SELECT consumer_install_id, consumer_unit_id, consumer_id, charge_install_id, charge_type, charge_id, charge_index, consumer_charge, consumer_charge_reset, consumer_charge_initial_date, consumer_charge_initial_amount
FROM dbo.consumer_charge_history
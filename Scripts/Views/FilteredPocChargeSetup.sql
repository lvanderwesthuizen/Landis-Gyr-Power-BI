CREATE VIEW FilteredPocChargeSetup
AS
SELECT poc_install_id, 
poc_unit_id, 
poc_id, 
charge_install_id,
charge_type,
charge_id, 
charge_index, 
poc_charge_pc_recovery, 
poc_charge_period
FROM dbo.poc_charge_setup
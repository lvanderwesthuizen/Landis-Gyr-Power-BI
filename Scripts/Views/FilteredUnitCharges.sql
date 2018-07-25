CREATE VIEW FilteredUnitCharges
AS
SELECT installation_id, unit_id, charge_install_id, charge_type, charge_id, charge_index
FROM dbo.unit_charges
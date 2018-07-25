CREATE VIEW FilteredLocationCharge
AS
SELECT installation_id, location, district, town, charge_install_id, charge_type, charge_id, charge_index
FROM dbo.location_charge
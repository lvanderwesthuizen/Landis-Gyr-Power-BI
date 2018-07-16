CREATE VIEW FilteredMeterConnection
AS
SELECT
	poc_install_id,
	poc_unit_id,
	poc_id,
	algorithm,
	manufacturer_code,
	meter_serial_number,
	meter_connect_date,
	disconnect_reason_id,
	meter_disconnect_date,
	meter_movement_comment,
	auto_tokens
FROM dbo.meter_connections
WHERE meter_disconnect_date IS NULL
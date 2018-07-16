CREATE VIEW FilteredMeter
AS
SELECT 
	m.algorithm,
	m.manufacturer_code,
	meter_serial_number,
	manfac.manufacturer_name,
	ea.algorithm_name,
	mt.meter_model_number,
	meter_details,
	meter_registered_at,
	meter_active,
	meter_transferred_out
FROM dbo.meter AS m

LEFT JOIN dbo.encryption_algorithm AS ea
ON m.algorithm = ea.algorithm

LEFT JOIN dbo.meter_manufacturers AS mm
ON m.manufacturer_code = mm.manufacturer_code

LEFT JOIN dbo.manufacturer AS manfac
ON mm.manufacturer_code = manfac.manufacturer_code

LEFT JOIN dbo.meter_type as mt
ON mm.meter_type_id =  mt.meter_type_id
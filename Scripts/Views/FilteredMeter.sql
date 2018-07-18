CREATE VIEW FilteredMeter
AS
SELECT m.*, mt.meter_model_number
FROM dbo.meter AS m
LEFT JOIN dbo.meter_type as mt
ON m.meter_type_id =  mt.meter_type_id
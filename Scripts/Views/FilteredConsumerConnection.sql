CREATE VIEW FilteredConsumerConnection
AS
SELECT poc_install_id, poc_unit_id, poc_id, consumer_install_id, consumer_unit_id, consumer_id, consumer_connect_date, consumer_disconnect_date, consumer_movement_comment, dbo.fn_getconsumermape(consumer_id) AS MAPE
FROM Suprima4_Matzikama.dbo.consumer_connections
WHERE consumer_disconnect_date IS NULL
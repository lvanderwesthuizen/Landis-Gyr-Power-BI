CREATE VIEW FilteredTransactionItem
AS
SELECT 
ti.installation_id, 
ti.unit_id, 
ti.transaction_id, 
ti.transaction_item_id,
tit.transaction_item_type,
istr.item_string AS transaction_item_type_name,
ti.transaction_item_amount, 
ti.transaction_sequence
FROM dbo.transaction_item AS ti
LEFT JOIN dbo.transaction_item_type AS tit
ON ti.transaction_item_type = tit.transaction_item_type
LEFT JOIN dbo.item_string AS istr
ON tit.transaction_item_type = istr.item_string_id
AND istr.item_string_index = 0
AND istr.language_id = 'en'
AND istr.item_string_type = 126

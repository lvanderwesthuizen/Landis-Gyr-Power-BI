CREATE VIEW FilteredConsumerTransactions
AS
			SELECT
				te.consumer_id,
				datefromparts(YEAR(te.transaction_date),MONTH(te.transaction_date),1) AS date, 
				SUM(ti.transaction_item_amount) AS sum_item_amount
			FROM transaction_item AS ti
			LEFT JOIN dbo.transaction_entry te
				ON ti.installation_id = te.installation_id 
				AND ti.unit_id = te.unit_id 
				AND ti.transaction_id = te.transaction_id
				AND te.transaction_type  = 1
				AND ti.transaction_item_type = 100
				AND te.transaction_date IS NOT NULL
			GROUP BY YEAR(te.transaction_date), MONTH(te.transaction_date), consumer_id
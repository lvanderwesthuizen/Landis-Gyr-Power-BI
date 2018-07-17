CREATE VIEW FilteredConsumerMapeForecast
AS
SELECT 
consumer_id,
AVG(absolute_error) AS mape
FROM
(SELECT
			consumer_id,
			DATE,
			sum_item_amount as actual_item_amount,
			AVG(sum_item_amount) OVER (PARTITION BY consumer_id
										ORDER BY DATE 
										ROWS BETWEEN 1 PRECEDING and CURRENT ROW) AS forecast_item_amount,
			ABS(sum_item_amount - AVG(sum_item_amount) OVER (PARTITION BY consumer_id
										ORDER BY DATE
										ROWS BETWEEN 1 PRECEDING and CURRENT ROW)) AS absolute_error
			FROM
			(SELECT 
				consumer_id,
				datefromparts(YEAR(dbo.transaction_entry.transaction_date),MONTH(dbo.transaction_entry.transaction_date),1) AS DATE, 
				SUM(transaction_item_amount) AS sum_item_amount
				FROM transaction_item
				LEFT JOIN dbo.transaction_entry
				ON transaction_item.installation_id = transaction_entry.installation_id AND transaction_item.unit_id = transaction_entry.unit_id AND transaction_item.transaction_id = transaction_entry.transaction_id
				AND transaction_type  = 1
				AND transaction_item_type = 100
			GROUP BY YEAR(transaction_date), MONTH(transaction_date), consumer_id) AS SUMMARYTABLE ) AS MAPESUMMARY
GROUP BY consumer_id
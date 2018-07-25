CREATE VIEW FilteredBlockTable
AS
SELECT charge_install_id, 
charge_type,
charge_id, 
charge_index,
block_tariff_eff_date, 
block_index, 
transaction_item_type,
block_start_value,
block_rate, 
block_step_taxable
FROM dbo.block_table

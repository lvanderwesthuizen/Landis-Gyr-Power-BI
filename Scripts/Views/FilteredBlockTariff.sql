CREATE VIEW FilteredBlockTariff
AS
SELECT charge_install_id, charge_type, charge_id, charge_index, block_tariff_eff_date, block_tariff_active, block_tariff_expired, block_tariff_min_vend_amt, block_tariff_max_vend_amt, block_tariff_total_blocks, block_tariff_period, block_tariff_period_type
FROM dbo.block_tariff
SELECT 
	installation_id,	--PK
	unit_id,			--PK
	transaction_id,		--PK
	
	ban_installation_id,	--FK BANKING_BATCH
	ban_unit_id,			--FK BANKING_BATCH
	bank_batch_number,		--FK BANKING_BATCH
		
	service_category_id,	--FK SERVICE_CATEGORY
		
	poc_install_id,			--FK POC
	poc_unit_id,			--FK POC
	poc_id,					--FK POC
	
	user_name,				--FK USER_ENTRY
	
	consumer_install_id,	--FK CONSUMER
	consumer_unit_id,		--FK CONSUMER
	consumer_id,			--FK CONSUMER
	
	
	shi_installation_id,	--FK SHIFT_DETAILS
	shi_unit_id,			--FK SHIFT_DETAILS
	transaction_shift_number, --FK SHIFT_DETAILS
	
	
	algorithm,				--FK METER
	manufacturer_code,		--FK METER
	meter_serial_number,	--FK METER
	
	
	transaction_type,		--FK ITEM_STRING
	payment_method,			--FK ITEM_STRING	
	cons_id_method,			--FK ITEM_STRING?
	
	
	transaction_date,
	receipt_number,
	transaction_comments,
	transaction_reversed,
	payment_number
	FROM transaction_entry
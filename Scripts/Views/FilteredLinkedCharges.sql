CREATE VIEW FilteredLinkedCharges
AS
SELECT charge_install_id,
charge_type, charge_id, 
charge_index, 
cha_charge_install_id, 
cha_charge_type,
cha_charge_id, 
cha_charge_index
FROM dbo.linked_charges;

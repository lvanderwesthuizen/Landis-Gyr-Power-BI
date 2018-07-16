CREATE FUNCTION fn_getitemstring
(
	@indexid INT,
	@languageid VARCHAR(32),
	@item_type INT,
	@item_id INT
)
RETURNS VARCHAR(255)
AS
BEGIN
	DECLARE @item_string VARCHAR(255)
	
	RETURN 
	(SELECT item_string
	FROM dbo.item_string
	WHERE item_string_index = @indexid
	AND language_id = @languageid
	AND item_string_type = @item_type
	AND item_string_id = @item_id)
END
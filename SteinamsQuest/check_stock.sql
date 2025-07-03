CREATE FUNCTION check_stock(pid INT, qty INT)
    RETURNS BOOLEAN
    DETERMINISTIC
BEGIN
    DECLARE current_stock INT;

SELECT stock INTO current_stock FROM products WHERE product_id = pid;
RETURN current_stock >= qty;
END;

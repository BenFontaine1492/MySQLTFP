DELIMITER //

CREATE PROCEDURE process_order(
    IN pid INT,
    IN qty INT,
    OUT success BOOLEAN
)
BEGIN
    DECLARE current_stock INT;

SELECT stock INTO current_stock FROM products WHERE product_id = pid;

IF current_stock < qty THEN
        -- Log rejected order
        INSERT INTO rejected_orders (product_id, quantity, reason)
        VALUES (pid, qty, 'Insufficient stock');
        SET success = FALSE;
ELSE
        -- Reduce stock
UPDATE products SET stock = stock - qty WHERE product_id = pid;

-- Log inventory change
INSERT INTO inventory_log (product_id, change_type, change_amount)
VALUES (pid, 'order', -qty);

-- Insert into orders
INSERT INTO orders (product_id, quantity)
VALUES (pid, qty);

-- Shipment will be created in trigger
SET success = TRUE;
END IF;
END;
//

DELIMITER ;

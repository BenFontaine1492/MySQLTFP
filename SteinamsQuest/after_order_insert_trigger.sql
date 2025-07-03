DELIMITER //

CREATE TRIGGER after_order_insert
    AFTER INSERT ON orders
    FOR EACH ROW
BEGIN
    -- Initialize shipment for the new order
    INSERT INTO shipments (order_id)
    VALUES (NEW.order_id);
END;
//

DELIMITER ;

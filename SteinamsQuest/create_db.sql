CREATE TABLE products (
                          product_id INT PRIMARY KEY,
                          name VARCHAR(100),
                          stock INT
);

CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        product_id INT,
                        quantity INT,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shipments (
                           shipment_id INT AUTO_INCREMENT PRIMARY KEY,
                           order_id INT,
                           status ENUM('pending', 'shipped') DEFAULT 'pending'
);

CREATE TABLE inventory_log (
                               log_id INT AUTO_INCREMENT PRIMARY KEY,
                               product_id INT,
                               change_type ENUM('order', 'restock'),
                               change_amount INT,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rejected_orders (
                                 rejected_order_id INT AUTO_INCREMENT PRIMARY KEY,
                                 product_id INT,
                                 quantity INT,
                                 reason VARCHAR(255),
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

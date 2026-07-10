-- Sample data for the demo application.

INSERT INTO products (name, description, price, image_url) VALUES
('Gaming Laptop', 'A fast laptop for coding and content creation.', 1299.99, '/images/laptop.jpg'),
('Smartphone', 'A modern phone with a bright display and great battery.', 799.50, '/images/phone.jpg'),
('Noise Cancelling Headphones', 'Premium audio for work and travel.', 199.99, '/images/phone.jpg'),
('Wireless Keyboard', 'Compact keyboard built for comfort.', 89.00, '/images/laptop.jpg'),
('4K Monitor', 'Crisp display for multitasking and streaming.', 349.99, '/images/laptop.jpg');

INSERT INTO users (username, email, full_name) VALUES
('alice', 'alice@example.com', 'Alice Johnson'),
('bob', 'bob@example.com', 'Bob Martin');

INSERT INTO orders (user_id, product_id, quantity, total_amount, order_status) VALUES
(1, 1, 1, 1299.99, 'completed'),
(2, 2, 1, 799.50, 'pending');

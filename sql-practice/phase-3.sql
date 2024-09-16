DROP TABLE IF EXISTS customers;  -- prevents unique phone # constraint error when adding customer again
DROP TABLE IF EXISTS coffee_orders;  -- prevents recording duplicate coffee orders

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(40) NOT NULL,
    phone INTEGER(10) UNIQUE,
    email VARCHAR(255) UNIQUE,
    points INTEGER(3) DEFAULT 5,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE coffee_orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    is_redeemed BOOLEAN DEFAULT FALSE,
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_name VARCHAR(40) REFERENCES customers(name)
);
    -- customer_id INTEGER FOREIGN KEY (customer_id) REFERENCES customers(id)
    -- couldn't figure out foreign key

-- A new customer joined the loyalty program: Rachel
INSERT INTO customers(name, phone)
    VALUES
        ('Rachel', 1111111111);

-- Rachel purchases a coffee. She goes from 5 to 6 points.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers
    WHERE name = 'Rachel')
    WHERE name = 'Rachel';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Rachel');

-- 2 new customers joined the loyalty program: Monica and Phoebe
INSERT INTO customers(name, email, phone)
    VALUES
        ('Monica', 'monica@friends.show', 2222222222),
        ('Phoebe', 'phoebe@friends.show', 3333333333);

-- Phoebe purchases three coffees. She has 8 points.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers
    WHERE name = 'Phoebe')
    WHERE name = 'Phoebe';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Phoebe');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers
    WHERE name = 'Phoebe')
    WHERE name = 'Phoebe';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Phoebe');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers
    WHERE name = 'Phoebe')
    WHERE name = 'Phoebe';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Phoebe');

-- Rachel and Monica each purchase four coffees.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Rachel')
    WHERE name = 'Rachel';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Rachel');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Rachel')
    WHERE name = 'Rachel';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Rachel');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Rachel')
    WHERE name = 'Rachel';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Rachel');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Rachel')
    WHERE name = 'Rachel';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Rachel');

UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');

-- Monica wants to know her new point total.
-- SELECT points FROM customers
--     WHERE name = 'Monica';  -- 9 points

-- Rachel wants to check her total points.
-- SELECT points FROM customers
--     WHERE name = 'Rachel';      -- 10 POINTS
-- Redeem her points for a coffee if she has enough points.
UPDATE customers
    SET points = -10 + (SELECT points FROM customers WHERE name = 'Rachel')
    WHERE name = 'Rachel' AND points >= 10;
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(TRUE, 'Rachel');
-- If she doesn't, she wants to purchase a coffee.
-- SELECT points FROM customers
--     WHERE name = 'Rachel';   -- 0 points now

-- Three new customers joined the loyalty program with the following customer information:
INSERT INTO customers(name, email)
    VALUES
        ('Joey', 'joey@friends.show'),
        ('Chandler', 'chandler@friends.show'),
        ('Ross', 'ross@friends.show');

-- Ross purchases six coffees.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');

-- Monica purchases three coffees.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Monica');

-- Phoebe wants to check her total points.
-- SELECT points FROM customers WHERE name = 'Phoebe';   -- 8 pts
-- Redeem her points for a coffee if she has enough points.
-- If she doesn't, she wants to purchase a coffee.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Phoebe')
    WHERE name = 'Phoebe';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Phoebe');

-- Ross demands a refund for the last two coffees that he ordered.
-- (Make sure you delete Ross's coffee orders and not anyone else's.
-- Update his points to reflect the returned purchases.)
-- SELECT points FROM customers
--     WHERE name = 'Ross';    -- 11 POINTS
-- SELECT * FROM coffee_orders     -- last order 19
--     WHERE customer_name = 'Ross'; -- ORDER BY id DESC;

DELETE FROM coffee_orders
    WHERE customer_name = 'Ross' AND id = 19;
UPDATE customers
    SET points = -1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
-- SELECT points FROM customers
--     WHERE name = 'Ross';    -- 10 POINTS

-- SELECT * FROM coffee_orders     -- last order 18
--     WHERE customer_name = 'Ross'; -- ORDER BY id DESC;

DELETE FROM coffee_orders
    WHERE customer_name = 'Ross' AND id = 18;
UPDATE customers
    SET points = -1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
-- SELECT points FROM customers
--     WHERE name = 'Ross';    -- 9 POINTS

-- SELECT * FROM coffee_orders     -- last order 17
--     WHERE customer_name = 'Ross'; -- ORDER BY id DESC;

-- Joey purchases two coffees.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Joey')
    WHERE name = 'Joey';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Joey');
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Joey')
    WHERE name = 'Joey';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Joey');

-- Monica wants to check her total points.
-- SELECT points FROM customers WHERE name = 'Monica';  -- 12 pts (started with 5, bought 7)
-- Redeem her points for a coffee if she has enough points.
UPDATE customers
    SET points = -10 + (SELECT points FROM customers WHERE name = 'Monica')
    WHERE name = 'Monica';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(TRUE, 'Monica');
-- If she doesn't, she wants to purchase a coffee.
-- SELECT * FROM coffee_orders;
-- SELECT points FROM customers WHERE name = 'Monica';  -- 2 pts

-- Chandler wants to delete his loyalty program account.
-- SELECT * FROM customers;
DELETE FROM customers WHERE name = 'Chandler';
-- SELECT * FROM customers;

-- Ross wants to check his total points.
-- SELECT points FROM customers WHERE name = 'Ross';  -- 9 POINTS
-- Redeem his points for a coffee if he has enough points.
-- If he doesn't, he wants to purchase a coffee.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Ross')
    WHERE name = 'Ross';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Ross');
-- SELECT points FROM customers WHERE name = 'Ross';  -- 9 POINTS

-- Joey wants to check his total points.
SELECT points FROM customers WHERE name = 'Joey';  -- 7 POINTS
-- Redeem his points for a coffee if he has enough points.
-- If he doesn't, he wants to purchase a coffee.
UPDATE customers
    SET points = 1 + (SELECT points FROM customers WHERE name = 'Joey')
    WHERE name = 'Joey';
INSERT INTO coffee_orders(is_redeemed, customer_name)
    VALUES(FALSE, 'Joey');

-- Phoebe wants to change her email
-- SELECT * FROM customers;
UPDATE customers
    SET email = 'p_as_in_phoebe@friends.show'
    WHERE name = 'Phoebe';
SELECT * FROM customers;

-- SELECT points FROM customers WHERE name = 'Rachel';
-- SELECT points FROM customers WHERE name = 'Monica';
-- SELECT points FROM customers WHERE name = 'Phoebe';
-- SELECT points FROM customers WHERE name = 'Joey';
-- SELECT points FROM customers WHERE name = 'Ross';

SELECT * FROM coffee_orders;

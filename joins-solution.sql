-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" on "addresses"."customer_id" = "customers"."id"
ORDER BY "customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product)
SELECT "products"."description", "line_items"."quantity", "line_items"."order_id" FROM "line_items"
JOIN "products" on "products"."id" = "line_items"."product_id"
ORDER BY "line_items"."order_id";

-- 3. Which warehouses have cheetos
SELECT "warehouse", "products"."description" FROM "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "product_id" = 5;

-- 4. Which warehouses have diet pepsi
SELECT "warehouse", "products"."description" FROM "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "product_id" = 6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results
SELECT COUNT("customers"."id"), "customers"."first_name" FROM "orders"
JOIN "addresses" on "addresses"."id" = "orders"."address_id"
JOIN "customers" on "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."id";

-- 6. How many customers do we have
SELECT COUNT("id") FROM "customers";

-- 7. How many products do we carry
SELECT COUNT("id") FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi
SELECT SUM("warehouse_product"."on_hand"), "products"."description" FROM "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
WHERE "warehouse_product"."product_id" = 6
GROUP BY "products"."description";
-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" on "addresses"."customer_id" = "customers"."id"
ORDER BY "customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product)
SELECT "products"."description", "line_items"."quantity", "line_items"."order_id" FROM "line_items"
JOIN "products" on "products"."id" = "line_items"."product_id"
ORDER BY "line_items"."order_id";
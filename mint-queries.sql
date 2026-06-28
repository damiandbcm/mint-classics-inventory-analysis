USE mintclassics;
SELECT warehouseCode, count(productCode) AS number_of_items, SUM(quantityInStock) AS quantity_in_stock
FROM products
GROUP BY warehouseCode;

USE mintclassics;
SELECT warehouseCode, warehousePctCap
FROM warehouses;

USE mintclassics;
SELECT p.productCode, p.productName, p.quantityInStock, p.productDescription, SUM(o.quantityOrdered) AS total_cars_sold
FROM products AS p LEFT JOIN orderdetails AS o
ON p.productCode = o.productCode
GROUP BY p.productCode
ORDER BY total_cars_sold DESC;

USE mintclassics;
SELECT productCode, productName, quantityInStock, buyPrice, quantityInStock * buyPrice AS inventory_value
FROM products
ORDER BY inventory_value DESC;

USE mintclassics;
SELECT w.warehouseCode, w.warehouseName, SUM(p.quantityInStock * p.buyPrice) AS inventory_value
FROM warehouses AS w INNER JOIN products AS p
ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName
ORDER BY inventory_value DESC;

USE mintclassics;
SELECT p.warehouseCode, SUM(o.quantityOrdered) AS total_units_sold
FROM products p INNER JOIN orderdetails as o
ON p.productCode = o.productCode
GROUP BY p.warehouseCode
ORDER BY total_units_sold DESC;

USE mintclassics;
SELECT p.warehouseCode, SUM(p.quantityInStock) AS inventory_units, SUM(o.quantityOrdered) AS units_sold, SUM(o.quantityOrdered) / SUM(p.quantityInStock) AS inventory_turnover
FROM products AS p INNER JOIN orderdetails AS o ON p.productCode = o.productCode
GROUP BY p.warehouseCode
ORDER BY inventory_turnover;

USE mintclassics;
SELECT p.warehouseCode, SUM(o.quantityOrdered * o.priceEach) AS revenue
FROM products AS p INNER JOIN orderdetails as o
ON p.productCode = o.productCode
GROUP BY p.warehouseCode
ORDER BY revenue DESC;

USE mintclassics;
SELECT p.warehouseCode, p.productCode, p.productName, p.quantityInStock, SUM(o.quantityOrdered) AS total_sold
FROM products AS p LEFT JOIN orderdetails as o
ON p.productCode = o.productCode
GROUP BY p.warehouseCode, p.productCode, p.productName, p.quantityInStock
ORDER BY total_sold ASC;


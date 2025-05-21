-- Question 1 Achieving 1NF (First Normal Form) 🛠️
SELECT 
  OrderID, 
  CustomerName, 
  TRIM(product) AS Product
FROM ProductDetail,
JSON_TABLE(
  CONCAT('["', REPLACE(Products, ',', '","'), '"]'),
  "$[*]" COLUMNS (product VARCHAR(100) PATH "$")
) AS products_split;

-- Question 2 Achieving 2NF (Second Normal Form) 🧩
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

CREATE TABLE OrderDetails (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

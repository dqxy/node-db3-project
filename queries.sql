-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select ProductName, CategoryID from product

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Id,
       ShipName,
       OrderDate
  FROM [Order]
WHERE OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT od.productid, od.orderid, p.productname, od.quantity
  FROM [Orderdetail] as od
JOIN product as p on p.id = od.productid
WHERE od.orderid = '10251'
order by p.productname;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as 'Order ID', c.companyname as `Customer's Company Name`, e.lastname as 'Employee Last Name'
  FROM [Order] as o
JOIN customer as c on o.customerid = c.id
JOIN employee as e on e.id = o.employeeid;
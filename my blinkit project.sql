use atul04; 
show tables; 

---- Retrieve all the customer names from the Customers, orderdetails and orders----------

select * from customers; 
select * from orderdetails; 
select * from orders; 

-------List all distinct cities where customers are located-------------

select distinct city from customers; 

----Find the total number of orders placed---------

select count(distinct OrderID) as total_orders from orderdetails; 

---Get the details of orders that are Delivered------

select * from orders where DeliveryStatus = "Delivered"; 

select count(DeliveryStatus) from orders; 

-----Display the total amount for each order along with the OrderID------

select OrderID, TotalAmount from orders; 

--------Retrieve customers’ names and phone numbers from Customers whose city is Jaipur--------

select Name, Phone, City from customers where City = "Jaipur"; 

--------- Fetch all orders placed after 2024–11–01 -----------

select * from orders; 

SELECT * FROM orders  
WHERE OrderDatetime > '2024-11-01 00:00:00';

-------Find the products that cost more than Rs.100 per unit.----------

select * from orderdetails; 

select ProductName, Quantity,  PricePerUnit from orderdetails where PricePerUnit > 100; 

----List all orders with a total amount exceeding Rs.500----- 

select * from orders;

select OrderID, TotalAmount from orders
where TotalAmount > 500; 

---- Find the total revenue (sum of TotalAmount) generated from all orders------

select sum(TotalAmount) from orders; 

------List the top 5 most frequently ordered product---------

select * from orderdetails; 

select ProductName,count(Quantity) As ordercount 
from orderdetails
group by ProductName
order by ordercount desc
limit 5; 

---- Calculate the total quantity sold for each product-------


select ProductName , Sum(Quantity) as total_qu from orderdetails
group by ProductName
order by total_qu desc; 

------ Identify the customer who placed the maximum number of orders---------

select * from customers; 
select * from orderdetails;
select * from orders;  

FROM c.customers


select c.Name, count(O.OrderID) as Maximumorders 
from Customers C
join orders O on c.CustomerID = O.CustomerID
group by c.Name
order by Maximumorders desc
limit 5; 

-- identify the brand which order has been placed most----

select * from customers; 
select * from orders; 

select o.ProductName, count(od.OrderID) as maximumorder 
from orderdetails o 
join orders od on o.OrderID = od.Orderid
group by o.ProductName
order by maximumorder desc
limit 1; 

-----Fetch the OrderID and ProductName for orders where more than 3 units of a product were purchased--------

select * from orderdetails; 

select OrderID, ProductName from orderdetails where PricePerunit > 3; 

-------- Identify the cities with the highest number of customers-----------

select * from customers; 

select City, count(*) as Highest_nu_cs from customers
group by City 
order by Highest_nu_cs desc; 

--------Retrieve all products and their total sales (quantity × price per unit)------------

select * from orderdetails;

select ProductName , sum(Quantity* PricePerUnit) as totalSales from orderdetails 
group by ProductName 
order by totalSales desc; 

 ---Find the most expensive single order based on the TotalAmount----
 
 select OrderID, CustomerID, TotalAmount 
 from orders
 order by TotalAmount desc
 limit 1; 
 
 
 ---------Retrieve the top 3 customers who spent the most-----
 
 select * from customers; 
 select * from orders; 
 
 select c.Name, count(O.TotalAmount) as Max_exp from customers c
 join orders O on c.CustomerID = O.CustomerID
 group by c.Name
 order by Max_exp desc
 limit 3; 
 
 -------Calculate the contribution percentage of each city to the total revenue.--------
 
 select c.City , sum(O.TotalAmount) as Cityrevenu, (sum(O.TotalAmount) / (select sum(TotalAmount) from orders)*100) AS ContributionPercentage
 from customers c
 join orders O on c.CustomerID = O.CustomerID
 group by c.City
 order by ContributionPercentage desc; 
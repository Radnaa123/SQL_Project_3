--Question1: Find the total number of customers from each city
select 
    city.cityid,
    city.cityname,
    count(customer.customerid)
from city
left JOIN customer on city.cityid = customer.cityid
group by city.cityid, city.cityname;

--Question2: Find the average price of products in each category.
SELECT 
    category.categoryname, 
    product.productname,
    AVG(product.price) AS avg_price
FROM category
LEFT JOIN product ON product.categoryid = category.categoryid
GROUP BY product.productname, category.categoryname;

--Question3: List the top 5 most expensive products.

select productname,
    max(price) as price
from product
group by productname
order by productname DESC
limit 5;

--Question4: Show the total sales amount for each salesperson.

SELECT s.salespersonid,
    sum(s.quantity * p.price * (1 - s.discount)) as total_revenue
from sales s
JOIN product p on p.productid = s.productid
group by s.salespersonid;

--Question5: Find the total number of sales transactions for each product.

select p.productname,
    count(s.transactionnumber)
from sales s
left join product p on s.productid = p.productid
group by p.productname
ORDER BY count(s.transactionnumber) DESC
limit 5;

--Question6: Which country has the most customers?

SELECT co.CountryName,
    COUNT(cu.CustomerID) AS CustomerCount
FROM Country co
JOIN City ci ON ci.CountryID = co.CountryID
JOIN Customer cu ON cu.CityID = ci.CityID
GROUP BY co.CountryName, co.CountryID
ORDER BY CustomerCount DESC

--Question7: List the products that have a vitality of more than 100 days.

select productname,
    vitalitydays
from product
where vitalitydays > 100;

--Question8: Find the customers who have purchased products with a discount of more than 10%.

select Sales.customerid,
    customer.firstname,
    customer.lastname,
    Sales.discount
from sales
LEFT JOIN customer on customer.customerid = sales.customerid
where discount > 0.10;

--Question9: Show the total number of sales by product category.

select c.categoryname,
    count(transactionnumber) sales_number
from sales s
join product p on s.productid = p.productid
join category c on c.categoryid = p.categoryid
group by c.categoryname;

--Question10: Find the cities with more than 5 customers.

SELECT   city.cityname,
    city.cityid,
    count(customer.customerid)
from customer
LEFT JOIN city on city.cityid = customer.cityid
GROUP BY city.cityname, city.cityid
HAVING count(customer.customerid) > 5;

--Question11: Show the products that have never been sold.

SELECT p.ProductID,
    p.ProductName
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.TransactionNumber IS NULL;

--Question12: Find the most recent sales transaction for each customer.

SELECT CustomerID,
    MAX(SalesDate) AS MostRecentSale
FROM Sales
GROUP BY CustomerID;
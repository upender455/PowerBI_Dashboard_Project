create table Products
(Product_ID serial primary key,
Product_Name varchar(100),
Category varchar(50),
price decimal(10,2),
Quantity int,
Added_Date date,
Discount_Rate decimal(10,2));

select * from Products;

--- 1st types of data import in atble
 copy
 		products(Product_Id,	Product_Name,	Category,price, Quantity,added_Date, Discount_Rate 
)
from'D:\MY\My projects Details\SQL\DEMO DATASET\Products.csv'
delimiter','
csv header;

--2nd select import csv file in 


--- alter any data type in tables option

alter table products
alter Column discount_rate type decimal(10,2);



---assignment no. 2

/*  1. Case function - categorizing Based on conditional 
We will categorize products into price ranges.

Expensive if the price is greater than or equal to 50000.
Moderate if the price is between 10000 and 49999.
Affordable if the price is less than 10000.
*/

SELECT  PRODUCT_ID,PRICE,
CASE
	WHEN PRICE>=50000 THEN 'Expensive'
	WHEN PRICE BETWEEN 10000 AND 49999 THEN 'Moderate'
	ELSE 'Affordable'
	END AS categorize
	FROM PRODUCTS;

/* 2ND. CASE with and & or operators - stock status
	We will classify products based on the quantity available.

	In_Stock if Quantity 10 or more.
	Limited_Stock if Quantity is between 5 and 9.
	Out_of_the Stock if Quantity is less than 5.
*/
	
select product_name,Quantity,
CASE 
When quantity>=10 then 'In Stock'
When Quantity>5 and quantity<=9 then 'Limited Stock'
else 'Out of Stock'
end As Stock_Status
from products;

---- 3nd case
/* case with like operators

check if the category name contains 'Electronics' or "Assessories" and "Furniture" using Like.
*/

select product_name,category,
CASE 
When category like 'Electronics%'  then 'Electronics Itmes'
When category like 'Assessories%' then 'Assessories Itme'
else 'Furniture Itme'
end As Itme_Name
from products;

--- 4th case.using IN operators 
/* products Categorize  if Electronics,Assessories show 'Tech'
and products categorize if furniture show 'plywood'
else 'other'
*/
 select product_name,category,
CASE 
When category in ('Electronics', 'Accessories') then 'Tech'
When category in('Furniture')  then 'Poywoood'
else 'Other'
end As Category_Group
from products;

select * from Products;



--- Part -2

-- first of all add new column name is Discount_price 

alter table products
add column Discount_price decimal(10,2);

-- than update value in discount_price column
update products 
set discount_price = price*0.9
where product_name not in ('laptop','Desk');

--1. COALESCE CASE USING AFTER SHOW RESULTS

SELECT PRODUCT_NAME,DISCOUNT_PRICE
FROM PRODUCTS;

--2. COALESCE CASE USING BEFOR SHOW RESULTS

SELECT PRODUCT_NAME,
COALESCE (DISCOUNT_PRICE,PRICE) AS FINAL_PRICE
FROM PRODUCTS;

--- how to drop column 

alter table products
drop column discount_price;

select * from Products;

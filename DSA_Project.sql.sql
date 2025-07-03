create database DSA_Project

select * from [dbo] . [KMS Sql Case Study]


------CASE SCENARIO I
-------Q1. WHICH PRODUCT CATEGORY HAD THE HIGHEST SALES?
select * from [dbo] . [KMS Sql Case Study]

SELECT Product_Category, sum (Sales) as TotalSales
from [dbo] . [KMS Sql Case Study]
group  by Product_Category
order by TotalSales desc

-----ANSWER: TECHNOLOGY HAD THE HIGHEST SALES WITH A TOTAL FIGURE OF APPROXIMATELY 5,984,248 (SEE DATA OUTPUT SNIP)


------Q2. WHAT ARE THE TOP 3 AND BOTTOM 3 REGIONS IN TERMS OF SALES?
------TOP 3 REGIONS
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 3 Region, sum (Sales) as TotalSales
from [dbo] . [KMS Sql Case Study]
group by Region
order by TotalSales desc

-----ANSWER: WEST, ONTARIO AND PRARIE  ARE THE TOP 3 REGIONS WITH WEST GROSSING THE HIGHEST SALES

-----BOTTOM 3 REGIONS
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 3 Region, sum (Sales) as TotalSales
from [dbo] . [KMS Sql Case Study]
group by Region
order by TotalSales asc

-----ANSWER: YUKON, NORTHWEST TERRITORIES, AND NUNAVUT ARE THE BOTTOM 3 REGIONS WITH NUNAVUT GROSSING THE LOWEST SALES


-----Q3. WHAT WERE THE TOTAL SALES OF APPLIANCES IN ONTARIO?
select * from [dbo] . [KMS Sql Case Study]

SELECT Product_Sub_Category, sum (Sales) as TotalSales
from [dbo] . [KMS Sql Case Study]
where Region = 'Ontario'
group by Product_Sub_Category
order by TotalSales

-----ANSWER: THE TOTAL SALES OF APPLIANCES IN ONTARIO WERE TOTALING 202,346


------Q4. ADVISE THE MANAGEMENT OF KMS ON WHAT TO DO TO INCREASE THE REVENUE FROM THE BOTTOM 10 CUSTOMERS
------REVENUE FROM BOTTOM 10 CUSTOMERS
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 10 Customer_Name, Ship_Mode, Shipping_Cost, Sales, Discount, Unit_Price, Product_Category, sum (Order_Quantity) as Total_Order_Quantity
from [dbo] . [KMS Sql Case Study]
group by Customer_Name, Ship_Mode, Shipping_Cost, Sales, Discount, Unit_Price, Product_Category
order by Total_Order_Quantity asc 

----ANSWER: I) FROM THE RESULTS, THE BOTTOM 10 CUSTOMERS IN TERMS OF REVENUE SHOULD CONSIDER USING DELIVERY TRUCKS RATHER THHAN REGULAR AIR ONLY
-----------II) REDUCED SHIPPING COST BY USING A MORE ECONOMICAL MODE LIKE DELIVERY TRUCK DIFFERENT FROM WHAT THEY WOULD NORMALLY USE
----------III) SALE NEGOTIATION BY OFFERING REWARDS, INCREASED DISCOUNTS AND EXCLUSIVE DEALS FOR REPEATED PURCHASES


-----5. KMS INCURRED THE MOST SHIPPING COST USING WHICH SHIPPING METHOD?
select * from [dbo] . [KMS Sql Case Study]

SELECT Ship_Mode, sum (Shipping_Cost) as Total_Shipping_Cost
from [dbo] . [KMS Sql Case Study]
group by Ship_Mode
order by Total_Shipping_Cost desc

-----ANSWER: KMS INCURRED THE MOST SHIPPING COST USING DELIVERY TRUCK WITH A TOTAL SHIPPING COST OF APPROXIMATELY 51,972


------CASE SCENARIO II
------Q6. WHO ARE THE MOST VALUABLE CUSTOMERS AND WHAT PRODUCTS DO THEY TYPICALLY PURCHASE?
select * from [dbo] . [KMS Sql Case Study]

SELECT Customer_Name, Customer_Segment, Product_Sub_Category, sum (Sales) as Total_Sales
from [dbo] . [KMS Sql Case Study]
group by Customer_Name, Customer_Segment, Product_Sub_Category
order by Total_Sales

------USING TOP 10 MOST VALUABLE CUSTOMERS
SELECT TOP 10 Customer_Name, Customer_Segment, Product_Category, Product_Sub_Category, sum (Sales) as Total_Sales
from [dbo] . [KMS Sql Case Study]
group by Customer_Name, Customer_Segment, Product_Category, Product_Sub_Category
order by Total_Sales desc

------ANSWER: (SEE DATA OUTPUT SNIP FOR MOST VALUABLE CUSTOMERS) 
-------------THE MOST VALUABLE CUSTOMERS PURCHASE MOSTLY TECHNOLOGY PRODUCTS WHICH MOST LIKELY GENERATES HIGH RETURNS FOR THE COMPANY


------Q7. WHICH SMALL BUSINESS CUSTOMER HAD THE HIGHEST SALES?
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 1 Customer_Name, sum (Sales) as Sales
from [dbo] . [KMS Sql Case Study]
where Customer_Segment = 'Small Business'
group by Customer_Name
order by Sales desc

------ANSWER: DENNIS KANE WAS THE SMALL BUSINESS CUSTOMER WITH THE HIGHEST SALES TOTALING 75,968


-------Q8. WHICH CORPORATE CUSTOMER PLACED THE MOST ORDERS IN 2009-2012?
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 1 Customer_Name, sum(Order_Quantity) as Order_Quantity
from [dbo] . [KMS Sql Case Study]
where Customer_Segment = 'Corporate'
group by Customer_Name
order by Order_Quantity desc

-------ANSWER: ROY SKARIA WAS THE COPORATE CUSTOMER THAT PLACED THE MOST ORDERS FROM 2009-2012 WITH A TOTAL OF 773 ORDERS


-----SORT ORDER YEAR
select year (Order_Date) as Order_Year
from [dbo] . [KMS Sql Case Study]
order by Order_Year


-------Q9. WHICH CONSUMER CUSTOMER WAS THE MOST PROFITABLE ONE?
select * from [dbo] . [KMS Sql Case Study]

SELECT TOP 1 Customer_Name, sum (Profit) as Profit
from [dbo] . [KMS Sql Case Study]
where Customer_Segment = 'Consumer'
group by Customer_Name
order by Profit desc

------ANSWER: EMILY PHAN WAS THE MOST PROFITABLE CONSUMER CUSTOMER GROSSING A LITTLE OVER 34,000 IN PROFIT 


------Q10. WHICH CUSTOMER RETURNED ITEMS AND WHAT SEGMENT DO THE BELONG TO? 
select * from [dbo] . [KMS Sql Case Study]

select * from Order_Status

select count (Status) as Return_Status
from Order_Status

SELECT [dbo] . [KMS Sql Case Study].Order_ID,
       [dbo] . [KMS Sql Case Study].Customer_Name,
       [dbo] . [KMS Sql Case Study].Customer_Segment,
	   Order_Status.Status

from [dbo] . [KMS Sql Case Study]
JOIN Order_Status
on Order_Status.Order_ID =[dbo] . [KMS Sql Case Study].Order_ID

-------ANSWER: 572 CUSTOMERS RETURNED ITEMS (SEE DATA OUTPUT)


-------Q11. IF DELIVERY TRUCK IS THE MOST ECONOMICAL BUT SLOWEST
-----------AND EXPRESS AIR IS THE MOST EXPENSIVE BUT FASTEST
-----------DID THE COMPANY APPROPRIATELY SPEND SHIPPING COSTS BASED ON ORDER PRIORITY?
select * from [dbo] . [KMS Sql Case Study]

SELECT Order_Priority, Ship_Mode, ROUND(SUM(Sales - Profit),2) AS Estimated_Shipping_Cost,
AVG(DATEDIFF(DAY, [Order_Date],[Ship_Date])) AS Average_Ship_Days, 
COUNT(Order_ID) AS Order_Count
FROM [dbo] . [KMS Sql Case Study]
where Ship_Mode = 'Delivery Truck' or Ship_Mode = 'Express Air'
group by Order_Priority, Ship_Mode
order by Estimated_Shipping_Cost desc

-------(SEE ANSWER IN PROJECT REPORT)


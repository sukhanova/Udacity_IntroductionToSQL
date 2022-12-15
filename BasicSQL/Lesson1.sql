
/* The LIMIT command is always the very last part of a query.

/*
Try using LIMIT yourself below by writing a query that displays all the data 
in the occurred_at, account_id, and channel columns of the web_events table, 
and limits the output to only the first 15 rows.
*/

SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;



/* The ORDER BY statement allows us to sort our results using the data in any column.
 If you are familiar with Excel or Google Sheets, using ORDER BY is similar to sorting a sheet using a column. 
 A key difference, however, is that using ORDER BY in a SQL query only has temporary effects, 
 for the results of that query, unlike sorting a sheet by column in Excel or Sheets.



 /*
 Write a query to return the 10 earliest orders in the orders table. 
 Include the id, occurred_at, and total_amt_usd.
*/
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at ASC
LIMIT 10;


/*
Write a query to return the top 5 orders in terms of the largest total_amt_usd. 
Include the id, account_id, and total_amt_usd.
*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;


/*
Write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. 
Include the id, account_id, and total_amt_usd
*/

SELECT id, account_id, total_amt_usd
FROM orders
WHERE total_amt_usd > 0
ORDER BY total_amt_usd ASC
LIMIT 20;
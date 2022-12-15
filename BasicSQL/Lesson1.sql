
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



/*
When you provide a list of columns in an ORDER BY command, 
the sorting occurs using the leftmost column in your list first, 
then the next column from the left, and so on. 
We still have the ability to flip the way we order using DESC
*/

SELECT  account_id,
        total_amt_usd
FROM orders
ORDER By total_amt_usd DESC, account_id;

/*
Write a query that displays the order ID, account ID, and total dollar amount 
for all the orders, sorted first by the account ID (in ascending order), 
and then by the total dollar amount (in descending order).
*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER By account_id, total_amt_usd DESC;


/*
Now write a query that again displays order ID, account ID, and total dollar amount
 for each order, but this time sorted first by total dollar amount 
 (in descending order), and then by account ID (in ascending order).
*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER By total_amt_usd DESC, account_id;


/*
Compare the results of these two queries above. 
How are the results different when you switch the column you sort on first?*/
/*
In query #1, all of the orders for each account ID are grouped together, 
and then within each of those groupings, the orders appear from the greatest order 
amount to the least. In query #2, since you sorted by the total dollar amount first, 
the orders appear from greatest to least regardless of which account ID they were from. 
Then they are sorted by account ID next. 
(The secondary sorting by account ID is difficult to see here since only 
if there were two orders with equal total dollar amounts would there need to be any sorting by account ID.)
*/


/*
Using the WHERE statement, we can display subsets of tables based on conditions that must be met. 
You can also think of the WHERE command as filtering the data.
*/

/*Write a query that pulls the first 5 rows and all columns 
from the orders table that have a dollar amount of gloss_amt_usd 
greater than or equal to 1000.
*/

SELECT * 
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;


/*
Write aquery that pulls the first 10 rows and all columns 
from the orders table that have a total_amt_usd less than 500.
*/

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;


/*
Filter the accounts table to include the company name, website, 
and the primary point of contact (primary_poc) just for the Exxon Mobil company 
in the accounts table.
*/

Select name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';
/*SUM*/
/* Q: Find the total amount of poster_qty paper ordered in the orders table.
A: 723646*/
SELECT SUM(poster_qty) as poster_qty_orderes
FROM orders

/*
Q: Find the total amount of standard_qty paper ordered in the orders table.
A: 1938346
*/
SELECT SUM(standard_qty) as standard_qty_ordered
FROM orders

/*
Q: Find the total dollar amount of sales using the total_amt_usd in the orders table.
A: 23141511.83
*/
SELECT SUM(total_amt_usd) as total_sales_in_usd
FROM orders


/*
Q: Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.
A: 6912 results
*/

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

/*
Q: Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both aggregation and a mathematical operator
A: 4.990000
*/
SELECT SUM(standard_amt_usd) / SUM(standard_qty) AS price_per_unit
FROM orders


/*MIN, MAX, & AVERAGE*/
/*
Q: When was the earliest order ever placed? You only need to return the date.
A: 2013-12-04T04:22:44.000Z
*/
SELECT MIN(occurred_at) as earliest_order_date
FROM orders

/*
Q: Try performing the same query as in question 1 without using an aggregation function.
A: 2013-12-04T04:22:44.000Z
*/
SELECT occurred_at as earliest_order_date
FROM orders
ORDER BY occurred_at
LIMIT 1

/*
Q: When did the most recent (latest) web_event occur?
A: 2017-01-01T23:51:09.000Z
*/
SELECT MAX(occurred_at) as latest_web_event
FROM web_events

/*
Q: Try to perform the result of the previous query without using an aggregation function.
A: 2017-01-01T23:51:09.000Z
*/
SELECT occurred_at as latest_web_event
FROM web_events
ORDER BY occurred_at desc
LIMIT 1

/*
Q: Find the mean (AVERAGE) amount spent per order on each paper type, 
as well as the mean amount of each paper type purchased per order. 
Your final answer should have 6 values - one for each paper type for the average number of sales, 
as well as the average amount.
A: 
*/
SELECT AVG(standard_qty) as standard, AVG (gloss_qty) as gloss,
        AVG (poster_qty) as poster, AVG(standard_amt_usd) as standard_usd,
        AVG (gloss_amt_usd) as gloss_usd, AVG(poster_amt_usd) as poster_amt_usd
FROM orders


/*GROUP BY*/
/*
Q: Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
A: DISH Network	 2013-12-04T04:22:44.000Z
*/
SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1


/*
Q: Find the total sales in usd for each account. 
You should include two columns - the total sales for each company's orders in usd and the company name.
A:
*/
SELECT a.name, SUM(total_amt_usd) as total_sales
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY a.name

/*
Q: Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
A: 2017-01-01T23:51:09.000Z	organic	Molina Healthcare
*/
SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY w.occurred_at DESC
LIMIT 1

/*
Q: Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
A:
*/
SELECT channel, COUNT(channel)
FROM web_events
GROUP BY channel

/*
Q: Who was the primary contact associated with the earliest web_event?
A: Leana Hawker
*/
SELECT a.primary_poc
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1

/*
Q: What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. 
Order from smallest dollar amounts to largest.
*/
SELECT a.name, MIN(total_amt_usd) as smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order


/*GROUP BY Part II*/

/*
Q: For each account, determine the average amount of each type of paper they purchased across their orders. 
Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
*/
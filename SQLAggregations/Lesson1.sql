/*
NULLs are a datatype that specifies where no data exists in SQL. 
They are often ignored in our aggregation functions.
*/

/*NULLs and Aggregation*/

/*
Notice that NULLs are different than a zero - they are cells where data does not exist.

When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL.
We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.
*/

SELECT *
FROM accounts
WHERE primary_poc IS NULL


SELECT *
FROM accounts
WHERE primary_poc IS NOT NULL


/*COUNT*/
/*COUNT does not consider rows that have NULL values.*/
SELECT COUNT(primary_poc) AS account_primary_poc_count
FROM accounts


/*SUM*/
/*Unlike COUNT, you can only use SUM on numeric columns. However, SUM will ignore NULL values*/

/*SQL Aggregations*/
/*
1. Find the total amount of poster_qty paper ordered in the orders table:
*/

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders

/*
2. Find the total amount of standard_qty paper ordered in the orders table:
*/

SELECT SUM(standard_qty) AS total_standard_sales
FROM orders

/*
3. Find the total dollar amount of sales using the total_amt_usd in the orders table:
*/
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders

/*
4. Find the total amount for each individual order that was spent on standard and gloss paper 
in the orders table. 
This should give a dollar amount for each order in the table:
*/

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders

/*
5. Find the standard_amt_usd per unit of standard_qty paper. 
Your solution should use both aggregation and a mathematical operator.
*/

SELECT SUM(standard_amt_usd)/SUM(standard_qty) 
AS standard_price_per_unit
FROM orders


/*
 MAX*/
/*

 and MAX are similar to COUNT in that they can be used 
on non-numerical columns. Depending on the column type, 

MIN will return the lowest number, earliest date, 
or non-numerical value as early in the alphabet as possible. 

MAX does the opposite—it returns the highest number, 
the latest date, or the non-numerical value 
closest alphabetically to “Z.”
*/

SELECT MIN(standard_qty) AS standard_min,
       MIN(gloss_qty) AS gloss_min,
       MIN(poster_qty) AS poster_min,
       MAX(standard_qty) AS standard_max,
       MAX(gloss_qty) AS gloss_max,
       MAX(poster_qty) AS poster_max
FROM   orders


/*AVG*/

/*
AVG returns the mean of the data - the sum of all of the values
 in the column divided by the number of values in a column. 
 This aggregate function again ignores the NULL values 
 in both the numerator and the denominator.
*/

SELECT AVG(standard_qty) AS standard_avg,
       AVG(gloss_qty) AS gloss_avg,
       AVG(poster_qty) AS poster_avg
FROM orders


/*Questions: MIN, MAX, & AVERAGE*/

/*1. When was the earliest order ever placed?*/
SELECT MIN(occurred_at) 
FROM orders;


/*2. Try performing the same query as in question 1 without using an aggregation function.*/
SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;



/*3.When did the most recent (latest) web_event occur?*/
SELECT MAX(occurred_at)
FROM web_events;


/*4. Perform the result of the previous query without using an aggregation function.*/
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;


/*
5. Find the mean (AVERAGE) amount spent per order on each paper type,
 as well as the mean amount of each paper type purchased per order. 
 Your final answer should have 6 values:
  - one for each paper type for the average number of sales,
   as well as the average amount.
*/
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
        AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
        AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;


/*6. what is the MEDIAN total_usd spent on all orders?*/
SELECT *
FROM (SELECT total_amt_usd
   FROM orders
   ORDER BY total_amt_usd
   LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
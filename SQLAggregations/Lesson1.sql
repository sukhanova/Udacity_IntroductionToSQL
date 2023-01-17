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
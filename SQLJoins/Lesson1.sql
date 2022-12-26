
/*
the SELECT clause indicates which column(s) of data you'd like to see in the output 
(For Example, orders.* gives us all the columns in the orders table in the output). 
The FROM clause indicates the first table from which we're pulling data, 
and the JOIN indicates the second table. 
The ON clause specifies the column on which you'd like to merge the two tables together.
*/

SELECT orders.*,
       accounts.*
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id;


/*
Quiz Questions
*/
/*
Try pulling all the data from the accounts table, 
and all the data from the orders table.
*/
SELECT accounts.*, orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;


/*
Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, 
and the website and the primary_poc from the accounts table.
*/
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty,
        accounts.website, accounts.primary_poc
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

/*
Provide a table for all the for all web_events associated with account name of Walmart.
 There should be three columns. Be sure to include the primary_poc, time of the event,
  and the channel for each event. 
  Additionally, you might choose to add a fourth column to assure only Walmart events 
  were chosen.
*/

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';


/*
Provide a table that provides the region for each sales_rep 
along with their associated accounts. 
Your final table should include three columns: 
the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
*/

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

/*
Provide the name for each region for every order, 
as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
Your final table should have 3 columns: 
region name, account name, and unit price. 
A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
*/

ELECT r.name region, a.name account, 
    o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;
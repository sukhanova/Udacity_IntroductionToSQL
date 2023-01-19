SELECT orders.*, accounts.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id


select accounts.name, sum(orders.total)
from accounts
join orders
on accounts.id = orders.account_id
group by name
order by name


/*
Pull standard_qty, gloss_qty, and poster_qty from the orders table, 
and the website and the primary_poc from the accounts table.
*/

SELECT accounts.primary_poc , orders.standard_qty, orders.gloss_qty, orders.poster_qty
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
ORDER BY primary_poc


/*When we JOIN tables together, it is nice to give each table an alias.
Frequently an alias is just the first letter of the table name*/
SELECT a.name, o.total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
ORDER BY name


/*
Provide a table for all web_events associated with the account name of Walmart.
 There should be three columns.
  Be sure to include the primary_poc, time of the event, and the channel for each event.
   Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
*/

SELECT a.name, a.primary_poc, w.channel, w.occurred_at
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart' 


/*
Provide a table that provides the region for each sales_rep along with their associated accounts.
 Your final table should include three columns: 
    the region name,
    the sales rep name, 
    and the account name. 
Sort the accounts alphabetically (A-Z) according to the account name.
*/

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a 
ON a.sales_rep_id = s.id
ORDER BY a.name


/*
Provide the name for each region for every order,
 as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
  Your final table should have 3 columns: region name, account name, and unit price.
   A few accounts have 0 for total, so divide by (total + 0.01) to assure not dividing by zero.
*/


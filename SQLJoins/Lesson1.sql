
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
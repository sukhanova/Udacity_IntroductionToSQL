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


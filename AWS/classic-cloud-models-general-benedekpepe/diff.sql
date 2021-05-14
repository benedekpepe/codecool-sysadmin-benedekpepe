select month(paymentDate), sum(amount) 
from payments 
where paymentDate between '2004-01-01' and '2005-01-01'
group by month(paymentDate)


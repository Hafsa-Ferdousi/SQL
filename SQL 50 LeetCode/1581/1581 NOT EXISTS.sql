select v.customer_id,
       count(*) as count_no_trans
from Visits v
where not exists (
    select 1
    from Transactions t
    where t.visit_id = v.visit_id
)
group by v.customer_id;
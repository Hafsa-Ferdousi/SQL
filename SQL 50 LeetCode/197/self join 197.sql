select distinct ww.id as id
from weather w1
join  weather ww
on datediff(ww.recordDate,w1.recordDate)=1
and ww.temperature>w1.temperature;
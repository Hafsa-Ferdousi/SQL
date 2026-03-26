select e.unique_id, em.name
from Employees as em
left join  EmployeeUNI as e on em.id=e.id;
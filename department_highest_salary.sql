select
    Department.Name as Department,
    Employee.Name as Employee,
    Employee.Salary as Salary
from Employee
    inner join Department on Department.Id = Employee.DepartmentId
where Employee.Salary 
    in (SELECT max(Salary) FROM Employee as e WHERE e.DepartmentId = Employee.DepartmentId group by DepartmentId)

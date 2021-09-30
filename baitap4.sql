-- question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select  a.accountID ,a.fullname,d.departmentID 
from `account`a 
inner join department d on a.departmentID = d.departmentID ;

-- question 2:Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select * 
from `account`
where CreatedDate < '2010-12-20';

-- question 3:Viết lệnh để lấy ra tất cả các developer
select a.AccountID, a.Email,a.UserName,a.FullName,p.PositionName 
from `account`a 
inner join Position p on  a.PositionID = p.PositionID;

-- question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select d.DepartmentID,
from Department d 
inner join `Account`a on d.DepartmentID=a.DepartmentID;



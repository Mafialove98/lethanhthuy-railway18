-- question 2 :
select * from Department;

-- question 3 :
select DepartmentID from Department where DepartmentName = 'Phong Sale';


-- question 4 :lấy ra thông tin account có full name dài nhất
SELECT 
    *
FROM
    `Account`
WHERE
    LENGTH(FullName) = (SELECT 
            MAX(LENGTH(FullName))
        FROM
            `account`);
   

-- question 5:Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT 
    *
FROM
    `Account`
WHERE
    DepartmentID = 3;
    
    with a as(SELECT 
    *
FROM
    `Account`
WHERE
    DepartmentID = 3)
    select * from a where length(fullname) = (select max(length(fullname)) from a);
		 

-- question 6:Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT 
    GroupName
FROM
    `group`
WHERE
    CreatedDate <'2019-12-20';
    
-- question 7: Lấy ra ID của question có >= 4 câu trả lời 
SELECT 
    tongsocautraloibang4.questionID
FROM
    (SELECT 
        QuestionID, COUNT(QuestionID)
    FROM
        answer
    GROUP BY QuestionID
    HAVING COUNT(QuestionID) >= 4) AS tongsocautraloibang4;


-- question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT 
    `code`
FROM
    exam
WHERE
    Duration >= '60'
        AND CreatedDate < '2019-12-20';


-- question 9: Lấy ra 5 group được tạo gần đây nhất

select GroupName
from `group`
order by CreatedDate desc limit 5;

-- question 10 : Đếm số nhân viên thuộc department có id = 2

select count(AccountID)as sonhanviencodepartment2
from `account`
where departmentID = 2;

-- question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

select *
from `account`
where fullName like 'D%o' ;

-- question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam 
WHERE
    CreatedDate < '2019-12-20';
    
-- question 13 :Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM question 
WHERE
    Content LIKE 'câu hỏi%';
    
-- question 14: 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account` 
SET 
    Email = 'loc.nguyenba@vti.com.vn',
    FullName = 'Nguyễn Bá Lộc'
WHERE
    AccountID = 5;
    
-- question 15: update account có id = 5 sẽ thuộc group có id = 4

UPDATE groupaccount 
SET 
    accountID = 5
WHERE
    groupID = 4;






    




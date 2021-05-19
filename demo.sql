use C0221H1;

create table student(
    id int primary key auto_increment,
    name varchar(50) not null ,
    identity varchar(10) unique not null,
    age int check ( age BETWEEN 18 And 24),
    mark int default 0
);

alter table student
modify column mark float default 0;

create table class(
    id int primary key auto_increment,
    name varchar(50) not null
);

alter table student
add column class_id int;

alter table student
add constraint classFK
foreign key
(class_id) references class(id);

-- DML
-- lay ra ten va tuoi cua hoc vien
select * -- * tuong ung voi viec lay ra tat ca cac cot
from student, class;

-- 2.	Hiển thị tất cả các bạn học viên có tuổi nhỏ hơn 23
select *
from student
where age < 23;

-- Tuoi trong khoang 22 - 25
select *
from student
where age between 22 and 25;

-- Tim ten co chua chu Q
select *
from student
where name like '%Q%';

-- tim ten bat dau bang chu Q
select student.*, class.name
from student, class
where class.name like 'Q%';

-- Dem so luong sinh vien cua moi lop
select student.class_id, count(id) as 'So luong'
from student
group by student.class_id;

-- Tinh tong diem cua moi lop
select class_id, sum(mark)
from student
group by class_id;

-- Hien thi lop co so luong sinh vien > 2
select student.class_id, count(id) as 'So luong'
from student
group by student.class_id
having count(id) > 2;


-- Sap xep diem cua hoc vien giam dan
select *
from student
order by mark desc;

select *
from class;

insert into class (name) value ('Quan'),
                                ('C1220g1');

insert into class value (10, 'Hello');

-- cập nhật lớp có id = 3 thành 'C1220G1'
update class set name = 'C1220G1' where id = 3;

-- xoá lớp có id = 5
delete
from class
where id = 5;

-- Xoa tat ca ban ghi cua bang student
create table student_class(
    student_id int,
    class_id int,
    PRIMARY KEY (student_id, class_id),
    CONSTRAINT studentFK FOREIGN KEY (student_id) references student(id),
    constraint classFK1 foreign key (class_id) references class(id)
)


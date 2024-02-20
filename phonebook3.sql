-- phonebook 계정만들기

create user 'phone'@'%' identified by '1234';

-- phone 권한 부여
grant all privileges on phone_db.* to 'phone'@'%';
flush privileges;

-- 데이터베이스 생성
create database phone_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

-- drop database phone_db;
-- ---------------------------------------------
-- 테이블 만들기
create table person(
	person_id integer auto_increment primary key,
    name varchar(30) not null,
    hp varchar(30),
    company varchar(20)
);
-- drop table person;

insert into person
values(null, '황일영', '010-0000-0000', '02-1234-1234');

select person_id,
	   name,
       hp,
       company
from person;

delete from person


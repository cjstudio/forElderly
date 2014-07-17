use db_fc;

if exists ( select * 
 from  sysobjects
 where name = 'tb_test'
 and type = 'U')
 drop table tb_test
go
create table tb_test
(
	id bigint primary key IDENTITY(1,1),
	name varchar(32) not null ,
	sex char(2) not null default('男'),
	birthday date ,
	score int default(100),
	dercription varchar(256),
	CONSTRAINT chk_test_sexIn CHECK (sex in('男','女'))
)

INSERT INTO tb_test
(
	name ,
	sex ,
	birthday ,
	score ,
	dercription 
)
select '张仨','男','1992-11-10',100,'用一生下载你' union all
select '李四','女','1993-01-15',98,'用一生下载你' union all
select '王二麻子','男','2010-11-01',97,'用一生下载你' union all
select 'Someone','女','1896-05-29',96,'用一生下载你' 
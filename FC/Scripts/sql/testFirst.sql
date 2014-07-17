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
	sex char(2) not null default('��'),
	birthday date ,
	score int default(100),
	dercription varchar(256),
	CONSTRAINT chk_test_sexIn CHECK (sex in('��','Ů'))
)

INSERT INTO tb_test
(
	name ,
	sex ,
	birthday ,
	score ,
	dercription 
)
select '����','��','1992-11-10',100,'��һ��������' union all
select '����','Ů','1993-01-15',98,'��һ��������' union all
select '��������','��','2010-11-01',97,'��һ��������' union all
select 'Someone','Ů','1896-05-29',96,'��һ��������' 
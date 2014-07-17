use db_fc;

--------------------------------------------- �û���
create table tb_user
(
	id_i bigint primary key IDENTITY(10000,1),
	name_c varchar(32) not null ,
	passwd_c char(64) ,
	sex_c char(2) not null default('��') ,
	birthday_d date ,
	idCard_c char(18) ,
	phone_c varchar(15) ,
	email_c varchar(32) ,
	qq_c varchar(12) ,
	sina_c varchar(32) ,
	homeAddress_c varchar(64) ,		-- ����
	livingPlace_c varchar(64) ,		-- �־ӵ�
	dercription_c varchar(256) ,		-- ��������
	pic binary ,		-- ͼƬ �������ļ�
	picPath_c varchar(64),		-- ͼƬ·��
	authority_i int not null default(0),		-- Ȩ��
	type_i int not null default(0),		-- �û����ͣ�1��־Ը��2������4������8����Ա��
	signUpDate_dt datetime,		-- ע��ʱ��
	lastLoginDate_dt datetime,		-- �ϴε�¼ʱ��
	score_i int default(20),		-- ����
	CONSTRAINT chk_tbUser_sexIn CHECK (sex_c in('��','Ů'))
)
---- ################################################# �û���

------------------------------------------------------ ������
CREATE TABLE tb_community
(
	id_i bigint not null primary key IDENTITY(10000,1),
	name_c varchar(32) not null ,
	address_c varchar(64) ,
	adminId_i bigint not null ,
	status_i int NOT NULL default(0) ,		-- �˺�״̬����
	CONSTRAINT fk_communityAdminId_tbUser foreign key (adminId_i) 
		references tb_user(id_i)
)
---- ################################################# ������

------------------------------------------------------ ��
CREATE TABLE tb_journal
(
	id_i bigint not null,
	status_i int NOT NULL default(0),		-- �˺�״̬�����״̬��
	identity_i int NOT NULL default(0),
	CONSTRAINT fk_journalId_tbUser foreign key (id_i) 
		references tb_user(id_i)
)
---- ################################################# ��

------------------------------------------------------ ����״̬��
CREATE TABLE tb_healthyType
(
	id_i int primary key IDENTITY(1,1),
	name_c varchar(64),
	parentId_i int default(0),
	description_c varchar(254)
)
---- ################################################# ����״̬��

------------------------------------------------------ �������ͱ�
CREATE TABLE tb_serviceType
(
	id_i int primary key IDENTITY(1,1),
	name_c varchar(64),
	parentId_i int default(0),
	description_c varchar(254)
)

insert into tb_serviceType
(
	name_c ,description_c ,	parentId_i 
)
select '��������','',0 union all
select '������Ϊ','',0 union all
select '��������','',0 union all
select '���콻��','���������죬����',1 union all 
select '������ѯ','������������ѯ���ų�������',1 union all 
select 'ɢ��','��ɢ��',1 union all 
select '�赸','�̡�������',1 union all 
select '���','���Ͻֹ���',1 union all 
select '�̳̹۹�','���������ܱ߶�;�۹�����',1 union all 
select '�齨������Ȥ����','���������ҵ���ͬ��Ȥ�����ߣ��齨��Ȥ���壬���������˶��ڿ��Ż',1 union all
select 'Ӣ��','���ҽ̰���ѧϰӢ��',2 union all
select '�鷨','�����ｻ�������鷨',2 union all
select '�滭','�����ｻ�����ۻ���',2 union all
select '��ֽ','�����ｻ�����ۼ�ֽ',2 union all
select '����','���ҽ���������',2 union all
select '����','����������Ϸ������Ů��Ƶͨ��',2 union all
select '�ֹ�����','���ҽ��ֹ�����',2 union all
select '����֯�','Э��������չ����֯����ḻ�������ʵ�����˹����к������ֵ',2 union all
select '��ɨ����','���Ҹ���ɨ����',3 union all
select '����','���ڵ��Ҹ�����������ʱ�����ע����',3 union all
select '����','���������������Ʒ',3 union all
select 'ҽ����ѯ','��������ѯ',3 union all
select 'Э�����','��ҽԺ�������',3 union all
select '�����','������������չ����֯�����������ǰȥ�μ�',3 
---- ################################################# �������ͱ�

------------------------------------------------------ ���˱�
CREATE TABLE tb_elderly
(
	id_i bigint not null,
	status_i int NOT NULL default(0),		-- �˺�״̬����
	healthyType_i bigint,
	CONSTRAINT fk_elderlyId_tbUser foreign key (id_i) 
		references tb_user(id_i),
	CONSTRAINT fk_healthyTypeId_tbUser foreign key (healthyType_i) 
		references tb_healthyType(id_i)
)
---- ################################################# ���˱�

------------------------------------------------------ ��־���ͱ�
CREATE TABLE tb_article
(
	id_i bigint primary key IDENTITY(1,1),
	title_c varchar(64) ,
	authorId_i bigint ,
	content_t ntext ,
	createTime_dt datetime ,
	updateTime_dt datetime ,
	description_c varchar(256),
	status_i int not null default(0),
	CONSTRAINT fk_authorId_tbUser foreign key (authorId_i) 
		references tb_user(id_i)
)

if (object_id('tgr_article_insert', 'tr') is not null)
    drop trigger tgr_article_insert
go
create trigger tgr_article_insert
on tb_article
    for insert 
as
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_article set createTime_dt=getdate()  
		where id_i=@id;
go

if (object_id('tgr_article_update', 'tr') is not null)
    drop trigger tgr_article_update
go
create trigger tgr_article_update
on tb_article
    for update 
as  
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_article set updateTime_dt=getdate()  
		where id_i=@id;
go

----################################################## ��־���ͱ�

------------------------------------------------------ ���
CREATE TABLE tb_exercise
(
	id_i bigint primary key IDENTITY(1,1),
	title_c varchar(64) ,
	authorId_i bigint ,
	content_t ntext ,
	addressId_i bigint ,
	address_c varchar(64) ,
	users_t text,
	createTime_dt datetime ,
	updateTime_dt datetime ,
	ingTime_dt datetime ,
	description_c varchar(256),
	status_i int not null default(0),
	CONSTRAINT fk_exe_authorId_tbUser foreign key (authorId_i) 
		references tb_user(id_i),
	CONSTRAINT fk_exe_addressId_tbUser foreign key (addressId_i) 
		references tb_cityzone(id_i)
)

if (object_id('tgr_exercise_insert', 'tr') is not null)
    drop trigger tgr_exercise_insert
go
create trigger tgr_exercise_insert
on tb_exercise
    for insert 
as
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_exercise set createTime_dt=getdate()  
		where id_i=@id;
go

if (object_id('tgr_exercise_update', 'tr') is not null)
    drop trigger tgr_exercise_update
go
create trigger tgr_exercise_update
on tb_exercise
    for update 
as  
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_exercise set updateTime_dt=getdate()  
		where id_i=@id;
go
----################################################## ���






------------------------------------------------------

-- ����û����Զ����䴥����
if (object_id('tgr_user_insert', 'tr') is not null)
    drop trigger tgr_user_insert
go
create trigger tgr_user_insert
on tb_user
    for insert 
as
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_user set signUpDate_dt=getdate()  
		where id_i=@id;
go

---- ����Զ������û����͵Ĵ�����
if (object_id('tgr_journal_insert', 'tr') is not null)
    drop trigger tgr_journal_insert
go
create trigger tgr_journal_insert
on tb_journal
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = id_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|1
		where id_i=@id;
go

---- �����������������Ա�Զ������û����͵Ĵ�����
if (object_id('tgr_community_insert', 'tr') is not null)
    drop trigger tgr_community_insert
go 
create trigger tgr_community_insert
on tb_community
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = adminId_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|2
		where id_i=@id;
go

---- ��������Զ������û����͵Ĵ�����
if (object_id('tgr_elderly_insert', 'tr') is not null)
    drop trigger tgr_elderly_insert
go 
create trigger tgr_elderly_insert
on tb_elderly
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = id_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|4
		where id_i=@id;
go
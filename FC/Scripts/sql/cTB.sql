use db_fc;

--------------------------------------------- 用户表
create table tb_user
(
	id_i bigint primary key IDENTITY(10000,1),
	name_c varchar(32) not null ,
	passwd_c char(64) ,
	sex_c char(2) not null default('男') ,
	birthday_d date ,
	idCard_c char(18) ,
	phone_c varchar(15) ,
	email_c varchar(32) ,
	qq_c varchar(12) ,
	sina_c varchar(32) ,
	homeAddress_c varchar(64) ,		-- 籍贯
	livingPlace_c varchar(64) ,		-- 现居地
	dercription_c varchar(256) ,		-- 其它描述
	pic binary ,		-- 图片 二进制文件
	picPath_c varchar(64),		-- 图片路径
	authority_i int not null default(0),		-- 权限
	type_i int not null default(0),		-- 用户类型（1，志愿者2，社区4，老人8管理员）
	signUpDate_dt datetime,		-- 注册时间
	lastLoginDate_dt datetime,		-- 上次登录时间
	score_i int default(20),		-- 积分
	CONSTRAINT chk_tbUser_sexIn CHECK (sex_c in('男','女'))
)
---- ################################################# 用户表

------------------------------------------------------ 社区表
CREATE TABLE tb_community
(
	id_i bigint not null primary key IDENTITY(10000,1),
	name_c varchar(32) not null ,
	address_c varchar(64) ,
	adminId_i bigint not null ,
	status_i int NOT NULL default(0) ,		-- 账号状态（）
	CONSTRAINT fk_communityAdminId_tbUser foreign key (adminId_i) 
		references tb_user(id_i)
)
---- ################################################# 社区表

------------------------------------------------------ 表
CREATE TABLE tb_journal
(
	id_i bigint not null,
	status_i int NOT NULL default(0),		-- 账号状态（审核状态）
	identity_i int NOT NULL default(0),
	CONSTRAINT fk_journalId_tbUser foreign key (id_i) 
		references tb_user(id_i)
)
---- ################################################# 表

------------------------------------------------------ 健康状态表
CREATE TABLE tb_healthyType
(
	id_i int primary key IDENTITY(1,1),
	name_c varchar(64),
	parentId_i int default(0),
	description_c varchar(254)
)
---- ################################################# 健康状态表

------------------------------------------------------ 服务类型表
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
select '老有所乐','',0 union all
select '老有所为','',0 union all
select '老有所依','',0 union all
select '聊天交流','到家陪聊天，解闷',1 union all 
select '心理咨询','到家做心理咨询，排除心理疾病',1 union all 
select '散步','陪散步',1 union all 
select '舞蹈','教、陪跳舞',1 union all 
select '逛街','陪上街购物',1 union all 
select '短程观光','陪在社区周边短途观光旅游',1 union all 
select '组建老人兴趣团体','帮助老人找到共同兴趣爱好者，组建兴趣团体，并帮助老人定期开着活动',1 union all
select '英语','到家教帮助学习英语',2 union all
select '书法','到家里交流讨论书法',2 union all
select '绘画','到家里交流讨论画画',2 union all
select '剪纸','到家里交流讨论剪纸',2 union all
select '象棋','到家教陪下象棋',2 union all
select '上网','帮助上网游戏、和子女视频通话',2 union all
select '手工制作','到家教手工制作',2 union all
select '党组织活动','协助社区开展党组织活动，丰富老人生活，实现老人归属感和自身价值',2 union all
select '打扫卫生','到家给打扫卫生',3 union all
select '做饭','定期到家给做饭，做饭时间需标注明白',3 union all
select '购物','帮助购买生活必须品',3 union all
select '医疗咨询','做健康咨询',3 union all
select '协助体检','带医院定期体检',3 union all
select '社区活动','定期在社区开展党组织活动，带领老人前去参加',3 
---- ################################################# 服务类型表

------------------------------------------------------ 老人表
CREATE TABLE tb_elderly
(
	id_i bigint not null,
	status_i int NOT NULL default(0),		-- 账号状态（）
	healthyType_i bigint,
	CONSTRAINT fk_elderlyId_tbUser foreign key (id_i) 
		references tb_user(id_i),
	CONSTRAINT fk_healthyTypeId_tbUser foreign key (healthyType_i) 
		references tb_healthyType(id_i)
)
---- ################################################# 老人表

------------------------------------------------------ 日志博客表
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

----################################################## 日志博客表

------------------------------------------------------ 活动表
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
----################################################## 活动表






------------------------------------------------------

-- 添加用户的自动补充触发器
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

---- 添加自动更改用户类型的触发器
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

---- 添加社区，社区管理员自动更改用户类型的触发器
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

---- 添加老人自动更改用户类型的触发器
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
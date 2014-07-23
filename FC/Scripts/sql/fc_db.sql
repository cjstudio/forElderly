USE [db_fc]
GO
/****** Object:  Table [dbo].[tb_contentType]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_contentType](
	[id_i] [int] IDENTITY(1,1) NOT NULL,
	[name_c] [varchar](32) NOT NULL,
	[parentType_i] [int] NULL,
	[description_c] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_healthyType]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_healthyType](
	[id_i] [bigint] IDENTITY(1,1) NOT NULL,
	[name_c] [varchar](64) NULL,
	[parentId_i] [bigint] NULL,
	[description_c] [varchar](254) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_user](
	[id_i] [bigint] IDENTITY(10000,1) NOT NULL,
	[name_c] [varchar](32) NOT NULL,
	[passwd_c] [char](64) NULL,
	[sex_c] [char](2) NOT NULL,
	[birthday_d] [date] NULL,
	[idCard_c] [char](18) NULL,
	[phone_c] [varchar](15) NULL,
	[email_c] [varchar](32) NULL,
	[qq_c] [varchar](12) NULL,
	[sina_c] [varchar](32) NULL,
	[homeAddress_c] [varchar](64) NULL,
	[livingPlace_c] [varchar](64) NULL,
	[dercription_c] [varchar](256) NULL,
	[pic] [binary](1) NULL,
	[picPath_c] [varchar](64) NULL,
	[authority_i] [int] NOT NULL,
	[type_i] [int] NOT NULL,
	[signUpDate_dt] [datetime] NULL,
	[lastLoginDate_dt] [datetime] NULL,
	[score_i] [int] NULL,
	[politicalStatus_c] [varchar](32) NULL,
	[homeAddress_i] [int] NULL,
	[livingAddress_i] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_test]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_test](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[sex] [char](2) NOT NULL,
	[birthday] [date] NULL,
	[score] [int] NULL,
	[dercription] [varchar](256) NULL,
	[content_t] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_serviceType]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_serviceType](
	[id_i] [int] IDENTITY(1,1) NOT NULL,
	[name_c] [varchar](64) NULL,
	[parentId_i] [int] NULL,
	[description_c] [varchar](254) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_province]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_province](
	[id_i] [int] NOT NULL,
	[name_c] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_journal]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_journal](
	[id_i] [bigint] NOT NULL,
	[status_i] [int] NOT NULL,
	[identity_i] [int] NULL,
	[profession_c] [nvarchar](32) NULL,
	[dangYuanPic_c] [varchar](32) NULL,
	[idCarcPic1_c] [varchar](32) NULL,
	[idCarcPic2_c] [nchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [tgr_user_insert]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_user_insert]
on [dbo].[tb_user]
    for insert 
as
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_user set signUpDate_dt=getdate()  
		where id_i=@id;
GO
/****** Object:  Table [dbo].[tb_elderly]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_elderly](
	[id_i] [bigint] NOT NULL,
	[status_i] [int] NOT NULL,
	[healthyType_i] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_city]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_city](
	[id_i] [int] NOT NULL,
	[name_c] [varchar](32) NULL,
	[provinceId_i] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_article]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_article](
	[id_i] [bigint] IDENTITY(1,1) NOT NULL,
	[title_c] [varchar](64) NULL,
	[authorId_i] [bigint] NULL,
	[content_t] [text] NULL,
	[createTime_dt] [datetime] NULL,
	[updateTime_dt] [datetime] NULL,
	[status_i] [int] NOT NULL,
	[type_i] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_community]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_community](
	[id_i] [bigint] IDENTITY(10000,1) NOT NULL,
	[name_c] [varchar](32) NOT NULL,
	[address_c] [varchar](64) NULL,
	[adminId_i] [bigint] NOT NULL,
	[status_i] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [tgr_elderly_insert]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_elderly_insert]
on [dbo].[tb_elderly]
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = id_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|4
		where id_i=@id;
GO
/****** Object:  Trigger [tgr_community_insert]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_community_insert]
on [dbo].[tb_community]
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = adminId_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|2
		where id_i=@id;
GO
/****** Object:  Table [dbo].[tb_cityzone]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cityzone](
	[id_i] [int] NOT NULL,
	[name_c] [varchar](32) NULL,
	[cityId_i] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [tgr_journal_insert]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_journal_insert]
on [dbo].[tb_journal]
    for insert 
as
    declare @id bigint;
    declare @type int;
    select @id = id_i from inserted;
    select @type=type_i from tb_user where id_i=@id;
    update  tb_user set type_i = @type|1
		where id_i=@id;
GO
/****** Object:  Table [dbo].[tb_exercise]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exercise](
	[id_i] [bigint] IDENTITY(1,1) NOT NULL,
	[title_c] [varchar](64) NULL,
	[authorId_i] [bigint] NULL,
	[content_t] [ntext] NULL,
	[addressId_i] [int] NULL,
	[address_c] [varchar](64) NULL,
	[users_t] [text] NULL,
	[createTime_dt] [datetime] NULL,
	[updateTime_dt] [datetime] NULL,
	[ingTime_dt] [datetime] NULL,
	[description_c] [varchar](256) NULL,
	[status_i] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [tgr_exercise_update]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_exercise_update]
on [dbo].[tb_exercise]
    for update 
as  
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_exercise set updateTime_dt=getdate()  
		where id_i=@id;
GO
/****** Object:  Trigger [tgr_exercise_insert]    Script Date: 07/23/2014 23:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_exercise_insert]
on [dbo].[tb_exercise]
    for insert 
as
    declare @id bigint;
    select @id = id_i from inserted;
    update  tb_exercise set createTime_dt=getdate()  
		where id_i=@id;
GO
/****** Object:  Default [DF__tb_articl__conte__72910220]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_article] ADD  DEFAULT ('0') FOR [content_t]
GO
/****** Object:  Default [DF__tb_articl__statu__74794A92]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_article] ADD  DEFAULT ((0)) FOR [status_i]
GO
/****** Object:  Default [DF__tb_commun__statu__30C33EC3]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_community] ADD  DEFAULT ((0)) FOR [status_i]
GO
/****** Object:  Default [DF__tb_conten__paren__793DFFAF]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_contentType] ADD  DEFAULT ((0)) FOR [parentType_i]
GO
/****** Object:  Default [DF__tb_elderl__statu__5CA1C101]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_elderly] ADD  DEFAULT ((0)) FOR [status_i]
GO
/****** Object:  Default [DF__tb_exerci__statu__56E8E7AB]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_exercise] ADD  DEFAULT ((0)) FOR [status_i]
GO
/****** Object:  Default [DF__tb_helthy__paren__3C34F16F]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_healthyType] ADD  DEFAULT ((0)) FOR [parentId_i]
GO
/****** Object:  Default [DF__tb_journa__statu__29221CFB]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_journal] ADD  DEFAULT ((0)) FOR [status_i]
GO
/****** Object:  Default [DF__tb_servic__paren__6DCC4D03]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_serviceType] ADD  DEFAULT ((0)) FOR [parentId_i]
GO
/****** Object:  Default [DF__tb_test__sex__108B795B]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_test] ADD  DEFAULT ('男') FOR [sex]
GO
/****** Object:  Default [DF__tb_test__score__117F9D94]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_test] ADD  DEFAULT ((100)) FOR [score]
GO
/****** Object:  Default [DF__tb_user__sex_c__236943A5]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_user] ADD  DEFAULT ('男') FOR [sex_c]
GO
/****** Object:  Default [DF__tb_user__authori__245D67DE]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_user] ADD  DEFAULT ((0)) FOR [authority_i]
GO
/****** Object:  Default [DF__tb_user__type_i__25518C17]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_user] ADD  DEFAULT ((0)) FOR [type_i]
GO
/****** Object:  Default [DF__tb_user__score_i__2645B050]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_user] ADD  DEFAULT ((20)) FOR [score_i]
GO
/****** Object:  Check [chk_test_sexIn]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_test]  WITH CHECK ADD  CONSTRAINT [chk_test_sexIn] CHECK  (([sex]='女' OR [sex]='男'))
GO
ALTER TABLE [dbo].[tb_test] CHECK CONSTRAINT [chk_test_sexIn]
GO
/****** Object:  Check [chk_tbUser_sexIn]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_user]  WITH CHECK ADD  CONSTRAINT [chk_tbUser_sexIn] CHECK  (([sex_c]='女' OR [sex_c]='男'))
GO
ALTER TABLE [dbo].[tb_user] CHECK CONSTRAINT [chk_tbUser_sexIn]
GO
/****** Object:  ForeignKey [fk_authorId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_article]  WITH CHECK ADD  CONSTRAINT [fk_authorId_tbUser] FOREIGN KEY([authorId_i])
REFERENCES [dbo].[tb_user] ([id_i])
GO
ALTER TABLE [dbo].[tb_article] CHECK CONSTRAINT [fk_authorId_tbUser]
GO
/****** Object:  ForeignKey [fk_cityId_tbProvince]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_city]  WITH CHECK ADD  CONSTRAINT [fk_cityId_tbProvince] FOREIGN KEY([provinceId_i])
REFERENCES [dbo].[tb_province] ([id_i])
GO
ALTER TABLE [dbo].[tb_city] CHECK CONSTRAINT [fk_cityId_tbProvince]
GO
/****** Object:  ForeignKey [fk_cityId_tbCity]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_cityzone]  WITH CHECK ADD  CONSTRAINT [fk_cityId_tbCity] FOREIGN KEY([cityId_i])
REFERENCES [dbo].[tb_city] ([id_i])
GO
ALTER TABLE [dbo].[tb_cityzone] CHECK CONSTRAINT [fk_cityId_tbCity]
GO
/****** Object:  ForeignKey [fk_communityAdminId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_community]  WITH CHECK ADD  CONSTRAINT [fk_communityAdminId_tbUser] FOREIGN KEY([adminId_i])
REFERENCES [dbo].[tb_user] ([id_i])
GO
ALTER TABLE [dbo].[tb_community] CHECK CONSTRAINT [fk_communityAdminId_tbUser]
GO
/****** Object:  ForeignKey [fk_elderlyId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_elderly]  WITH CHECK ADD  CONSTRAINT [fk_elderlyId_tbUser] FOREIGN KEY([id_i])
REFERENCES [dbo].[tb_user] ([id_i])
GO
ALTER TABLE [dbo].[tb_elderly] CHECK CONSTRAINT [fk_elderlyId_tbUser]
GO
/****** Object:  ForeignKey [fk_healthyTypeId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_elderly]  WITH CHECK ADD  CONSTRAINT [fk_healthyTypeId_tbUser] FOREIGN KEY([healthyType_i])
REFERENCES [dbo].[tb_healthyType] ([id_i])
GO
ALTER TABLE [dbo].[tb_elderly] CHECK CONSTRAINT [fk_healthyTypeId_tbUser]
GO
/****** Object:  ForeignKey [fk_exe_addressId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_exercise]  WITH CHECK ADD  CONSTRAINT [fk_exe_addressId_tbUser] FOREIGN KEY([addressId_i])
REFERENCES [dbo].[tb_cityzone] ([id_i])
GO
ALTER TABLE [dbo].[tb_exercise] CHECK CONSTRAINT [fk_exe_addressId_tbUser]
GO
/****** Object:  ForeignKey [fk_exe_authorId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_exercise]  WITH CHECK ADD  CONSTRAINT [fk_exe_authorId_tbUser] FOREIGN KEY([authorId_i])
REFERENCES [dbo].[tb_user] ([id_i])
GO
ALTER TABLE [dbo].[tb_exercise] CHECK CONSTRAINT [fk_exe_authorId_tbUser]
GO
/****** Object:  ForeignKey [fk_journalId_tbUser]    Script Date: 07/23/2014 23:36:07 ******/
ALTER TABLE [dbo].[tb_journal]  WITH CHECK ADD  CONSTRAINT [fk_journalId_tbUser] FOREIGN KEY([id_i])
REFERENCES [dbo].[tb_user] ([id_i])
GO
ALTER TABLE [dbo].[tb_journal] CHECK CONSTRAINT [fk_journalId_tbUser]
GO

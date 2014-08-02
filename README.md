空巢老人服务平台
================

项目简介:
---------

本项目采用 ASP.NET 作为主体开发框架，ASP.NET具有诸多优点，如开发简易快捷、部署灵活、自定义性、高可扩展性、而且其采用了基于文本的分层配置系统，简化了将设置应用于服务器环境和Web 应用程序。为部署快捷，项目使用了IIS6 作WEB服务器，数据库采用了 Microsoft 的 SQL Server 2008 Express，前端使用了轻量级的javascript框架 JQuery 11.0，并协同Bootstrap 3.0工具包一同使用。

项目开发过程中，将Visual Studio 2010作为主要开发工具，同时，也用到了Dreamweaver CS5，Bluefish，Photoshop CS5等前端开发工具，以及数据库开发管理工具SQL Server Management，并使用了git做版本控制。


工程介绍
--------

###工程主要目录简介
> FC
>
> > About - (存放“关于我们”栏目的asp.net文件)
> >
> > Account - (存放账号基本信息修改的asp.net文件)
> >
> > > userPic - (存放用户上传的个人头像文件)
> >
> > Admin - (存放网站管理的文件，仅有admin有访问权限)
> >
> > Community - (存放社区相关的网页文件)
> >
> > Config - (存放网站的配置文件)
> >
> > Elderly - (存放与老人相关的网页文件)
> >
> > Img - (存放网站的静态图片、图标文件)
> >
> > Journal - (存放与志愿者相关的网页文件)
> >
> > JqueryUi - (存放JqueryUit的所有文件)
> >
> > Others - (存放与网站相关的未分类网页文件)
> >
> > Scripts - (共用的脚本文件，包括js、sql)
> >
> > Styles - (存放共用的css文件)
> >
> > TEST - (用于开发时，局部功能测试使用)

###工程的主要文件简介

/FC/Default.aspx

		首页文件框架：

/FC/Account/AjaxServer.aspx

		所有网页的ajax的服务端（除登陆功能外）

/Scripts/sql/db_fc.sql

		创建工程数据库的sql脚本文件

/Config/WebSite.config

		与网站内容和功能相关的主要配置文件（Key-Value）


单周工程进度（截止2014年7月23日 0:31:26 止）
----------------------------------------

### 已完成

1. 项目大体技术框架已基本确定

2. 网站框架已基本确定

3. “关于我们”栏目已完成

4. 用户基本信息的操作功能已完成

5. 用户密码重置功能已完成

6. 添加页面的后台管理功能

7. 首页滚图的后台管理功能


### 进行中

1. 志愿者认证功能
		
		志愿者有效信息的提交和管理员的认证

2. 社区管理员的功能
		
		社区老人的添加，老人服务的添加

### 下周工作计划

1. 完善


##本项目开源，详情请参考[Github项目主页](https://github.com/cjstudio/forElderly).##


insert into  tb_user
(
	name_c ,
	passwd_c ,
	sex_c ,
	birthday_d ,
	idCard_c ,
	phone_c ,
	email_c  ,
	qq_c  ,
	sina_c  ,
	homeAddress_c  ,		-- ����
	livingPlace_c  ,		-- �־ӵ�
	dercription_c  ,		-- ��������
	authority_i 		-- Ȩ��
)
select '��ɣ001','','��','1991-11-11','654321190010101011',
	'15111111111', 'excemple001@excemple.net','111111111',
	'001@sina.com','','','for test',7
union all
select '��ɣ002','','Ů','1992-01-11','654321190010101022',
	'15222222222', 'excemple002@excemple.net','222222222',
	'002@sina.com','','','for test',7
union all
select '��ɣ003','','��','1993-02-11','654321190010101033',
	'15333333333', 'excemple003@excemple.net','333333333',
	'003@sina.com','','','for test',7
	union all
select '��ɣ004','','Ů','1994-03-11','654321190010101044',
	'15444444444', 'excemple004@excemple.net','444444444',
	'004@sina.com','','','for test',7
union all
select '��ɣ005','','��','1995-04-11','654321190010101055',
	'15555555555', 'excemple005@excemple.net','555555555',
	'005@sina.com','','','for test',7
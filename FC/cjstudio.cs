using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace FC
{
    public static class cjstudio
    {
        public static string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
        public struct User
        {
            public string id, name, password32, email,idCard,sex,birthday,qq,homeAddress,livingAddress;
            public string description, picPath, politicalStatus, homeAddressId, livingAddressId,phone;
            public int type,auth,score;
            public DateTime birDT;
        }
        public struct Journal
        {
            public string id, description, dangyuanPic, politicalStatus,idCarcPic1,idCardPic2;
            public int auth, score;
        }
        public struct Article 
        {
            public int status;
            public string id, authorId, authorName, title, contentMd5, content, 
                contentType, contentTypeName;
            public DateTime updateDT, createDT;
        }

        public static List<Article> getArticleByTypeName(string typeName)
        {
            List<Article> articles = new List<Article>();
            Article article;

            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql;
                sql = "select tb_article.id_i as articleID, tb_user.name_c as AutherName, " +
                     "tb_article.id_i as AuthorID, tb_article.title_c as Title, " +
                     "tb_article.contentMd5_c as Md5,tb_article.content_t as Content, " +
                     "tb_article.type_i as ContentTypeID, t1.name_c as ContentTypeName, " +
                     "tb_article.createTime_dt as CreateTime,tb_article.updateTime_dt as UpdateTime " +
                     "from tb_article, tb_user, tb_contentType as t1 " +
                     "where tb_article.authorId_i = tb_user.id_i " +
                     "and tb_article.type_i = t1.id_i " +
                     "and (t1.name_c = '"+typeName+
                     "' or tb_article.type_i in ( select t2.id_i from tb_contentType as t2,tb_contentType as t3 "+
                     "where t3.id_i =t2.parentType_i and t3.name_c = '"+typeName+"'))";
                cmd = new SqlCommand(sql, conn);
                SqlDataAdapter adr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adr.Fill(dataset);
                DataTable rs = dataset.Tables[0];
                for (int i = 0; i < rs.Rows.Count; i++)
                {
                    article = new Article();
                    article.authorId = rs.Rows[i]["articleID"].ToString();
                    article.authorName = rs.Rows[i]["AutherName"].ToString();
                    article.authorId = rs.Rows[i]["AuthorID"].ToString();
                    article.title = rs.Rows[i]["Title"].ToString();
                    article.contentMd5 = rs.Rows[i]["Md5"].ToString();
                    article.content = rs.Rows[i]["Content"].ToString();
                    article.contentType = rs.Rows[i]["ContentTypeID"].ToString();
                    article.contentTypeName = rs.Rows[i]["ContentTypeName"].ToString();
                    
                    try
                    {
                        article.createDT = DateTime.Parse(rs.Rows[i]["CreateTime"].ToString());
                        article.updateDT = DateTime.Parse(rs.Rows[i]["UpdateTime"].ToString());
                    }
                    catch (Exception)
                    {
                        article.createDT = DateTime.Now;
                        article.updateDT = DateTime.Now;
                    } 

                    articles.Add(article);
                }
            }
            catch (Exception)
            {
                ;
            }
            return articles;
        }
        public static List<Article> getArticleByTypeId(int type) 
        {
            List<Article> articles = new List<Article>();
            Article article;

            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql;
                sql = "select tb_article.id_i as articleID, tb_user.name_c as AutherName, " +
                     "tb_article.id_i as AuthorID, tb_article.title_c as Title, " +
                     "tb_article.contentMd5_c as Md5,tb_article.content_t as Content, " +
                     "tb_article.type_i as ContentTypeID, t1.name_c as ContentTypeName, " +
                     "tb_article.createTime_dt as CreateTime,tb_article.updateTime_dt as UpdateTime " +
                     "from tb_article, tb_user, tb_contentType as t1 " +
                     "where tb_article.authorId_i = tb_user.id_i " +
                     "and tb_article.type_i = t1.id_i " +
                     "and ( tb_article.type_i = " + type+
                     " or tb_article.type_i in (select id_i from tb_contentType as t2"+
                     "where t2.parentType_i = "+type +" ))";
                cmd = new SqlCommand(sql, conn);
                SqlDataAdapter adr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adr.Fill(dataset);
                DataTable rs = dataset.Tables[0];
                for (int i = 0; i < rs.Rows.Count; i++) 
                {
                    article = new Article();
                    article.authorId = rs.Rows[i]["articleID"].ToString();
                    article.authorName = rs.Rows[i]["AutherName"].ToString();
                    article.authorId = rs.Rows[i]["AuthorID"].ToString();
                    article.title = rs.Rows[i]["Title"].ToString();
                    article.contentMd5 = rs.Rows[i]["Md5"].ToString();
                    article.content = rs.Rows[i]["Content"].ToString();
                    article.contentType = rs.Rows[i]["ContentTypeID"].ToString();
                    article.contentTypeName = rs.Rows[i]["ContentTypeName"].ToString();

                    try
                    {
                        article.createDT = DateTime.Parse(rs.Rows[i]["CreateTime"].ToString());
                        article.updateDT = DateTime.Parse(rs.Rows[i]["UpdateTime"].ToString());
                    }
                    catch (Exception)
                    {
                        article.createDT = DateTime.Now;
                        article.updateDT = DateTime.Now;
                    } 
                    articles.Add(article);
                }
            }
            catch (Exception)
            {
                ;
            }
            return articles;
        }
        public static bool addArticle(string uid,Article article)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "select * from tb_article where contentMd5_c = '" + article.contentMd5 + "'";
                int status;
                cmd = new SqlCommand(sql, conn);

                SqlDataAdapter adr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adr.Fill(dataset);
                DataTable rs = dataset.Tables[0];
                status = rs.Rows.Count;
                if (status != 0)
                {
                    return false;
                }

                sql = "insert into tb_article(title_c,authorId_i,status_i,type_i,contentMd5_c) values('" +
                article.title + "'," + uid + "," + article.status.ToString() + "," + article.contentType + ",'" + article.contentMd5 +
                "')";
                cmd.CommandText = sql;
                status = cmd.ExecuteNonQuery();
                if (status == 1)
                {
                    
                    sql = "declare @p varbinary(16) ;"+
                        "select @p=textptr(content_t) from tb_article where contentMd5_c = '"+
                        article .contentMd5+"' ;"+
                        "writetext tb_article.content_t @p '"+article.content+"'";
                    cmd.CommandText = sql;
                    status = cmd.ExecuteNonQuery();
                    if (status == -1)
                    {
                        cmd.Dispose();
                        conn.Close();
                        return true;
                    }
                }
            }
            catch (Exception)
            {
                ;
            }
            return false;
        }
        public static Dictionary<int, string> getContentType(int parentTypeId)
        {
            Dictionary<int, string> contentType = 
                new Dictionary<int,string>();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = 
                    "select id_i,name_c from tb_contentType where parentType_i = " + parentTypeId.ToString();
                cmd = new SqlCommand(sql, conn);
                SqlDataAdapter adr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adr.Fill(dataset);
                DataTable rs = dataset.Tables[0];
                for (int i = 0; i < rs.Rows.Count;i++ ) 
                {
                    int typeId = int.Parse(rs.Rows[i]["id_i"].ToString());
                    string typeName = rs.Rows[i]["name_c"].ToString();
                    contentType.Add(typeId, typeName);
                }
                return contentType;
            }
            catch (Exception)
            {
                ;
            }
            return null;
        }
        public static bool checkUserInput(string str)
        {
            string[] unlawfulChars = { "'", "\"", "<", ">", "-", " " };
            foreach (string s in unlawfulChars)
            {
                if (str.IndexOf(s) >= 0)
                    return false;
            }
            return true;
        }
        public static string getConfigValue(string key)
        {
            try
            {
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                return config.AppSettings.Settings[key].Value;
            }
            catch (Exception)
            {
                return "";
            }
        }
        public static bool setConfitKeyValue(string key, string value)
        {
            try
            {   
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                if (config.AppSettings.Settings[key].Value != "") 
                {
                    config.AppSettings.Settings.Remove(key);
                }
                config.AppSettings.Settings.Add(key,value);
                config.Save();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static string EncryptSHA256(string strPwd)
        {
            byte[] result = Encoding.Default.GetBytes(strPwd);
            SHA256 sha256 = new SHA256CryptoServiceProvider();
            byte[] output = sha256.ComputeHash(result);
            string str = BitConverter.ToString(output).Replace("-", "");
            return str.ToUpper();
        }
        public static string EncryptMd5(string strPwd)
        {
            byte[] result = Encoding.Default.GetBytes(strPwd);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            string str = BitConverter.ToString(output).Replace("-", "");
            return str.ToUpper();
        }
        public static bool isLoginSuccess(string uid, string passwd)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adr = new SqlDataAdapter();
            DataSet dataset = new DataSet();
            DataTable rs = new DataTable();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "select id_i,name_c,passwd_c,type_i,sex_c,picPath_c from tb_user where ";
                sql += getUsernameSql(uid);
                cmd = new SqlCommand(sql, conn);
                adr = new SqlDataAdapter(cmd);
                adr.Fill(dataset);
                rs = dataset.Tables[0];
                if (rs.Rows.Count == 1 &&
                    (passwd.Length == 32 ? EncryptSHA256(passwd).ToLower() : EncryptSHA256(EncryptMd5(passwd).ToLower()).ToLower())
                    == rs.Rows[0]["passwd_c"].ToString().Trim())
                {
                    return true;
                }
            }
            catch (Exception)
            {
                ;
            }
            return false;
        }
        public static string getUsernameSql(string namestr)
        {
            string str = "";
            try
            {
                Int32.Parse(namestr);
                str = " id_i = " + namestr + " ";
            }
            catch (Exception)
            {
                if (namestr.IndexOf("@") > 0)
                {
                    str = " email_c = '" + namestr + "' ";
                }
                else
                {
                    str = " name_c = '" + namestr + "' ";
                }
            }
            return str;
        }
        public static string getTypePath(string type)
        {
            try
            {
                int.Parse(type);
            }
            catch (Exception)
            {
                return "#" + type;
            }
            if ((int.Parse(type) & 1) != 0)
            {
                return "Journal/Journal.aspx";
            }
            else if ((int.Parse(type) & 2) != 0)
            {
                return "Community/Community.aspx";
            }
            else if ((int.Parse(type) & 4) != 0)
            {
                return "Elderly/Elderly.aspx";
            }
            else if ((int.Parse(type) & 8) != 0)
            {
                return "Admin/Default.aspx";
            }
            else
                return "#" + type;
        }
        public static string getTypePath(int type)
        {
            if ((type & 1) != 0)
            {
                return "Journal/Journal.aspx";
            }
            else if ((type & 2) != 0)
            {
                return "Community/Community.aspx";
            }
            else if ((type & 4) != 0)
            {
                return "Elderly/Elderly.aspx";
            }
            else if ((type & 8) != 0)
            {
                return "Admin/Default.aspx";
            }
            else
                return "#" + type;
        }
        public static bool updateUserPicPath(string uid, string picType)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "update tb_user set picPath_c = '"+uid+picType+"' where id_i = "+uid;
                cmd = new SqlCommand(sql, conn);
                int status =cmd.ExecuteNonQuery();
                if (status == 1)
                {
                    return true;
                }
            }
            catch (Exception)
            {
                ;
            }
            return false;
        }
        public static bool updateUserInformation(User user)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "update tb_user set name_c = '"+user.name+""+
                    "',phone_c = '"+user.phone +
                    "',birthday_d='"+ user.birthday +
                    "',sex_c='"+user.sex+
                    "',homeAddress_c='"+user.homeAddress+
                    "',livingPlace_c='" + user.livingAddress +
                    "' where id_i = " + user.id;
                cmd = new SqlCommand(sql, conn);
                int status = cmd.ExecuteNonQuery();
                if (status == 1)
                {
                    return true;
                }
            }
            catch (Exception)
            {
                ;
            }
            return false;
        }
        public static string getUserPicPath(string uid)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "select picPath_c from tb_user where id_i = " + uid;
                cmd = new SqlCommand(sql, conn);
                SqlDataAdapter adr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adr.Fill(dataset);
                DataTable rs = dataset.Tables[0];
                if (rs.Rows.Count == 1)
                {
                    return rs.Rows[0][0].ToString();
                }
            }
            catch (Exception)
            {
                ;
            }
            return "";
        }
        public static bool rePassword(string uid,string newpassword)
        {
            string password = EncryptSHA256(newpassword).ToLower();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                String sql = "update tb_user set passwd_c = '"+password+"' where id_i = " + uid;
                cmd = new SqlCommand(sql, conn);
                int status = cmd.ExecuteNonQuery();
                if (status == 1)
                {
                    return true;
                }
            }
            catch (Exception)
            {
                ;
            }
            return false;
        }
    }
}
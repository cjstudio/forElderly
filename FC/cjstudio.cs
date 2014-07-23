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
    public static  class cjstudio
    {
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
        public static string getValue(string key)
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
            string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
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
            string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
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
            string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
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
            string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
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
            string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FC
{
    public partial class Default : System.Web.UI.Page
    {
        public string uid, uname, utype, upasswd,member;
        public bool isIdenUser = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (getCookie())
            {
                isIdenUser = true;
            }
            else
            {
                Session.Clear();
            }
        }
        public bool getCookie()
        {
            HttpCookie cookie = Request.Cookies["fc_user"];
            if (cookie != null)
            {
                uid = cookie.Values["id"];
                upasswd = cookie.Values["password"];
                member = cookie.Values["member"];
                uname = cookie.Values["name"];
                if (isLoginSuccess(uid, upasswd))
                {
                    return true;
                }
            }
            return false;
        }
        public void setSession()
        {
            Session["uname"] = uname;
            Session["utype"] = utype;
            Session["uid"] = uid;
            Session["upasswd"] = upasswd;
        }
        public bool isLoginSuccess(string uid, string passwd)
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
                    ==rs.Rows[0]["passwd_c"].ToString().Trim())
                {
                    uname= rs.Rows[0]["name_c"].ToString();
                    utype = rs.Rows[0]["type_i"].ToString();
                    return true;
                }
                setSession();
            }
            catch(Exception)
            {
                uname = "Error";
            }
            return false;
        }
        public string getUsernameSql(string username)
        {
            string str="";
            try
            {
                Int64.Parse(username);
                str = " id_i = " + username + " ";
            }
            catch (Exception)
            {
                if (username.IndexOf("@") > 0)
                {
                    str = " email_c = '" + username + "' ";
                }
                else
                {
                    str = " name_c = '" + username + "' ";
                }
            }
            return str;
        }
        public string EncryptSHA256(string strPwd)
        {
            byte[] result = Encoding.Default.GetBytes(strPwd);
            SHA256 sha256 = new SHA256CryptoServiceProvider();
            byte[] output = sha256.ComputeHash(result);
            string str = BitConverter.ToString(output).Replace("-", "");
            return str.ToUpper();
        }
        public string EncryptMd5(string strPwd)
        {
            byte[] result = Encoding.Default.GetBytes(strPwd);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            string str = BitConverter.ToString(output).Replace("-", "");
            return str.ToUpper();
        }
        public string getTypePath()
        {
            if (utype == "")
            {
                getCookie();
            }
            if (utype == null)
            {
                try
                {
                    utype = Session["utype"].ToString();
                }
                catch (Exception)
                {
                    return "./";
                }
            }
                if ((int.Parse(utype) & 1) != 0)
                {
                    return "Journal/Journal.aspx";
                }
                else if ((int.Parse(utype) & 2) != 0)
                {
                    return "Community/Community.aspx";
                }
                else if ((int.Parse(utype) & 4) != 0)
                {
                    return "Elderly/Elderly.aspx";
                }
                else if ((int.Parse(utype) & 8) != 0)
                {
                    return "Admin/Default.aspx";
                }
                else
                    return "#" + utype;
        }
        public string getValue(string key)
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
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FC.Account
{
        
    public partial class SignUpScript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FC.cjstudio.User u_input = new FC.cjstudio.User();
            try
            {
                u_input.name  = HttpContext.Current.Request["username"].ToString();
                string tmp_passwd = HttpContext.Current.Request["password"];
                u_input.password32 = tmp_passwd.Length == 32 ? tmp_passwd : EncryptMd5(tmp_passwd);
                u_input.email = HttpContext.Current.Request["email"];
                u_input.type = int.Parse(HttpContext.Current.Request["type"]);
                if (!isLawfulInput(u_input.name) || !isLawfulInput(u_input.email))
                {
                    Response.Write("{ \"status\" : \"Error\", \"code\" : \"0\", \"msg\" : \"用户名或邮箱中存在敏感字符\"}");
                    Response.End();
                }
                if (u_input.name == "" || u_input.email == "")
                {
                    Response.Write("{ \"status\" : \"Error\", \"code\" : \"0\", \"msg\" : \"用户名或邮箱不能为空\"}");
                    Response.End();
                }
                Response.Clear();
            }
            catch (Exception)
            {
                Response.Write("{ \"status\" : \"Error\", \"code\" : \"1\", \"msg\" : \"Json 数据传输错误\"}");
                Response.End();
                return;
            }
            int insert_status =insertDB(u_input);
            if (insert_status <= 0)
            { 
                Response.Write("{ \"status\" : \"Error\", \"code\" : \"4\", \"msg\" : \"注册失败"+insert_status+"\"}");
                Response.End();
                return;
            }
            // 注册成功
            u_input.id = insert_status.ToString();
            Response.Write("{ \"status\" : \"Success\", \"id\" : \"" + insert_status
                + "\", \"email\" : \"" + u_input.email
                + "\", \"type\" : \"" + u_input.type.ToString()
                + "\", \"name\" : \"" + u_input.name + "\"}");
            Session["uname"] = u_input.name;
            Session["utype"] = u_input.type.ToString();
            Session["uid"] = u_input.id;
            Session["upasswd"] = u_input.password32;

            HttpCookie cookie = new HttpCookie("fc_user");
            cookie.Values.Add("id", u_input.id);
            cookie.Values.Add("name",u_input.name);
            cookie.Values.Add("password",u_input.password32);
            cookie.Values.Add("type", u_input.type.ToString());
            Response.AppendCookie(cookie);
            Response.End();
        }
        public bool checkInsert(FC.cjstudio.User user)
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
                String sql = "select id_i from tb_user where email_c = '";
                sql += user.email+"' ";
                cmd = new SqlCommand(sql, conn);
                adr = new SqlDataAdapter(cmd);
                adr.Fill(dataset);
                rs = dataset.Tables[0];
                if (rs.Rows.Count != 0)
                {
                    Response.Write("{ \"status\" : \"Error\", \"code\" : \"2\", \"msg\" : \"该邮箱已经被注册过了，请直接登录\"}");
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("{ \"status\" : \"Other\", \"code\" : \"3\", \"msg\" : \"系统连接数据库失败\"}");
            }
            return false ;
        }
        public int insertDB(FC.cjstudio.User user)
        {
            if (checkInsert(user))
            {
                string connStr = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
                SqlConnection conn = new SqlConnection();
                try
                {
                    // 添加到tb_user表中
                    conn = new SqlConnection(connStr);
                    conn.Open();
                    string sql = "insert into tb_user(name_c,passwd_c,email_c,type_i) " +
                        " values('"+user.name+"','"+EncryptSHA256(user.password32).ToLower()+"','"+user.email+"',"+user.type+")";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    int isok=cmd.ExecuteNonQuery();
                    //if (isok != 1)
                    //{
                    //    return -1 ; 
                    //}

                    // 获取刚刚添加user的id
                    sql = "select id_i from tb_user where email_c = '"+user.email+"'";
                    cmd.CommandText=sql;
                    SqlDataAdapter adr = new SqlDataAdapter(cmd);
                    DataSet dataset = new DataSet();
                    DataTable rs = new DataTable();
                    adr.Fill(dataset);
                    rs = dataset.Tables[0];
                    //if(rs.Rows.Count !=1)
                    //{
                    //    return -2;
                    //}
                    user.id = rs.Rows[0][0].ToString();
                    if (user.id == null || user.id == "")
                    {
                        return -3;
                    }

                    // 根据用户类型，分别添加到不同表中
                    if (user.type == 4)
                    {
                        sql = "insert into tb_elderly(id_i) values(" + user.id + ")";
                    }
                    else if (user.type == 1)
                    {
                        sql = "insert into tb_journal(id_i) values(" + user.id + ")";
                    }
                    else
                    {
                        return 0;
                    }
                    cmd.CommandText = sql;
                    isok = cmd.ExecuteNonQuery();
                    //if (isok != 1)
                    //{
                    //    return -4;
                    //}
                    return int.Parse(user.id);
                }
                catch (Exception)
                {
                    return -5;
                }
            }
            return 0;
        }
        public bool isLawfulInput(string str)
        {
            string[] unlawfulChars = { "'", "\"", "<", ">", "-", " " };
            foreach (string s in unlawfulChars)
            {
                if (str.IndexOf(s) >= 0)
                    return false;
            }
            return true;
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
    }
}
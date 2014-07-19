using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace FC.Account
{
    public partial class BasicInformation : System.Web.UI.Page
    {
        public bool isIdenUser = false,isDataOver = false;
        public FC.cjstudio.User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            if (isIdenUser)
            {
                getDataFromDB();
            }
        }
        public int getDataFromDB()
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
                String sql = "select * from tb_user where id_i = "+user.id;
                cmd = new SqlCommand(sql, conn);
                adr = new SqlDataAdapter(cmd);
                adr.Fill(dataset);
                rs = dataset.Tables[0];
                if (rs.Rows.Count == 1)
                {
                    user.name = rs.Rows[0]["name_c"].ToString();
                    user.idCard = rs.Rows[0]["idCard_c"].ToString();
                    user.livingAddress = rs.Rows[0]["livingPlace_c"].ToString();
                    user.livingAddressId = rs.Rows[0]["livingAddress_i"].ToString();
                    user.picPath = rs.Rows[0]["picPath_c"].ToString();
                    user.politicalStatus = rs.Rows[0]["politicalStatus_c"].ToString();
                    user.qq = rs.Rows[0]["qq_c"].ToString();
                    user.sex = rs.Rows[0]["sex_c"].ToString();
                    user.birthday = rs.Rows[0]["birthday_d"].ToString();
                    user.description = rs.Rows[0]["dercription_c"].ToString();
                    user.homeAddress = rs.Rows[0]["homeAddress_c"].ToString();
                    user.homeAddressId = rs.Rows[0]["homeAddress_i"].ToString(); 
                    user.phone = rs.Rows[0]["phone_c"].ToString();
                    
                    isDataOver = true;
                }
            }
            catch (Exception)
            {
                return -1;
            }
            return 0;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.Files["file"].ContentLength > 0)
                {
                    Label1.Text = Request.Form["username"];
                    string filetail = Path.GetFileName(Request.Files["file"].FileName).Split('.')[1]; 
                    Request.Files["file"].SaveAs(Server.MapPath("~/Account/userPic/") + user.id + "."+filetail);
                    Label1.Text += "上传成功！";
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public void initPage()
        {
            try
            {
                user.id = Session["uid"].ToString();
                user.password32 = Session["upasswd"].ToString();
                user.name = Session["uname"].ToString();
                user.type = int.Parse(Session["utype"].ToString());
                isIdenUser = true;
            }
            catch (Exception)
            {
                isIdenUser = false;
            }
        }
    }
}
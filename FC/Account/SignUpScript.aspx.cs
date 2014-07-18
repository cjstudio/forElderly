using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Account
{
    public partial class SignUpScript : System.Web.UI.Page
    {
        struct User {
            public string id,name,password32,email;
            public int type;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            User u_input = new User();
            try
            {
                u_input.name  = HttpContext.Current.Request["username"].ToString();
                passwd = HttpContext.Current.Request["password"];
                member = HttpContext.Current.Request["member"];
                if (!isLawfulInput(username) || !isLawfulInput(passwd))
                {
                    Response.Write("{ \"status\" : \"Error\", \"msg\" : \"用户名或密码中存在敏感字符\"}");
                    Response.End();
                }
                if (username == "" || passwd == "")
                {
                    Response.Write("{ \"status\" : \"Error\", \"msg\" : \"用户名或密码不能为空\"}");
                    Response.End();
                }
                Response.Clear();
            }
            catch (Exception)
            {
                Response.Write("{ \"status\" : \"Other\", \"msg\" : \"Json 数据传输错误\"}");
                Response.End();
                return;
            }
            if (identificaUser())
            {
                ;
            }
            Response.End();
        }
    }
}
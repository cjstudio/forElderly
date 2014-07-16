using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Account
{
    public partial class Login : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
       {
            string username = "", passwd = "", data = "", member = "";
            if (!String.IsNullOrEmpty(HttpContext.Current.Request["username"]))
            {
                username= HttpContext.Current.Request["username"].ToString();
            } 
            if (!String.IsNullOrEmpty(HttpContext.Current.Request["password"]))
            {
                passwd= HttpContext.Current.Request["password"];
            } 
            if (!String.IsNullOrEmpty(HttpContext.Current.Request["member"]))
            {
                member= HttpContext.Current.Request["member"];
            }
            //清空缓冲区
                Response.Clear();
            //将字符串写入响应输出流
            if (passwd == "fuck")
            {
                Response.Write("{\"status\":\"Error\"}");
            }
            else if (passwd == "hello")
            {
                Response.Write("{\"status\":\"Success\"}");
            }
            else
            {
                Response.Write("{\"status\":\"Other\"}");
            }
            //将当前所有缓冲的输出发送的客户端，并停止该页执行
            Response.End();
        }
    }
}

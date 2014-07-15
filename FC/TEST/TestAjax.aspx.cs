using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.TEST
{
    public partial class TestAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string param = "";
            string username = "", passwd = "", data = "", member = "";

            //获取参数
            //if (!String.IsNullOrEmpty(HttpContext.Current.Request["param"]))
            {
                if (!String.IsNullOrEmpty(HttpContext.Current.Request["param"]))
                {
                    param += HttpContext.Current.Request["param"].ToString();
                }
                if (!String.IsNullOrEmpty(HttpContext.Current.Request["data"]))
                {
                    param += HttpContext.Current.Request["data"].ToString();
                    data = HttpContext.Current.Request["data"].ToString();
                } 
                if (!String.IsNullOrEmpty(HttpContext.Current.Request["username"]))
                {
                    param += HttpContext.Current.Request["username"].ToString();
                    username= HttpContext.Current.Request["username"].ToString();
                } 
                if (!String.IsNullOrEmpty(HttpContext.Current.Request["password"]))
                {
                    param += HttpContext.Current.Request["password"];
                    passwd= HttpContext.Current.Request["password"];
                } 
                if (!String.IsNullOrEmpty(HttpContext.Current.Request["member"]))
                {
                    param += HttpContext.Current.Request["member"];
                    member= HttpContext.Current.Request["member"];
                }
                param += DateTime.Now.TimeOfDay.ToString();
            }
            
            //清空缓冲区
            Response.Clear();
            //将字符串写入响应输出流
            Response.Write("Http请求的方式为："+Request.HttpMethod.ToUpper()+
                "<br> data为:"+data+
                "<br> username为:"+username);
            //将当前所有缓冲的输出发送的客户端，并停止该页执行
            Response.End();
        }
    }
}
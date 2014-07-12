using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.TEST
{
    public partial class JqueryAjaxLoad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string param = "";

            //获取参数
            if (!String.IsNullOrEmpty(HttpContext.Current.Request["param"]))
            {
                param = HttpContext.Current.Request["param"];
            }

            //清空缓冲区
            Response.Clear();
            //将字符串写入响应输出流
            Response.Write("Http请求的方式为：" + Request.HttpMethod.ToUpper() + "; 传递过来的参数为:" + param);
            //将当前所有缓冲的输出发送的客户端，并停止该页执行
            Response.End();

        }
    }
}
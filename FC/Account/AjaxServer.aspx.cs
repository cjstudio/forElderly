using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Account
{
    public partial class AjaxServer : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public string code;

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            switch(code){
                case "":checkError("Json 数据类型获取失败");
                    break;
                case "user_home_page_path":
                    if (isIdenUser && user.type != null) { checkSuccess(FC.cjstudio.getTypePath(user.type)); }
                    break;
                default:
                    checkError("没有处理相关数据的方法");
                    break;
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

            try
            {
                code = HttpContext.Current.Request["code"].ToString();
            }
            catch (Exception)
            {
                code = "";
            }
        }

        public void checkError(string msg)
        {
            Response.Write("{\"status\":\"error\",\"msg\":\""+msg+"\"}");
            Response.End();
        }
        public void checkSuccess(string msg)
        {
            Response.Write("{\"status\":\"success\",\"msg\":\"" + msg + "\"}");
            Response.End();
        }

    }
}
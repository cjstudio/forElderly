using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Admin
{
    public partial class ContentConfig1 : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public int page,PAGESIZE=10;
        public List<FC.cjstudio.Article> articles;

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();

            if (isIdenUser)
            {
                try
                {
                    page = int.Parse(Request.QueryString["page"].ToString());
                }
                catch (Exception)
                {
                    page = 1;
                }
                articles = FC.cjstudio.getArticleByTypeId(0);
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
                string member = Session["member"].ToString();
                Session["uname"] = user.name;
                Session["utype"] = user.type;
                Session["uid"] = user.id;
                Session["upasswd"] = user.password32;
                Session["member"] = member;
            }
            catch (Exception)
            {
                isIdenUser = false;
            }
        }
    }
}
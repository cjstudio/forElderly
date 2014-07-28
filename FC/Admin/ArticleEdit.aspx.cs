using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Admin
{
    public partial class ArticleEdit : System.Web.UI.Page
    {
        public bool isIdenUser = false, articleLoad = false;
        public FC.cjstudio.User user;
        public FC.cjstudio.Article article;
        public Dictionary<int, string> superContentType =
            new System.Collections.Generic.Dictionary<int, string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            superContentType = FC.cjstudio.getContentType(0); 
            try
            {
                article.id = Request.QueryString["article"].ToString();
                article = cjstudio.getArticleById(article.id);
                articleLoad = true;
            }
            catch (Exception)
            {
                articleLoad = false;
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
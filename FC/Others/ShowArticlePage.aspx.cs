using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Others
{
    public partial class ShowArticlePage : System.Web.UI.Page
    {
        public FC.cjstudio.Article article,nextArticle,previousArticle;
        public string nextId, previousId;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["article"].ToString();
                article = cjstudio.getArticleById(id);
            }
            catch (Exception)
            {
                
            }
            try
            {
                nextId = Request.QueryString["next"].ToString();
                nextArticle = cjstudio.getArticleById(nextId);
            }
            catch (Exception)
            {
                nextId = "";
            }
            try
            {
                previousId = Request.QueryString["previous"].ToString();
                previousArticle = cjstudio.getArticleById(previousId);
            }
            catch (Exception)
            {
                previousId = "";
            }
        }
    }
}
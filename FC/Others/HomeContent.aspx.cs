using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Others
{
    public partial class HomeContent : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public List<FC.cjstudio.Article> articleAboutParent, articleAnnouncement, articleJournal, articleCommunity;
        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            try
            {                
                articleAboutParent = cjstudio.getArticleByTypeName("爸妈频道");
            }
            catch (Exception)
            {
                ;
            } 
            try
            {
                articleAnnouncement = cjstudio.getArticleByTypeName("站内公告");
            }
            catch (Exception)
            {
                ;
            }
            try
            {
                articleJournal = cjstudio.getArticleByTypeName("志愿者脚步");
            }
            catch (Exception)
            {
                ;
            }
            try
            {
                articleCommunity = cjstudio.getArticleByTypeName("社区管理");
            }
            catch (Exception)
            {
                ;
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace FC.Admin
{
    public partial class ContentConfig : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public Dictionary<int, string> superContentType =
            new System.Collections.Generic.Dictionary<int, string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            superContentType = FC.cjstudio.getContentType(0);
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
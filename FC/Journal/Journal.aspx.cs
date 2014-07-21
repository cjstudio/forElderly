using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC
{
    public partial class Journal : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
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
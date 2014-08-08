using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Community
{
    public partial class EditElderly : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public List<cjstudio.Elderly> elderlys = new List<cjstudio.Elderly>();

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            cjstudio.Community community = cjstudio.getCommunityByAdmin(user.id);
            elderlys = cjstudio.getElderlysByCommunityId(community.id);
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
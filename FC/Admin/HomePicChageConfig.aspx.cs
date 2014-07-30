using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.Admin
{
    public partial class HomePicChageConfig : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public string pic1Path, pic2Path, pic3Path;

        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();

            if (isIdenUser)
            {
                pic1Path = cjstudio.getConfigValue("HomeMainRollPic1_Pic_tmp");
                pic2Path = cjstudio.getConfigValue("HomeMainRollPic2_Pic_tmp");
                pic3Path = cjstudio.getConfigValue("HomeMainRollPic3_Pic_tmp");
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
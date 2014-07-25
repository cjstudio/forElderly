using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FC.TEST
{
    public partial class TestBigJson : System.Web.UI.Page
    {
        public string s;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cjstudio.setConfitKeyValue("test", "Update");
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");

                s = config.AppSettings.Settings["test"].Value;
                //config.Save();
                //return true;
            }
            catch (Exception)
            {
                //return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string tmp = TEST.Value;
            TextBox1.Text = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(tmp));
        }
    }
}
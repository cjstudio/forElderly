using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FC.TEST
{
    public partial class TestBigJson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string tmp = TEST.Value;
            TextBox1.Text = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(tmp));
        }
    }
}
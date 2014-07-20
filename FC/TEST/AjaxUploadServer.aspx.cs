using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace FC.TEST
{
    public partial class AjaxUploadServer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Files.Count >0)
            {
                Request.Files[0].SaveAs("G:\\code\\ASP.Net\\FC\\FC\\TEST\\img\\tttest.jpg");
                string s = (HttpContext.Current.Request["code"]);
                Response.Write("{error :\"\", msg:\"Hero\",}");
                
                Response.End();
            }
            else
            {
                Response.Write("{\"error\":\"=========\", \"filetype\":\"Error\"}");
            } 
        }

    }
}
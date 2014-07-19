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
            Response.Write(HttpContext.Current.Request["test"]);
            if (Request.Files.Count >0)
            {
                
                Response.Write("{\"filetype\":\"" + Request.Files[0].ContentType + "\"}");
            }
            else
            {
                Response.Write("{\"filetype\":\"Error\"}");
            } 
        }

    }
}
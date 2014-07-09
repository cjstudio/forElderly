<%@ Page Language="C#"  Debug="true" trace="false" validateRequest="false" EnableViewStateMac="false" EnableViewState="true"%>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    string oradb = ConfigurationManager.ConnectionStrings["fc_db"].ConnectionString;
    string output  = "?";
    string str;
    SqlConnection conn =new SqlConnection();
    SqlCommand cmd  = new SqlCommand();
    SqlDataAdapter adr =new SqlDataAdapter() ;
    
    int userdays,Page,Pagesize=5;
    string finishtype = "";
    DataSet dataset = new  DataSet();
    DataTable rs =new DataTable();
    
    if (Request.QueryString.Count != 0)
    {
        string stmp = Request.QueryString[0].ToString();
        Page = Int32.Parse(stmp);
    }
    else
    {
        Page = 1;
    }
    
    if(Page ==0)Page = 1;
    try 
	{
        conn = new SqlConnection(oradb);
        conn.Open();
        String sql = "select * from tb_test";
        cmd = new SqlCommand(sql, conn);
        adr = new SqlDataAdapter(cmd);
        adr.Fill(dataset);
        rs = dataset.Tables[0];
        if (rs.Rows.Count < 1)
        {
            this.Response.Write("<div align='center'>");
            this.Response.Write("<table border='0' cellpadding='0' cellspacing='0' width='90%' height='1' ><tr><td height='100'>");
            this.Response.Write("<div align='center'>没有数据可显示!</div>");
            this.Response.Write("</td></tr></table>");
            this.Response.Write("</div>");
        }
        else
        {
            this.Response.Write(" It's cool !!!") ; 
        }
	}
	catch (Exception ex)
    {
        this.Response.Write("<div align='center'>");
        this.Response.Write("<table border='0' cellpadding='0' cellspacing='0' width='90%' height='1' ><tr><td height='100'>");
        this.Response.Write("<div align='center'>连接数据库异常!</div>"); 
        this.Response.Write("<div align='center'>"+oradb +"<br>"+ex.Message+"!</div>");
        this.Response.Write("</td></tr></table>");
        this.Response.Write("</div>");
	}
       
        %>
    </td>
  </tr>
</table>
<%
    adr.Dispose();
    dataset.Dispose();
    rs.Dispose();
    cmd.Dispose();
    conn.Close();
    //return  ;
    %>
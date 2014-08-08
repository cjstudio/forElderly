using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FC.Community
{
    public partial class AddElderly : System.Web.UI.Page
    {
        public bool isIdenUser = false;
        public FC.cjstudio.User user;
        public bool fileUploadState = false;
        public string statusStr,filePath;
        public cjstudio.Community community;
        protected void Page_Load(object sender, EventArgs e)
        {
            initPage();
            if (isIdenUser)
            {
                community = cjstudio.getCommunityByAdmin(user.id);
                string xlsPath = Server.MapPath("~/Community/xlsTmp/");
                filePath = xlsPath + user.id + ".xls";
                if (Request.Files.Count == 0)
                {
                    return;
                }
                if (Request.Files[0].FileName.IndexOf(".xls") > 0)
                {
                    Response.Write("文件上传成功<br/>");
                    Request.Files[0].SaveAs(filePath);
                    string strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties='Excel 8.0;IMEX=1'";
                    try
                    {
                        System.Data.OleDb.OleDbConnection Conn = new System.Data.OleDb.OleDbConnection(strCon);
                        string strCom = "SELECT * FROM [Sheet1$]";
                        Conn.Open();
                        System.Data.OleDb.OleDbDataAdapter myCommand = new System.Data.OleDb.OleDbDataAdapter(strCom, Conn);
                        DataSet ds = new DataSet();
                        myCommand.Fill(ds, "[Sheet1$]");
                        Conn.Close();
                        DataTable rs = ds.Tables[0];
                        if (rs.Rows.Count > 0)
                        {
                            for (int i = 0; i < rs.Rows.Count; i++)
                            {
                                cjstudio.Elderly elderly = new cjstudio.Elderly();
                                elderly.name = rs.Rows[i]["姓名"].ToString();
                                elderly.sex = rs.Rows[i]["性别"].ToString();
                                elderly.birthday = rs.Rows[i]["生日"].ToString();
                                elderly.idCard = rs.Rows[i]["身份证号"].ToString();
                                elderly.livingAddress = rs.Rows[i]["住址"].ToString();
                                elderly.healthyType = rs.Rows[i]["健康状况"].ToString();
                                elderly.phoneNum = rs.Rows[i]["联系电话"].ToString();
                                elderly.guardianName = rs.Rows[i]["监护人姓名"].ToString();
                                elderly.guardianPhone = rs.Rows[i]["监护人电话"].ToString();
                                elderly.description = rs.Rows[i]["备注"].ToString();
                                elderly.community = cjstudio.getCommunityByAdmin(user.id).id;
                                string strtmp = cjstudio.addElderly(elderly);
                                Response.Write(strtmp + "<br/>");
                            }
                        }
                    }
                    catch (Exception)
                    {
                        Response.Write("文件内容错误");
                    }
                }
                else {

                    Response.Write("文件类型错误");
                }
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
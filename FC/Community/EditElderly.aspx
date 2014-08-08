<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditElderly.aspx.cs" Inherits="FC.Community.EditElderly" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta charset="utf-8"/>
  <title><%=FC.cjstudio.getConfigValue("MainTitle")%></title>
  <meta name="author" content="CJ_Studio"/>

  <!-- Le styles -->
  <link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

  <link href="../JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
</head>
<body >
    <div class="container-fluid">
    <% 
        if (isIdenUser && (user.type&2)!=0 )
        {
            %>

        <div class="row-fluid">
	        <div class="span12">
                <h2>
                    编辑社区老人
                </h2>
	        </div>
        </div>
        <div style=" overflow:auto; border-width:2px; border-style:outset;" >

            <table class="table table-bordered table-hover">
	            <thead>
		            <tr>
			            <th style="width:60px;"  nowrap="nowrap">账号</th>
			            <th style="width:60px;"  nowrap="nowrap">姓名</th>
			            <th style="width:30px;"  nowrap="nowrap">性别</th>
			            <th style="width:90px;"  nowrap="nowrap">生日</th>
			            <th style="width:160px;"  nowrap="nowrap">身份证号</th>
			            <th style="width:105px;"  nowrap="nowrap">联系电话</th>
			            <th style="width:200px;"  nowrap="nowrap">住址</th>
			            <th style="width:80px;"  nowrap="nowrap">健康状况</th>
			            <th style="width:60px;"  nowrap="nowrap">监护人姓名</th>
			            <th style="width:105px;"  nowrap="nowrap">监护人电话</th>
			            <th style="width:200px;" nowrap="nowrap">备注</th>
                        <th style="width:90px;" nowrap="nowrap">操作</th>
		            </tr>
	            </thead>
	            <tbody>
                <%
                    for (int i = 0; i < elderlys.Count;i++ )
                    {
                        FC.cjstudio.Elderly tmp = elderlys[i];
                        if (i % 2 == 0)
                        {
                            Response.Write("<tr class=\"info\">");
                        }
                        else { Response.Write("<tr>"); }

                        Response.Write("<td>" + tmp.id + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.name + "</td>");
                        Response.Write("<td>" + tmp.sex + "</td>");
                        try
                        {
                            DateTime dt = DateTime.Parse(tmp.birthday);
                        Response.Write("<td>" + dt.ToShortDateString() + "</td>");
                        }
                        catch (Exception)
                        {
                            
                            throw;
                        }
                        Response.Write("<td>" + tmp.idCard + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.phoneNum + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.livingAddress + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.healthyType + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.guardianName + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.guardianPhone + "</td>");
                        Response.Write("<td contenteditable=\"true\">" + tmp.description + "</td>");
                        Response.Write("<td><a href=\"\">编辑</a>，<a href=\"\">删除</a></td>");
                        
                        Response.Write("</tr>");
                    }
             %>
	            </tbody>
            </table>

        </div>
        <% 
        }
        else if(isIdenUser)
        { %>
		<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">×</button>
			<h4>
				提示!
			</h4> <strong>警告!</strong> 您的账号没有查看此页的权限.
		</div>
        <% } else { %>
		<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">×</button>
			<h4>
				提示!
			</h4> <strong>警告!</strong> 访问此页请先登录或者刷新页面.
		</div>
        <% } %>
	</div>

    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/md5.js" type="text/javascript"></script>
    <script src="../Scripts/cjstudio.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>

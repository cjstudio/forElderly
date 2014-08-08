<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddElderly.aspx.cs" Inherits="FC.Community.AddElderly" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<body>
    <div class="container-fluid">
    <% 
        //if (isIdenUser && (user.type&2)!=0 )
        if (true)
        {
            %>

        <div class="row-fluid">
	        <div class="span12">
                <h2>
                    添加社区老人
                </h2>
	        </div>
        </div>
        <%
            if (!fileUploadState)
            {
                %>
        <div>
            <h4><p><a href="XlsModel/model.xls">下载.xls格式模板</a></p>
            <a href="XlsModel/excemple.xls">下载上传文件示例</a></h4>
            <div class="span12" id="commit_status" >
			</div>
            <form id="form" name="form" method="post" action="#" runat="server">
                <label>选择要上传的.xls文件</label>
                <input id="fileToUpload" type="file" runat="server" name="file_uploder"/><br />
                <input name="submit" type="submit" value="上传" />
            </form>
        </div>
        <% 
            }
            else
            {
                Response.Write(statusStr); 
            }
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
    <script type = "text/javascript">
        function commit_upload() {
            if (document.getElementById("fileToUpload").value == "") {
                document.getElementById("commit_status").innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> 清先选择上传文件.' +
								 '</div>';
            }

            var fileType = /\.[^\.]+/.exec(document.getElementById("fileToUpload").value);
            if (fileType != '.xls' && fileType != '.XLS') {
                document.getElementById("commit_status").innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> 选择上传的文件类型不安全.' +
								 '</div>';
            }
            else {
                document.getElementById("commit_status").innerHTML = '<img id="loading" src="../JqueryUi/img/loading2.gif" style="display:none;width:100px;"/>';

                ajaxFileUpload();
            }
        }

        function ajaxFileUpload() {
            var oodiv = document.getElementById("fileToUpload");
            //alert(oodiv.value);
            //starting setting some animation when the ajax starts and completes
            
            $.ajaxFileUpload
(
	{
	    url: "../Account/AjaxServer.aspx",
	    secureuri: false,
	    fileElementId: 'fileToUpload',
	    dataType: 'json',
	    data: { code: "just_user_pic" },
	    success: function (data, status) {
	        if (typeof (data.error) != 'undefined') {
	            if (data.error != '') {
	                alert(data.error);
	            } else {
	                document.getElementById("user_pic").src = 'userPic/' + data.msg;
	                //location.replace(location.href);
	            }
	        }
	    },
	    error: function (data, status, e) {
	        alert(e);
	    }
	}
)
            return false;
        }  
    </script>
</body>
</html>

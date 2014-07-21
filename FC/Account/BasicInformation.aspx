<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicInformation.aspx.cs" Inherits="FC.Account.BasicInformation" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
      <meta charset="utf-8"/>
      <title><%=FC.cjstudio.getValue("MainTitle")%></title>
      <meta name="author" content="CJ_Studio"/>

      <!-- Le styles -->
      <link type="text/css" href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
</head>

<body algin="center">
<script type="text/javascript">
    var is_changed = false;
</script>
    <div class="container-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
                    <%if (!isIdenUser)
                      { %>
						<div class="span12">
							<div class="alert alert-error">
								 <button type="button" class="close" data-dismiss="alert">×</button>
								<h4>
									提示!
								</h4> <strong>警告!</strong> 访问此页面需要先登录.
							</div>
						</div>
                        <%} %>
					</div>
                    <%if (isIdenUser && isDataOver)
                      { %>
					<div class="row-fluid">
                            <button class="btn"  OnClick="commit_save();return false;">保存</button>
                            
                            <form enctype="multipart/form-data">
                            <div class="span12" id="commit_status" >
		                        <img id="loading" src="../JqueryUi/img/loading2.gif" style="display:none;"/>
						    </div>

						    <div align="left" style="padding-left:30px;font-color:red;" >
			                    <img id="user_pic" alt="280x280" width="280" height="280" src="userPic/<%=user.picPath %>" class="img-rounded" />
                                <input type="file" class="btn" name="fileToUpload" id="fileToUpload"/>
                                <a class="btn"  OnClick="commit_upload();return false;">上传</a>
                                <p ><label>用户姓名：</label><input type="text" ID="username" type="text" value="<%=user.name %>"/></p>
                                <p ><label>性别：</label>
                                    <select id="user_sex" >
                                    <%if(user.sex == "女"){ %>
                                        <option value ="女">女</option>
                                        <option value ="男">男</option>
                                    <%}else{ %>
                                        <option value ="男">男</option>
                                        <option value ="女">女</option>
                                    <%} %>
                                    </select>
                                </p>
                                <p ><label>姓名：</label><input type="text" ID="TextBox2" type="text" value="Hero" /></p>
                                <p ><label>姓名：</label><input type="text"  ID="TextBox3" type="text" value="Hero" /></p>
                                <p ><label>姓名：</label><input type="text"  ID="TextBox4" type="text" value="Hero"/></p>
                            </div>
                        </form>

					</div>
                    <%} %>
				</div>
			</div>
		</div>
	</div>




    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>  
    <script src="../Scripts/md5.js" type="text/javascript"></script>  
    <script src="../Scripts/Login.js" type = "text/javascript"></script>
    <script src="../Scripts/ajaxfileupload.js" type = "text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>

    <script type="text/javascript">

function commit_upload() {
    if (document.getElementById("fileToUpload").value == "") {
        document.getElementById("commit_status").innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> 清先选择上传文件.' +
								 '</div>';
    }
    else if (!checkUploderFileType(document.getElementById("fileToUpload").value)) {
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
function checkUploderFileType(fileName) {
    var fileType = /\.[^\.]+/.exec(fileName);
    var allowType = new Array();
    allowType[0] = '.jpg';
    allowType[1] = '.gif';
    allowType[2] = '.png';
    allowType[3] = '.bmp';
    allowType[4] = '.ico';
    for (var i = 0; i < allowType.length; i++) {
        if (fileType == allowType[i]) return true;
    }
    return false;
}
function commit_save() {
    alert("");
}
function ajaxFileUpload() {
    var oodiv = document.getElementById("fileToUpload");
    //alert(oodiv.value);
    //starting setting some animation when the ajax starts and completes
    $("#loading")
.ajaxStart(function () {
    $(this).show();
})
.ajaxComplete(function () {
    $(this).hide();
});
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
	                document.getElementById("user_pic").src = 'userPic/'+data.msg;
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

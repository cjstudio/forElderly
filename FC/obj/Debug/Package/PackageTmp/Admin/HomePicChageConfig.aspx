<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePicChageConfig.aspx.cs" Inherits="FC.Admin.HomePicChageConfig" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title><%=FC.cjstudio.getConfigValue("MainTitle")%></title>
<meta name="author" content="CJ_Studio"/>

<!-- Le styles -->
<link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
<link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
    rel="stylesheet" />
<link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

<link href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
<link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
</head>

<body  style="padding-top:0px;min-height:800px;min-width:800px;">
    <div class="container" id="page_main_content" style=" margin-left:0px;">

        <div class="container-fluid">
            <% if (isIdenUser && (user.type&8)!=0 )
                //if(true)
               { %>
	        <div class="row-fluid">
		        <label><h2>首页滚图管理</h2></label>
	        </div>
            
			<div class="row-fluid">
                    <button class="btn"  onclick="commit_save();return false;">保存</button>
                            
                    <form enctype="multipart/form-data">
                    <div class="span12" id="commit_status" >
		                <img id="loading" src="../JqueryUi/img/loading2.gif" style="display:none;"/>
					</div>

					<div align="left" style="padding-left:30px;font-color:red;" >
			            <img id="user_pic" alt="280x280" style="height:280px;" height="280" src="userPic/<%=user.picPath %>" class="img-rounded" />
                        <input type="file" class="btn" name="fileToUpload" id="roll_pic1_pic"/>
                        <a class="btn"  OnClick="commit_upload();return false;">上传</a>
                    </div>
                    <h4>标题&nbsp;&nbsp;<input class="form-control" type="text" id="roll_pic1_title" placeholder="标题限16个字符以内"/></h4>
                    <h4>内容&nbsp;&nbsp;<input class="form-control" type="text" id="roll_pic1_content" placeholder="内容限128个字符以内"/></h4>
                    </form>
                </div>
            <% }
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
								</h4> <strong>警告!</strong> 访问此页需要先登录,请登录后或者刷新后重试.
							</div>
                        <% } %>
		</div>
    </div>

  <!-- Placed at the end of the document so the pages load faster
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> 
  -->

    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Scripts/md5.js"></script>
    <script type="text/javascript" src="../Scripts/cjstudio.js"></script>
    <script type="text/javascript" src="../Scripts/ajaxfileupload.js"></script>
    <script type="text/javascript">
        function commit_upload() {
            if (document.getElementById("roll_pic1_pic").value == "") {
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

        function ajaxFileUpload() {
            var oodiv = document.getElementById("roll_pic1_pic");
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
	    fileElementId: 'roll_pic1_pic',
	    dataType: 'json',
	    data: { code: "roll_pic1_pic" },
	    success: function (data, status) {
	        if (typeof (data.status) != 'undefined') {
	            if (data.status != '') {
	                alert(data.msg);
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

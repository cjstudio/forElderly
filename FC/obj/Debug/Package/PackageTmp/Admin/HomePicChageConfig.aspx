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

<body  style="padding-top:0px; height:3000px;min-width:600px;">
    <div class="container" id="page_main_content" style=" margin-left:0px;">

        <div class="container-fluid">
            <% if (isIdenUser && (user.type&8)!=0 )
                //if(true)
               { %>
            
			<div class="row-fluid">
                    <button class="btn"  onclick="commit_save();return false;">保存</button>
                            
                    <form enctype="multipart/form-data">

                    <div class="span12" id="commit_status" >
		                <img id="loading1" src="../Others/tmp/HomeRollPic/" style="display:none;"/>
					</div>

					<div align="left" style="padding-left:30px;font-color:red;" >
			            <%--<img id="roll1_img" alt="280x280" style="height:280px;" height="280" src="../Others/tmp/HomeRollPic//<%=pic1Path %>" class="img-rounded" />--%>
                        <h4>No.1</h4><input type="file" class="btn" name="fileToUpload" id="roll_pic1_pic"/>
                        <a class="btn"  onclick="commit_upload(1);return false;">上传</a>
                    </div>
                    <h4>标题&nbsp;&nbsp;<input class="form-control" type="text" id="roll_pic1_title" placeholder="标题限16个字符以内"
                        value = "<%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Title") %>"/></h4>
                    <h4>内容</h4>
                    <textarea id="roll_pic1_content" class="form-control" rows="3" style="width:600px;">
                    <%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Content") %>
                    </textarea>
                    <br />
                    
					<div align="left" style="padding-left:30px;font-color:red;" >
			            <%--<img id="roll2_img" alt="280x280" style="height:280px;" height="280" src="userPic/<%=pic2Path %>" class="img-rounded" />--%>
                        <h4>No.2</h4><input type="file" class="btn" name="fileToUpload" id="roll_pic2_pic"/>
                        <a class="btn"  onclick="commit_upload(2);return false;">上传</a>
                    </div>
                    <h4>标题&nbsp;&nbsp;<input class="form-control" type="text" id="roll_pic2_title" placeholder="标题限16个字符以内" 
                    value = "<%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Title") %>"/></h4>
                    <h4>内容</h4>
                    <textarea id="roll_pic2_content" class="form-control" rows="3" style="width:600px;">
                    <%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Content") %>
                    </textarea>
                    <br />
                    
					<div align="left" style="padding-left:30px;font-color:red;" >
			            <%--<img id="roll3_img" alt="280x280" style="height:280px;" height="280" src="userPic/<%=pic3Path %>" class="img-rounded" />--%>
                        <h4>No.3</h4><input type="file" class="btn" name="fileToUpload" id="roll_pic3_pic"/>
                        <a class="btn"  onclick="commit_upload(3);return false;">上传</a>
                    </div>
                    <h4>标题&nbsp;&nbsp;<input class="form-control" type="text" id="roll_pic3_title" placeholder="标题限16个字符以内"
                    value = "<%=FC.cjstudio.getConfigValue("HomeMainRollPic3_Title") %>"/></h4>
                    <h4>内容</h4>
                    <textarea id="roll_pic3_content" class="form-control" rows="3" style="width:600px;">
                    <%=FC.cjstudio.getConfigValue("HomeMainRollPic3_Content") %>
                    </textarea>

                    <br />
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
        function commit_save() {
            var title1 = document.getElementById("roll_pic1_title").value;
            var content1 = document.getElementById("roll_pic1_content").value;
            var title2 = document.getElementById("roll_pic2_title").value;
            var content2 = document.getElementById("roll_pic2_content").value;
            var title3 = document.getElementById("roll_pic3_title").value;
            var content3 = document.getElementById("roll_pic3_content").value;

            htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
                async: false,
                data: { "code": "chage_home_roll_pic",
                    "title1": title1,
                    "content1":content1,
                    "title2": title2,
                    "content2":content2,
                    "title3": title3,
                    "content3":content3
                }
            });
            var dataRes = $.parseJSON(htmlobj.responseText); 
            if (dataRes.status == 'success') {
                showSuccessMsg("commit_status", dataRes.msg);
            } else {
                showErrorMsg("commit_status", dataRes.msg);
            };
        }
        function commit_upload(picIdNum) {
            if (document.getElementById("roll_pic" + picIdNum + "_pic").value == "") {
                document.getElementById("commit_status").innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> 清先选择上传文件.' +
								 '</div>';
            }
            else if (!checkUploderFileType(document.getElementById("roll_pic" + picIdNum + "_pic").value)) {
                document.getElementById("commit_status").innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> 选择上传的文件类型不安全.' +
								 '</div>';
            }
            else {
                document.getElementById("commit_status").innerHTML = '<img id="loading" src="../JqueryUi/img/loading2.gif" style="display:none;width:100px;"/>';
                //alert("准备完成");
                ajaxFileUpload(picIdNum);
            }
        }

        function ajaxFileUpload(picIdNum) {
            var oodiv = document.getElementById("roll_pic" + picIdNum + "_pic");
            //alert(oodiv.value);
            
$.ajaxFileUpload
(
	{
	    url: "../Account/AjaxServer.aspx",
	    secureuri: false,
	    async: false,
	    fileElementId: "roll_pic" + picIdNum + "_pic",
	    dataType: 'json',
	    data: { code: "home_roll_pic_file", picNum: picIdNum },
	    success: function (data, status) {
	        if (typeof (data.status) != 'undefined') {
	            if (data.status != '') {
	                alert(data.msg);
	            } else {
	                alert(data.msg);
	                document.getElementById("roll" + picIdNum + "_img").src = '../Others/tmp/HomeRollPic/' + data.msg;
	                //location.replace(location.href);
	            }
	        }
	    },
	    error: function (data, status, e) {
	        alert(e); document.getElementById("roll" + picIdNum + "_img").src = '../Others/tmp/HomeRollPic/' + data.msg;
	    }
	}
)
            return false;
        }  


    </script>

</body>
</html>

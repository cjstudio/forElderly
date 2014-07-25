<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicInformation.aspx.cs" Inherits="FC.Account.BasicInformation" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
      <meta charset="utf-8"/>
      <title><%=FC.cjstudio.getConfigValue("MainTitle")%></title>
      <meta name="author" content="CJ_Studio"/>

      <!-- Le styles -->
      <link type="text/css" href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
</head>

<body algin="center"  style="width:600px; height:1000px;">
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
                            <button class="btn"  onclick="commit_save();return false;">保存</button>
                            
                            <form enctype="multipart/form-data">
                            <div class="span12" id="commit_status" >
		                        <img id="loading" src="../JqueryUi/img/loading2.gif" style="display:none;"/>
						    </div>

						    <div align="left" style="padding-left:30px;font-color:red;" >
			                    <img id="user_pic" alt="280x280" style="height:280px;" height="280" src="userPic/<%=user.picPath %>" class="img-rounded" />
                                <input type="file" class="btn" name="fileToUpload" id="fileToUpload"/>
                                <a class="btn"  OnClick="commit_upload();return false;">上传</a>
                                <p ><label>用户姓名：</label><input type="text" id="username" type="text" value="<%=user.name %>"/></p>
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
                                <label>出生日期：</label> 

                                    <table border="0">
                                      <tr>
                                        <td>
                                            <select id="birth_year" size="1" style="width:auto">
                                            <%
                                                for (int i = DateTime.Now.Year; i >= DateTime.Now.Year - 150; i--)
                                                {
                                                    if (i == user.birDT.Year)
                                                    {
                                                        Response.Write("<option selected=\"selected\" value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                    else
                                                    {
                                                        Response.Write("<option value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                }
                                             %>
                                            </select>
                                        </td>
                                        <td>年</td>
                                        <td>
                                            <select id="birth_month" size="1" style="width:auto">
                                            <%
                                                for (int i = 1; i <= 12; i++)
                                                {
                                                    if (i == user.birDT.Month)
                                                    {
                                                        Response.Write("<option selected=\"selected\" value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                    else
                                                    {
                                                        Response.Write("<option value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                }
                                             %>
                                            </select>
                                        </td>
                                        <td>月</td>
                                        <td>
                                            <select id="birth_day" size="1" style="width:auto">
                                            <%
                                                for (int i = 1; i <= 31; i++)
                                                {
                                                    if (i == user.birDT.Day)
                                                    {
                                                        Response.Write("<option selected=\"selected\" value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                    else
                                                    {
                                                        Response.Write("<option value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                }
                                             %>
                                            </select>
                                        </td>
                                        <td>日</td>
                                      </tr>
                                    </table> 
                                    
                                <p ><label>联系电话：</label><input type="text"  id="telphone" type="text" value="<%=user.phone %>" /></p>
                                
                                <p><label>籍贯：</label>
                                <textarea id="home_address" class="form-control" rows="3" style="width:450px;"><%=user.homeAddress %></textarea></p>
                                
                                <p><label>联系地址：</label>
                                <textarea id="living_address" class="form-control" rows="3" style="width:450px;"><%=user.livingAddress %></textarea></p>

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
    <script src="../Scripts/cjstudio.js" type = "text/javascript"></script>
    <script src="../Scripts/ajaxfileupload.js" type = "text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>

    <script type="text/javascript">
        function commit_save() {
            var name = document.getElementById("username").value;
            var sex = document.getElementById("user_sex").value;
            var year = document.getElementById("birth_year").value;
            var month = document.getElementById("birth_month").value;
            var day = document.getElementById("birth_day").value;
            var phone = document.getElementById("telphone").value;
            var homeaddress = document.getElementById("home_address").value;
            var livingaddress = document.getElementById("living_address").value;
            htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
                async: false,
                data: { "code": "just_user_information",
                    "name": name,
                    "sex": sex,
                    "year": year,
                    "month": month,
                    "day": day,
                    "phone": phone,
                    "homeaddress": homeaddress,
                    "livingaddress": livingaddress
                }
            });
            //alert(htmlobj.responseText);
            var dataRes = $.parseJSON(htmlobj.responseText);
            //alert(dataRes.msg);
            oDiv = document.getElementById("commit_status");
            if (dataRes.status == 'success') {
                oDiv.innerHTML = '<div class="alert alert-success">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' + '提示!' +
								 '</h4> <strong>用户信息提交成功!</strong>' +
								 '</div>';
            } else {
                oDiv.innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' + '提示!' +
								 '</h4> <strong>'+dataRes.msg+'!</strong>' +
								 '</div>';
            }
        }
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

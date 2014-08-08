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

<body algin="center"  style="width:600px; min-height:800px;">
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
                                
                                <h4><label>籍贯：</label>
                                <select style="width:auto;" id="home_address_province" onchange="chageProvince('home_address_province','home_address_city','home_address_cityzone');">
                                    <% 
                                        foreach (FC.cjstudio.Address province in provinces)
                                        {
                                            if (province.id == user.fullHomeAddress.provinceId)
                                            {
                                                Response.Write("<option selected=\"selected\"  value=\"" + province.id +
                                                    "\">" + province.name + "</option>");
                                            }
                                            else
                                            {
                                                Response.Write("<option value=\"" + province.id + "\">" + province.name + "</option>");
                                            }
                                        }
                                            %>
                                </select>
                                <select style="width:auto;" id="home_address_city" onchange="chageCity('home_address_city','home_address_cityzone');">
                                    <% 
                                        try
                                        {
                                            citys = FC.cjstudio.getCitys(user.fullHomeAddress.provinceId);
                                        }
                                        catch (Exception)
                                        {
                                            citys = FC.cjstudio.getCitys("1");
                                        }
                                        try
                                        {
                                            cityzones = FC.cjstudio.getCityzones(user.fullHomeAddress.cityId);
                                        }
                                        catch (Exception)
                                        {
                                            cityzones = FC.cjstudio.getCityzones("1");
                                        }
                                        foreach (FC.cjstudio.Address city in citys)
                                       {
                                           if (city.id == user.fullHomeAddress.cityId)
                                           {
                                               Response.Write("<option selected=\"selected\"  value=\"" + city.id +
                                                   "\">" + city.name + "</option>");
                                           }
                                           else
                                           {
                                               Response.Write("<option value=\"" + city.id + "\">" + city.name + "</option>");
                                           }
                                       }
                                            %>
                                </select>
                                <select style="width:auto;" id="home_address_cityzone">
                                    <% foreach (FC.cjstudio.Address cityzone in cityzones)
                                       {
                                           if (cityzone.id == user.fullHomeAddress.cityzoneId)
                                           {
                                               Response.Write("<option selected=\"selected\"  value=\"" + cityzone.id +
                                                   "\">" + cityzone.name + "</option>");
                                           }
                                           else
                                           {
                                               Response.Write("<option value=\"" + cityzone.id + "\">" + cityzone.name + "</option>");
                                           }
                                       }
                                            %>
                                </select>
                                </h4>
                                <textarea id="home_address" class="form-control" rows="3" style="width:450px;"><%=user.homeAddress %></textarea>
                                

                                <h4><label>联系地址：</label>
                                <select style="width:auto;" id="living_address_province" onchange="chageProvince('living_address_province','living_address_city','living_address_cityzone');">
                                    <% 
                                        foreach (FC.cjstudio.Address province in provinces)
                                        {
                                            if (province.id == user.fullHomeAddress.provinceId)
                                            {
                                                Response.Write("<option selected=\"selected\"  value=\"" + province.id +
                                                    "\">" + province.name + "</option>");
                                            }
                                            else
                                            {
                                                Response.Write("<option value=\"" + province.id + "\">" + province.name + "</option>");
                                            }
                                        }
                                            %>
                                </select>
                                <select style="width:auto;" id="living_address_city" onchange="chageCity('living_address_city','living_address_cityzone');">
                                    <% 
                                        try
                                        {
                                            citys = FC.cjstudio.getCitys(user.fullLivingAddress.provinceId);
                                        }
                                        catch (Exception)
                                        {
                                            citys = FC.cjstudio.getCitys("1");
                                        }
                                        try
                                        {
                                            cityzones = FC.cjstudio.getCityzones(user.fullLivingAddress.cityId);
                                        }
                                        catch (Exception)
                                        {
                                            cityzones = FC.cjstudio.getCityzones("1");
                                        }
                                        foreach (FC.cjstudio.Address city in citys)
                                       {
                                           if (city.id == user.fullLivingAddress.cityId)
                                           {
                                               Response.Write("<option selected=\"selected\"  value=\"" + city.id +
                                                   "\">" + city.name + "</option>");
                                           }
                                           else
                                           {
                                               Response.Write("<option value=\"" + city.id + "\">" + city.name + "</option>");
                                           }
                                       }
                                            %>
                                </select>
                                <select style="width:auto;" id="living_address_cityzone">
                                    <% foreach (FC.cjstudio.Address cityzone in cityzones)
                                       {
                                           if (cityzone.id == user.fullLivingAddress.cityzoneId)
                                           {
                                               Response.Write("<option selected=\"selected\"  value=\"" + cityzone.id +
                                                   "\">" + cityzone.name + "</option>");
                                           }
                                           else
                                           {
                                               Response.Write("<option value=\"" + cityzone.id + "\">" + cityzone.name + "</option>");
                                           }
                                       }
                                            %>
                                </select>
                                </h4>
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

        function chageProvince(provinceID, cityID, cityzoneID) {
            var provinceid = document.getElementById(provinceID).value;
            htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
                async: false,
                data: { "code": "get_citys_by_province",
                    "provinceid": provinceid
                    }
            });
            var dataRes = $.parseJSON(htmlobj.responseText);
            //alert(dataRes.msg);
            oDiv = document.getElementById("commit_status");
            if (dataRes.status == 'success') {
                document.getElementById(cityID).innerHTML = decode64(dataRes.msg);
                chageCity(cityID, cityzoneID);
            } 
        }
        function chageCity(cityID,cityzoneID) {
            var cityid = document.getElementById(cityID).value; 
            htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
                async: false,
                data: { "code": "get_cityzones_by_city",
                    "cityid": cityid
                }
            }); 
            var dataRes = $.parseJSON(htmlobj.responseText);
            //alert(dataRes.msg);
            oDiv = document.getElementById("commit_status");
            if (dataRes.status == 'success') {
                document.getElementById(cityzoneID).innerHTML = decode64(dataRes.msg);
            } 
        }
        function commit_save() {
            var name = document.getElementById("username").value;
            var sex = document.getElementById("user_sex").value;
            var year = document.getElementById("birth_year").value;
            var month = document.getElementById("birth_month").value;
            var day = document.getElementById("birth_day").value;
            var phone = document.getElementById("telphone").value;
            var homeaddress = document.getElementById("home_address").value;
            var livingaddress = document.getElementById("living_address").value;
            var homeaddressid = document.getElementById("home_address_cityzone").value;
            var livingaddressid = document.getElementById("living_address_cityzone").value;
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
                    "livingaddress": livingaddress,
                    "homeaddressid": homeaddressid,
                    "livingaddressid": livingaddressid
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

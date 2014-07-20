<%@ Page Title="关于我们" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FC.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title><%=FC.cjstudio.getValue("MainTitle")%></title>
  <meta name="author" content="CJ_Studio"/>

  <!-- Le styles -->
  <link href="./JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link type="text/css" href="./JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="./JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

  <link href="./JqueryUi/assets/css/docs.css" rel="stylesheet"/>
  <link href="./JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
    
    
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true" style="padding-top:0px;">
                    <!-- 登陆框 Start -->
                    <div id="wd_loginIn" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" 
                        aria-hidden="true" align="center">
	                    <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
		                    <h3 id="myModalLabel">
			                    用户登陆
		                    </h3>
	                    </div>
	                    <div class="modal-body right" >
                                <div id="login_commit_result"></div>
		                        <form id="form_login" runat="server" align="center">
                                    <table >
                                        <tr>
                                            <td style="width:auto">
                                                <p>用户名</p>
                                            </td>
                                            <td>
                                                <input id="username" type="text" placeholder="用户账号、姓名或注册邮箱"/>
                                            </td>
                                            <td>
                                                <label></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:auto">
                                                <p>密码</p>
                                            </td>
                                            <td>
                                                <input id="password" type="password" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:auto">
                                            </td>
                                            <td>
                                                <label class="checkbox" contenteditable="true"> 
                                                <input id="member" type="checkbox" />近30天内自动登陆 </label>
                                                <%--<input id="member" type="checkbox" >近30天内自动登陆</input>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
	                    </div>
	                    <div id="commit_login_div" class="modal-footer">
			                <input id="commit_login" class="btn " type="button" onclick="LoadPost();" 
                                value="登陆"/> 
	                    </div>
                    </div>
                    <!-- 登陆框 Over -->

  
  <!-- Subhead
  ================================================== -->
  <header class="subhead" id="overview"  style="background-image:linear-gradient(to bottom,#D66123, Orange ">
    <div class="container" style="width:970px;">
        <div class="span2">
            <img src="./img/logo (1).png">
        </div >
        <div class="span7">
            <br>
            <h1><%=FC.cjstudio.getValue("MainTitle")%></h1>
            <p class="lead"><%=FC.cjstudio.getValue("MainSlogan")%></p>
        </div>
    </div>
  </header>

  

  <div class="container" style="width:970px;">
  <!-- Navbar
================================================== -->
      <div class="navbar navbar-inverse" style="margin-bottom:0px;">
        <div class="navbar-inner" style="background-image:linear-gradient(to bottom, #111111, #D66123 ">
          <div class="container">
        
            <a class="brand" href="./Default.aspx"><%=this.getValue("MainTitle")%></a>
              <ul class="nav">
                <li class="active">
                    <a href="./Default.aspx">首页</a>
                </li>
                <li>
                    <a href="./Elderly/Elderly.aspx">爸妈频道</a>
                </li>
                <li>
                    <a href="./Journal/Journal.aspx">志愿者脚步</a>
                </li>
                <li>
                    <a href="./Community/Community.aspx">社区管理</a>
                </li>
                <li>
                    <a href="./About/About.aspx">关于我们</a>
                </li>
              </ul>
              <div  class="pull-right">
                <div id="login_signup_div">
                <%if (!isIdenUser)
                  { 
                      %>
                    <table>
                    
                        <td>
                        <a id="bt_loginIn" href="#wd_loginIn" role="button" class="btn" data-toggle="modal">
                        登陆</a></td>
                        <td>
                        <a class="btn"  href="./Account/SignUp.aspx">
                        注册</a></td>
                   </table>
                   <%
                  }
                  else { 
                      %>
                            <div class="btn-group">
				            <button class="btn ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
                            <span class="ui-button-text">
                            <%=uname %>
                            </span></button>
                            <button data-toggle="dropdown" class="btn dropdown-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
                            <span class="ui-button-text">
                            <span class="caret"></span></span></button>
				                <ul class="dropdown-menu">
                                <li><a href="<%=getTypePath()%>">个人信息</a></li>
					            <li><a href="#">设置栏目</a></li>
					            <li><a href="#">更多设置</a></li>
					            <li class="divider"></li>
					            <li><a onclick="exitLogin();">安全退出</a></li>
					            </ul></div>	
                      <% } %>
                </div>
              </div>
            </div>
          </div>
        </div>
 <!-- ================================================== -->

  <!-- Docs nav ================================================== -->
    <div class="row" style="width:970px;margin-left:0px;">
	    
  <!--########### Main Content Start ================================================== -->
<!--########### Main Content Start ================================================== -->
<iframe src="./Others/HomeContent.aspx" scrolling="no" frameborder="0" height="100%" 
id="home_content_iframe" width="100%" onload="autoIframeSize('home_content_iframe');"></iframe>

<!--########### Main Content End ================================================== -->
  <!--########### Main Content End ================================================== -->
    </div>
  </div>

<!-- Footer
================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-botton" >
  
      <footer class="footer"  style="background-image:linear-gradient(to bottom, Orange,#D66123 ">
        <div class="container"  style="width:970px;">
          <div class="span2" align="center">
      	    <div class=" pull-right" style="margin-top:8px;">
        	    <a type="button" 
                    class=".btn-large brand ui-button btn btn-primary ui-widget ui-state-default ui-corner-all  ui-button-text-only" 
                    align="center" role="button" aria-disabled="false" href="../Others/SupportUs.aspx">
                    支持我们
                </a>
      	    </div>
	        </div>
          <div class="span7">
      	    <div class="pull-left ui-corner-top">
      		    <img src="../JqueryUi/img/line1.gif" height="20" width="5"/>
            </div>
      	    <div align="left" style="padding-left:30px;font-color:red;">
                <p contenteditable="true">联系电话:<strong> <%=FC.cjstudio.getValue("ContactNumber")%></strong></p>
                <p contenteditable="true">联系邮箱:<strong> <%=FC.cjstudio.getValue("ContactEmail")%></strong></p>
                <p contenteditable="true">联系地址:<strong> <%=FC.cjstudio.getValue("ContactAddress")%></strong></p>
                <a href="./Others/GiveAdvice.aspx">点击此处</a>给我们提出您的建议或意见
            </div>
	        </div>
        </div>
      </footer>
      </div>
  <!-- Placed at the end of the document so the pages load faster
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> -->
    <script src="./Scripts/cjstudio.js" type = "text/javascript"></script>
  <script src="./Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
  
  <script src="./Scripts/md5.js" type="text/javascript"></script>
  <script src="./Scripts/Home.js" type = "text/javascript"></script>
  <script src="./JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>
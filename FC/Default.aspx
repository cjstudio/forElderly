<%@ Page Title="关于我们" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FC.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title><%=this.getValue("MainTitle")%></title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="A preview of the jQuery UI Bootstrap theme">
  <meta name="author" content="Addy Osmani">

  <!-- Le styles -->
  <link href="./JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="./JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="./JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

  <link href="./JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="./JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    
  <!-- Le fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" 
        href="./JqueryUi/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" 
        href="./JqueryUi/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" 
        href="./JqueryUi/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" 
        href="./JqueryUi/assets/ico/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="./img/logo (5).png">
    
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">
                    <!-- 登陆框 Start -->
                    <script type="text/javascript">
                        function LoadPost(event) {
                            var username = document.getElementById("username").value.toString();
                            var password = document.getElementById("password").value.toString();
                            var member = document.getElementById("member").checked.toString();
                            var oDiv = document.getElementById("login_commit_result");
                            htmlobj = $.ajax({ url: "Account/Login.aspx",
                                async: false,
                                data: { "username": username, "password": password, "member": member }
                            });
                            var dataRes = $.parseJSON(htmlobj.responseText);
                            if (dataRes.status == "Success") {
                                LoginSuccess(oDiv, dataRes);
                            } else if (dataRes.status == "Error") {
                                oDiv.innerHTML =
                                    '<div class="alert alert-danger" role="alert">'+dataRes.msg+'</div>';
                            } else {
                                oDiv.innerHTML =
                                    '<div class="alert alert-warning" role="alert">' + dataRes.msg + '</div>';
                            }
                        }

                        function LoginSuccess(oDiv, dataRes) {
                            oDiv.innerHTML =
                                    '<div class="alert alert-success" role="alert">登陆成功</div>';
                            var oDivloginSignup = document.getElementById("login_signup_div");
                            var oBtn = $("#commit_login_div");
                            oBtn.html('<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>');
                            oDivloginSignup.innerHTML = '<div class="btn-group">' +
				                    '<button class="btn">' + dataRes.username +
                                    '</button> <button data-toggle="dropdown" class="btn dropdown-toggle">' +
                                    '<span class="caret"></span></button>'+
				                        '<ul class="dropdown-menu">' +
                                        '<li><a href="#">个人信息</a></li>'+
					                    '<li><a href="#">设置栏目</a></li>'+
					                    '<li><a href="#">更多设置</a></li>'+
					                    '<li class="divider"></li>'+
					                    '<li><a href="#">安全退出</a></li>' +
					                    '</ul></div>';
//                            alert(dataRes.username);
//                            alert(dataRes.userid);
//                            alert(dataRes.usertype);
//                            alert(dataRes.picpath);
//                            alert(dataRes.usersex);
                        }
                    </script>
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
                                                <input id="username" type="text" />
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
                                                <input id="member" type="checkbox" > 记住密码</input>
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
                    <!-- 注册框 Start -->
                    <div id="wd_signUp" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
		                    <h3 id="H1">
			                    标题栏
		                    </h3>
	                    </div>
	                    <div class="modal-body">
		                    <p>
			                    显示信息
		                    </p>
	                    </div>
	                    <div class="modal-footer">
			                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> 
                            <button class="btn btn-primary">保存设置</button>
	                    </div>
                    </div>
                    <!-- 注册框 Over -->
<!-- Navbar
================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner" style="background-image:linear-gradient(to bottom, #111111, #D66123 ">
      <div class="container">
        
        <a class="brand" href="#"><%=this.getValue("MainTitle")%></a>
        <!--<div class="nav-collapse collapse">-->
          <ul class="nav">
            <li class="active">
                <a href="#">首页</a>
            </li>
            <li>
                <a href="#">爸妈频道</a>
            </li>
            <li>
                <a href="#">志愿者脚步</a>
            </li>
            <li>
                <a href="#">社区管理</a>
            </li>
            <li>
                <a href="#">关于我们</a>
            </li>
          </ul>
          <div  class="pull-right">
            <div>
                <table id="login_signup_div">
                  <td>
                    <a id="bt_loginIn" href="#wd_loginIn" role="button" class="btn" data-toggle="modal">
                    登陆</a>
                    
                  </td>
                  <td>
                    <a id="bt_signUp" href="#wd_signUp" role="button" class="btn" data-toggle="modal">
                    注册</a>
                  </td>
               </table>
            </div>
         	<%--<script>
         	    !function (d, s, id) {
         	        var js, fjs = d.getElementsByTagName(s)[0];
         	        if (!d.getElementById(id)) {
         	            js = d.createElement(s);
         	            js.id = id; js.src = "//platform.twitter.com/widgets.js";
         	            fjs.parentNode.insertBefore(js, fjs);
         	        }
         	    } (document, "script", "twitter-wjs");
            </script>--%>

          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Subhead
  ================================================== -->
  <header class="jumbotron subhead" id="overview">
    <div class="container">
        <div class="span2">
            <img src="./img/logo (1).png">
        </div >
        <div class="span8">
            <h1><%=this.getValue("MainTitle")%></h1>
            <p class="lead"><%=this.getValue("MainSlogan")%></p>
        </div>
    </div>
  </header>


  <div class="container">
  <!-- Docs nav ================================================== -->
    <div class="row">
      <div class="span9 bs-docs-sidebar pull-left" >
      	<div style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;爸妈频道</strong>
                <a  class="pull-right">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div align="center" >
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                </div>
            </div>
        </div>
     </div>

       <div class="span3 pull-right" >
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;站内公告</strong>
                <a  class="pull-right">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div align="center" >
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                </div>
            </div>
        </div>
      </div>
      <div class="span6 pull-right" >
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;志愿者脚步</strong>
                <a  class="pull-right">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div align="center" >
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                  <p>Test Right</p>
                </div>
            </div>
        </div>
      </div>
      <div class="span6 pull-right" >
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;社区管理</strong>
                <a  class="pull-right">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                      <img src="./img/test1.jpg" alt="321">
                      <div class="carousel-caption">
                        
                      </div>
                    </div>
                    <div class="item">
                      <img src="./img/test2.jpg" alt="123">
                      <div class="carousel-caption">
                      </div>
                    </div>
                    ...
                  </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only"><</span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">></span>
                  </a>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>

<!-- Footer
================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-botton">
  
      <footer class="footer" style="background-image:linear-gradient(to bottom, #D66123 , #111111)">
        <div class="container">
          <div class="span3" align="center">
      	    <div class=" pull-right">
        	    <a type="button" 
                    class=".btn-large brand ui-button btn btn-primary ui-widget ui-state-default ui-corner-all  ui-button-text-only" 
                    align="center" role="button" aria-disabled="false">
                    支持我们
                </a>
      	    </div>
	        </div>
          <div class="span9">
      	    <div class="pull-left ui-corner-top">
      		    <img src="./JqueryUi/img/line1.gif" height="20" width="5"/>
            </div>
      	    <div align="left" style="padding-left:30px">
        	    <p><strong>联系我们:</strong>Hero</p>
        	    <p><strong>联系我们:</strong>Hero</p>
                <p><strong>联系我们:</strong>Hero</p>
            </div>
	        </div>
        </div>
      </footer>
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

  <script src="./JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>
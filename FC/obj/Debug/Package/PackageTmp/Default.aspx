<%@ Page Title="关于我们" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FC.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title><%=this.getValue("MainTitle")%></title>
  <meta name="author" content="CJ_Studio"/>

  <!-- Le styles -->
  <link href="./JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="./JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="./JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

  <link href="./JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="./JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    
    
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true" style="padding-top:0px;">
                    <!-- 登陆框 Start -->
                    <script type="text/javascript">
                        function LoadPost(event) {
                            var username = document.getElementById("username").value.toString();
                            var passwordold = document.getElementById("password").value.toString();
                            var password = passwordold;
                            if (password.length != 32) {
                                password = hex_md5(passwordold).toLocaleLowerCase();
                            }
                            var member = document.getElementById("member").checked.toString();
                            var oDiv = document.getElementById("login_commit_result");
                            htmlobj = $.ajax({ url: "./Account/Login.aspx",
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
                                        '<li><a href="<%=getTypePath()%>">个人信息</a></li>' +
					                    '<li><a href="#">设置栏目</a></li>'+
					                    '<li><a href="#">更多设置</a></li>'+
					                    '<li class="divider"></li>'+
					                    '<li><a href="#">安全退出</a></li>' +
					                    '</ul></div>';
                        }
                        function exitLogin() {
                            clearCookie();
                            location.replace(location.href);
                        }
                        function clearCookie() {
                            var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
                            if (keys) {
                                for (var i = keys.length; i--; )
                                    document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
                            }
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
    <div class="container">
        <div class="span2">
            <img src="./img/logo (1).png">
        </div >
        <div class="span8">
            <br>
            <h1><%=this.getValue("MainTitle")%></h1>
            <p class="lead"><%=this.getValue("MainSlogan")%></p>
        </div>
    </div>
  </header>

  
  

  <div class="container"  id="top_div">
            
 </div>


  <div class="container">
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
                  this.Response.Write(uname);
                  %>
                <table>
                    <a id="bt_loginIn" href="#wd_loginIn" role="button" class="btn" data-toggle="modal">
                    登陆</a>
                    <a class="btn"  href="./Account/SignUp.aspx">
                    注册</a>
               </table>
               <%
              }
              else { 
                  %>
                        <div class="btn-group">
				        <button class="btn"><%=uname %>
                        </button> <button data-toggle="dropdown" class="btn dropdown-toggle">
                        <span class="caret"></span></button>
				            <ul class="dropdown-menu">
                            <li><a href="<%=getTypePath()%>">个人信息</a></li>
					        <li><a href="#">设置栏目</a></li>
					        <li><a href="#">更多设置</a></li>
					        <li class="divider"></li>
					        <li><a onclick ="exitLogin();">安全退出</a></li>
					        </ul></div>
                  <%
              } %>
            </div>
          </div>
        </div>
      </div>
    </div>
 <!-- ================================================== -->
  <!-- Docs nav ================================================== -->
    <div class="row">
	    <div class="span1">
        </div>
	    <div class="span10" style=" height:300px;">
                <div class="carousel slide" id="carousel-861163">
                  <div class="carousel-inner" >
                    <div class="item  active"> 
                        <img alt="" src="./img/test1.jpg" style=" height:300px; margin-right: auto; margin-left: auto;  ">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>棒球</h4>
                        <p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
                      </div>
                    </div>
                    <div class="item" > 
                    <img alt="" src="./img/test2.jpg" style=" height:300px; margin-right: auto; margin-left: auto;">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>冲浪</h4>
                        <p>冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。</p>
                      </div>
                    </div>
                    <div class="item "> 
                    <img alt="" src="./img/test1.jpg" style=" height:300px; margin-right: auto; margin-left: auto;">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>自行车</h4>
                        <p>以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。</p>
                      </div>
                    </div>
                  </div>
                  <a data-slide="prev" href="#carousel-861163" class="left carousel-control">‹</a> 
                  <a data-slide="next" href="#carousel-861163" class="right carousel-control">›</a> 
                </div>
              
        </div>
        <div class="span9 bs-docs-sidebar pull-left" >
      	    <div style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;爸妈频道</strong>
                <a  class="pull-right" href="./Elderly/Elderly.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div align="center" >
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p><%=uname %></p>
                  <p><%=
                         Session["uname"] == "" ? "Error" : Session["uname"] 
                          %></p>
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


      <div class="span9 pull-left" >
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;志愿者脚步</strong>
                <a  class="pull-right" href="./Journal/Journal.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
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


      <div class="span9 pull-left" >
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;社区管理</strong>
                <a  class="pull-right" href="./Community/Community.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
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
                      <img src="./img/test1.jpg" alt="321"/>
                      <div class="carousel-caption">
                        
                      </div>
                    </div>
                    <div class="item">
                      <img src="./img/test2.jpg" alt="123"/>
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
  
      <footer class="footer"  style="background-image:linear-gradient(to bottom, Orange,#D66123 ">
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
      </div>
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
  
  <script src="./Scripts/md5.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>
<%@ Page Title="关于我们" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FC.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Bootstrap</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="A preview of the jQuery UI Bootstrap theme">
  <meta name="author" content="Addy Osmani">

  <!-- Le styles -->
  <link href="./JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="./JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
  <link type="text/css" href="./JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
  <!--[if IE 7]>
  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
  <![endif]-->
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.10.0.ie.css"/>
  <![endif]-->
  <link href="./JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="./JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">

  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!-- Le fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="./JqueryUi/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="./JqueryUi/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="./JqueryUi/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="./JqueryUi/assets/ico/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="./JqueryUi/assets/ico/favicon.png">
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">

<!-- Navbar
================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner" style="background-image:linear-gradient(to bottom, #111111, #D66123 ">
      <div class="container">
        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="brand" href="#"><%=this.getValue("MainTitle")%></a>
        <div class="nav-collapse collapse">
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
          <div id="twitter-share" class="pull-right">
            <div>
            <table >
              <td>
                <button>登陆</button>
              </td>
              <td>
                <button>注册</button>
              </td>
           </table>
         </div>
         		<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Subhead
  ================================================== -->
  <header class="jumbotron subhead" id="overview">
    <div class="container">
        <h1><%=this.getValue("MainTitle")%></h1>
        <p class="lead"><%=this.getValue("MainSlogan")%></p>
    </div>
  </header>


  <div class="container">
  <!-- Docs nav ================================================== -->
    <div class="row">
      <div class="span9 bs-docs-sidebar pull-left" >
      	<div style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
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
        	<div class="navbar-static-top" style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
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
        	<div class="navbar-static-top" style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
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
        	<div class="navbar-static-top" style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <strong>&nbsp;&nbsp;社区管理</strong>
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
    </div>
  </div>

<!-- Footer
================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-botton">
  
  <footer class="footer" style="background-image:linear-gradient(to bottom, #D66123 , #111111)">
    <div class="container">
      <div class="span3" align="center">
      	<div class=" pull-right">
        	<button class=".btn-large brand ui-button btn btn-primary ui-widget ui-state-default ui-corner-all  ui-button-text-only" align="center" role="button" aria-disabled="false"><span class="ui-button-text">支持我们</span></button>
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
  <script src="./JqueryUi/assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="./JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeContent.aspx.cs" Inherits="FC.Others.HomeContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css"  rel="stylesheet" />
  <link href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
  <link href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
  <link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
</head>
<body style=" height:900px;width:970px" >
	    <div style=" height:300px;width:970px">
                <div class="carousel slide" id="carousel-861163">
                  <div class="carousel-inner" >
                    <div class="item  active"> 
                        <img alt="" src="../img/<%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Pic")%>" style=" height:300px; margin-right: auto; margin-left: auto;  ">
                      <div class="carousel-caption" >
                        <h4><%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Title")%></h4>
                        <p><%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Content")%></p>
                      </div>
                    </div>
                    <div class="item" > 
                    <img alt="" src="../img/<%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Pic")%>" style=" height:300px; margin-right: auto; margin-left: auto;">
                      <div class="carousel-caption" >
                        <h4><%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Title")%></h4>
                        <p><%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Content")%></p>
                      </div>
                    </div>
                    <div class="item "> 
                    <img alt="" src="../img/<%=FC.cjstudio.getConfigValue("HomeMainRollPic3_Pic")%>" style=" height:300px; margin-right: auto; margin-left: auto;">
                      <div class="carousel-caption" >
                        <h4><%=FC.cjstudio.getConfigValue("HomeMainRollPic3_Title")%></h4>
                        <p><%=FC.cjstudio.getConfigValue("HomeMainRollPic3_Content")%></p>
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
                <a  class="pull-right" href="../Elderly/Elderly.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div align="center" >
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p>Test Main</p>
                  <p><%=user.name %></p>
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
                <a  class="pull-right" href="../Journal/Journal.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
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
                <a  class="pull-right" href="../Community/Community.aspx">&nbsp;&nbsp;More...&nbsp;&nbsp;</a>
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
                      <img src="../img/test1.jpg" alt="321"/>
                      <div class="carousel-caption">
                        
                      </div>
                    </div>
                    <div class="item">
                      <img src="../img/test2.jpg" alt="123"/>
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
      
    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
  
    <script src="../Scripts/md5.js" type="text/javascript"></script>
    <script src="../Scripts/Login.js" type = "text/javascript"></script>
    <script src="../Scripts/md5.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>

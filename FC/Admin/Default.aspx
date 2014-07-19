<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FC.Admin.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title><%=FC.cjstudio.getValue("MainTitle")%></title>
  <meta name="author" content="CJ_Studio"/>

  <!-- Le styles -->
  <link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />

  <link href="../JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    
    
</head>

<body >
        <div class="container-fluid">
	        <div class="row-fluid">
		        <div class="span12">
		        </div>
	        </div>
	        <div class="row-fluid">
		        <div class="span12">
			        <div class="row-fluid">
				        <div class="span3">
					        <div class="row-fluid">
						        <div class="span12">
							        <div class="accordion" id="accordion-855677">
								        <div class="accordion-group">
									        <div class="accordion-heading">
										         <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-855677" href="#accordion-element-615387">选项卡 #1</a>
									        </div>
									        <div id="accordion-element-615387" class="accordion-body collapse in">
										        <div class="accordion-inner">
											        功能块...
										        </div>
									        </div>
								        </div>
								        <div class="accordion-group">
									        <div class="accordion-heading">
										         <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-855677" href="#accordion-element-204556">选项卡 #2</a>
									        </div>
									        <div id="accordion-element-204556" class="accordion-body collapse">
										        <div class="accordion-inner">
											        功能块...
										        </div>
									        </div>
								        </div>
							        </div>
						        </div>
					        </div>
				        </div>
				        <div class="span9">
					        <div class="row-fluid">
						        <div class="span12">
							         <button class="btn" type="button">按钮</button>
						        </div>
					        </div>
					        <div class="row-fluid">
						        <div class="span12">
							        <div class="alert">
								         <button type="button" class="close" data-dismiss="alert">×</button>
								        <h4>
									        提示!
								        </h4> <strong>警告!</strong> 请注意你的个人隐私安全.
							        </div>
						        </div>
					        </div>
					        <div class="row-fluid">
						        <div class="span12">
						        </div>
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
      	    <div class=" pull-right" style="margin-top:8px;">
        	    <a type="button" 
                    class=".btn-large brand ui-button btn btn-primary ui-widget ui-state-default ui-corner-all  ui-button-text-only" 
                    align="center" role="button" aria-disabled="false">
                    支持我们
                </a>
      	    </div>
	        </div>
          <div class="span9">
      	    <div class="pull-left ui-corner-top">
      		    <img src="../JqueryUi/img/line1.gif" height="20" width="5"/>
            </div>
      	    <div align="left" style="padding-left:30px;font-color:red;">
                <p contenteditable="true">联系电话:<strong> <%=FC.cjstudio.getValue("ContactNumber")%></strong></p>
                <p contenteditable="true">联系邮箱:<strong> <%=FC.cjstudio.getValue("ContactEmail")%></strong></p>
                <p contenteditable="true">联系地址:<strong> <%=FC.cjstudio.getValue("ContactAddress")%></strong></p>
                <a href="../Others/GiveAdvice.aspx">点击此处</a>给我们提出您的建议或意见
            </div>
	        </div>
        </div>
      </footer>
      </div>
  <!-- Placed at the end of the document so the pages load faster
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> -->
  <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
  
  <script src="../Scripts/md5.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>
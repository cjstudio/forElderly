<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentConfig.aspx.cs" Inherits="FC.Admin.ContentConfig1" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentConfigAdd.aspx.cs" Inherits="FC.Admin.ContentConfig" %>

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
<link href="../Styles/parallel/parallel.css" rel="stylesheet"/>
<link href="../Styles/parallel/edit_icons.css" rel="stylesheet"/>
</head>

<body  style="padding-top:0px;min-height:800px;min-width:800px;">
    <div class="container" id="page_main_content" style=" margin-left:0px;">

        <div class="container-fluid">
            <% if (isIdenUser && (user.type&8)!=0 ) { %>
            <h2>发布管理</h2>

            <% } else if(isIdenUser) { %>
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
    <script type="text/javascript" src="../Scripts/parallel/base.js"></script>
    <script type="text/javascript" src="../Scripts/parallel/base.js"></script>
    <script type="text/javascript" src="../Scripts/parallel/core.js"></script>
    <script type="text/javascript" src="../Scripts/parallel/editor.js"></script>
    <script type="text/javascript">
        
    </script>

</body>
</html>
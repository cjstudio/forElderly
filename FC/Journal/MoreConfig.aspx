<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoreConfig.aspx.cs" Inherits="FC.Journal.MoreConfig" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8"/>
      <title><%=FC.cjstudio.getValue("MainTitle")%></title>
      <meta name="author" content="CJ_Studio"/>

      <!-- Le styles -->
      <link type="text/css" href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
      <link type="text/css" href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
      <link type="text/css" href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>
</head>

<body style="width:600px; height:600px;">
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
                    <%if (isIdenUser)
                      { %>
					<div class="row-fluid">
                    <h2></h2>
                            <button class="btn"  onclick="commit_save();return false;">保存</button>
                            <div class="span12" id="commit_status"></div>

                            
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

</body>
</html>

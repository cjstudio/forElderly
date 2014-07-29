<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowArticlePage.aspx.cs" Inherits="FC.Others.ShowArticlePage" %>

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
</head>

<body  style="padding-top:0px;min-height:800px;min-width:600px; max-width:950px; margin-left:10px">
    <div class="container">
    
        <div class="row" style="max-width:950px;">
		    <div class="span12">
			    <h2>
				    <%
                        try
                        {
                            string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(article.title));
                            Response.Write(tmp);
                        }
                        catch (Exception)
                        {
                            Response.Write("错误的标题");
                        }	        
				         %>
			    </h2>
		    </div>
            <div class="span12">
            <h4>作者: <%=article.authorName %> &nbsp;&nbsp;   
            发布日期: <%=article.createDT.Year + "年" + article.createDT.Month + "月"+article.createDT.Day+"日"%></h4>
		    </div>
            <div id="article_content">
            
				    <%
                        try
                        {
                            string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(article.content));
                            Response.Write(tmp);
                        }
                        catch (Exception)
                        {
                            Response.Write("没有可以显示的内容");
                        }	        
				         %>
            </div>

            <div class="span12">
			    <h3>

			    </h3>
		    </div>
	    </div>
    
    </div>

    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Scripts/md5.js"></script>
    <script type="text/javascript" src="../Scripts/cjstudio.js"></script>
    <script type="text/javascript">
        
    </script>

</body>
</html>


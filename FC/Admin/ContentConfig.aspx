<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentConfig.aspx.cs" Inherits="FC.Admin.ContentConfig1" %>

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
            <% if (isIdenUser && (user.type&8)!=0 ) 
               { %>
            <h2>发布管理</h2>

            
                <table class="table table-hover " align="center" style=" text-align:center;">
                  <thead>
                    <tr >
                      <th>编号</th>
                      <th>标题</th>
                      <th >作者</th>
                      <th >创建时间</th>
                      <th >最后更改时间</th>
                      <th >选项</th>
                    </tr>
                  </thead>
                  <tbody>

                    <%
                        for (int i = (page -1 )*PAGESIZE; i < (page)*PAGESIZE&&i<articles.Count; i++)
                        {
                            if (i % 2 == 0)
                            { Response.Write("<tr>"); }
                            else { Response.Write("<tr class=\"success\">"); }
                            Response.Write("<td>"+(i+1)+"</td>");

                            string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articles[i].title));
                            if(tmp.Length >5)
                            {
                                tmp = tmp.Substring(0, 4);
                                tmp += "...";
                            }
                            Response.Write("<td>" + tmp + "</td>");
                            Response.Write("<td>"+articles[i].authorName+"</td>");
                            Response.Write("<td>"+articles[i].createDT.ToString()+"</td>");
                            Response.Write("<td>"+articles[i].updateDT.ToString()+"</td>");
                            Response.Write("<td><a href=\"ArticleEdit.aspx?article=" + articles[i].id + "\">编辑</a>," +
                                "<a href=\"#\" onclick=\"delArticle(" + articles[i].id + ");return false;\">删除</a></td>");
                            Response.Write("</tr>");
                        }
                     %>
                      
                  </tbody>
                </table>
              
                <div class="pagination pagination-centered">
                  <ul >
                  <% if (page == 1){ %>
                    <li><a href="?page=<%=page+1 %>">下一页</a></li>
                    <li><a href="?page=<%=(articles.Count+9) / PAGESIZE  %>">尾页</a></li>
                    
                  <% } else if(page >= ((articles.Count+9) / PAGESIZE) ){%>
                    <li><a href="?page=1">首页</a></li>
                    <li><a href="?page=<%=page-1 %>">上一页</a></li>
                    
                  <% } else {%>
                    <li><a href="?page=1">首页</a></li>
                    <li><a href="?page=<%=page-1 %>">上一页</a></li>
                    <li><a href="?page=<%=page+1 %>">下一页</a></li>
                    <li><a href="?page=<%=(articles.Count+9) / PAGESIZE  %>">尾页</a></li>
                  <% }%>
                    <li><input type="text" id="input_goto_page" style="width:30px; text-align:center;"value="<%=page %>" />页
                    <a id="btn_goto_page" onclick="goToPage();" href="?<%=page %>">GO</a></li>
                    <li>共 <%=articles.Count  %> 条/<%=(articles.Count+9) / PAGESIZE  %> 页</li>
                  </ul>
                </div>

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
        function goToPage() {
            document.getElementById("btn_goto_page").href = '?page=' + document.getElementById("input_goto_page").value;
        }
        
        function delArticle(articleId) {
            ;
        }
    </script>

</body>
</html>
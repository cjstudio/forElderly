<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeContent.aspx.cs" Inherits="FC.Others.HomeContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css"  rel="stylesheet" />
  <link href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
  <link href="../JqueryUi/assets/css/docs.css" rel="stylesheet"/>
  <link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet"/>

  <style type="text/css">
      .article_feet_img
      {
          width:120px; 
          height:80px;
          border:0px;
          }
        .manager_img
        {
          width:130px; 
          height:82px;
          border:0px;
          margin-top:10px;
            }
            a{ 
             font-family:"Microsoft Yahei";
           } 
  </style>
</head>
    <body style=" min-height:900px;width:970px" >
	    <div style=" height:300px;width:970px;">
            <div class="carousel slide" id="carousel-861163">
                <div class="carousel-inner" >
                <div class="item  active"> 
                    <img alt="" src="../img/<%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Pic")%>" style=" height:300px; margin-right: auto; margin-left: auto;  "/>
                    <div class="carousel-caption" >
                    <h4><%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Title")%></h4>
                    <p><%=FC.cjstudio.getConfigValue("HomeMainRollPic1_Content")%></p>
                    </div>
                </div>
                <div class="item" > 
                <img alt="" src="../img/<%=FC.cjstudio.getConfigValue("HomeMainRollPic2_Pic")%>" style=" height:300px; margin-right: auto; margin-left: auto;"/>
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
        <%--爸妈频道--%>
        <div class="span5 bs-docs-sidebar pull-left"  style="width:310px;">
      	    <div style="border:1px solid #999;padding:3px; height:294px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <img src="../img/menu_ico.png"/>
                <strong>&nbsp;&nbsp;爸妈频道</strong>
                <a class="pull-right" href="../Elderly/Elderly.aspx" style="padding-top:8px;">&nbsp;&nbsp;更多...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div >
                <br />
                
                  <%
                      for (int i = 0; i < articleAboutParent.Count  && i<8; i++)
                      {
                          try
                          {
                              string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleAboutParent[i].title)); ;
                              tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                              Response.Write("<ul><a href=\"../Others/ShowArticlePage.aspx?article=" +
                                  articleAboutParent[i].id + "\">" + tmp + "</a>&nbsp;" +
                                  articleAboutParent[i].createDT.ToShortDateString()+"</ul>");   
                          }
                          catch (Exception)
                          {
                              ;
                          }
                      }                      
                       %>
                </div>
            </div>
        </div>
     </div>

       <div class="span5 pull-right"  style="width:300px; margin-left:0px;">
       <%--站内公告--%>
         <div class="span12"  style="width:280px;">
            <div  style="border:1px solid #999;padding:3px; height:294px;">
        	    <div class="navbar-static-top" 
                    style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
                    <img src="../img/menu_ico.png"/>
          	        <strong>&nbsp;&nbsp;站内公告</strong>
                    <strong class="pull-right" style="padding-top:8px;"><a >更多...&nbsp;&nbsp;</a></strong>
                </div>
        	    <div><!-- 栏目内容 -->
                    <div >
                    <br />
                      <%
                          for (int i = 0; i < articleAnnouncement.Count && i < 8; i++)
                          {
                              try
                              {
                                  string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleAnnouncement[i].title)); ;
                                  tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                                  Response.Write("<ul><a href=\"../Others/ShowArticlePage.aspx?article=" +
                                      articleAnnouncement[i].id + "\">" + tmp + "</a>&nbsp;" +
                                      articleAnnouncement[i].createDT.ToShortDateString() + "</ul>");   
                              }
                              catch (Exception)
                              {
                                  ;
                              }
                          }                      
                           %>
                    </div>
                </div>
              </div>
            </div>

        <%--友情链接--%>
         <div class="span12"  style="width:280px;margin-top:10px;">
            <div  style="border:1px solid #999;padding:3px;">
        	    <div class="navbar-static-top" 
                    style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	        <img src="../img/menu_ico.png"/>
                    <strong>&nbsp;&nbsp;友情链接</strong>
                </div>
        	    <div><!-- 栏目内容 -->
                    <div >
                        <table width="270px">
                        <thead>
		                    <tr>
			                    <th style="width:270px;" align="center" nowrap="nowrap"></th>
		                    </tr>
	                    </thead>
                        <tbody>
                            <tr  align="center">
                                <td>
                                <a href="http://www.zgzyz.org.cn" target="_blank"><img src="http://www.zgzyz.org.cn/ZYZ_logo.gif" style="height:50px;"></a>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            
                            <tr  align="center">
                                <td>
                                <a href="http://www.galr.cn/" target="_blank"><img src="http://www.galr.cn/template/wmff_miui_z/img/logo.png" style="height:50px;"></a>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

      </div>

      
      <!-- 志愿者脚步 -->
      <div class="span5 pull-left"  style="width:320px; margin-left:10px;">
        <div  style="border:1px solid #999;padding:3px; height:294px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <img src="../img/menu_ico.png"/>
                <strong>&nbsp;&nbsp;志愿者脚步</strong>
                <a  class="pull-right" href="../Journal/Journal.aspx" style="padding-top:8px;">&nbsp;&nbsp;更多...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div >
                <table width="300px" align="center">
                    <thead>
                        <tr>
                            <td style="width:50%;" align="center" nowrap="nowrap"></td>
                            <td style="width:50%;" align="center"  nowrap="nowrap"></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr >
                            <td align="center" style="padding-top:10px;">
                                <img src="<%=FC.cjstudio.getConfigValue("志愿者脚步Pic0")%>" class="article_feet_img"/>
                                <br />
                                <% 
                                    try
                                    {
                                        int i = 0;
                                        string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleJournal[i].title)); ;
                                        tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;
                                        Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                            articleJournal[i].id + "\">" + tmp + "</a>");
                                   }
                                   catch (Exception)
                                    {
                                        Response.Write("<a>关爱老人</a>");
                                   }
                                     %>
                            </td>
                            <td align="center"  style="padding-top:10px;">
                                <img src="<%=FC.cjstudio.getConfigValue("志愿者脚步Pic1")%>" class="article_feet_img"/>
                                <br />
                                <% 
                                    try
                                    {
                                        int i = 1;
                                        string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleJournal[i].title)); ;
                                        tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;
                                        Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                            articleJournal[i].id + "\">" + tmp + "</a>");
                                   }
                                   catch (Exception)
                                   {
                                       ;
                                   }
                                     %>
                            </td>
                        </tr>
                        <tr >
                            <td align="center" style="padding-top:10px;">
                                <img src="<%=FC.cjstudio.getConfigValue("志愿者脚步Pic2")%>" class="article_feet_img"/>
                                <br />
                                <% 
                                    try
                                    {
                                        int i = 2;
                                        string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleJournal[i].title)); ;
                                        tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;
                                        Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                            articleJournal[i].id + "\">" + tmp + "</a>");
                                   }
                                   catch (Exception)
                                    {
                                        Response.Write("<a>关爱老人</a>");
                                   }
                                     %>
                            </td>
                            <td align="center" style="padding-top:10px;">
                                <img src="<%=FC.cjstudio.getConfigValue("志愿者脚步Pic3")%>" class="article_feet_img"/>
                                <br />
                            <% 
                                    try
                                    {
                                        int i = 3;
                                       string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleJournal[i].title)); ;
                                       tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;
                                       Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                           articleJournal[i].id + "\">" + tmp + "</a>");
                                   }
                                   catch (Exception)
                                    {
                                        Response.Write("<a>关爱老人</a>");
                                   }
                                     %>
                            </td>
                        </tr>
                    </tbody>
                </table>
                      
                <br />
                  <%--<%
                      for (int i = 0; i < articleJournal.Count && i < 8; i++)
                      {
                          try
                          {
                              string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleJournal[i].title)); ;
                              tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                              Response.Write("<ul><a href=\"../Others/ShowArticlePage.aspx?article=" +
                                  articleJournal[i].id + "\">" + tmp + "</a>&nbsp;" +
                                  articleJournal[i].createDT.ToShortDateString() + "</ul>");   
                          }
                          catch (Exception)
                          {
                              throw;
                          }
                      }                      
                       %>--%>
                </div>
            </div>
        </div>
      </div>

      <!-- 社区管理 -->
      <div class="span9 pull-left"  style="width:640px;margin-top:10px;">
        <div  style="border:1px solid #999;padding:3px;">
        	<div class="navbar-static-top" 
                style="background-image:linear-gradient(to bottom, #f6a123, #D66123 "><!-- 栏目头 -->
          	    <img src="../img/menu_ico.png"/>
                <strong>&nbsp;&nbsp;社区管理</strong>
                <a  class="pull-right" href="../Community/Community.aspx"  style="padding-top:8px;">&nbsp;&nbsp;更多...&nbsp;&nbsp;</a>
            </div>
        	<div><!-- 栏目内容 -->
                <div  >
                <table style="width:630px;" align="center">
                    <tbody>
                    <tr>
                        <td align="center">
                            <img src="<%=FC.cjstudio.getConfigValue("社区管理Pic0")%>" class="manager_img"/>
                            <br />
                                 <%
                                try
                              {
                                  int i = 0;
                                  string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleCommunity[i].title)); ;
                                  tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                                  Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                      articleCommunity[i].id + "\">" + tmp + "</a>");
                              }
                              catch (Exception)
                                {
                                    Response.Write("<a>关爱老人</a>");
                              }
                                 %>
                        </td>
                        <td align="center">
                            <img src="<%=FC.cjstudio.getConfigValue("社区管理Pic1")%>" class="manager_img"/>
                            <br />
                                 <%
                                try
                              {
                                  int i = 1;
                                  string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleCommunity[i].title)); ;
                                  tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                                  Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                      articleCommunity[i].id + "\">" + tmp + "</a>");
                              }
                              catch (Exception)
                                {
                                    Response.Write("<a>关爱老人</a>");
                              }
                                 %>
                        </td>
                        <td align="center">
                            <img src="<%=FC.cjstudio.getConfigValue("社区管理Pic2")%>" class="manager_img"/>
                            <br />
                                 <%
                                try
                              {
                                  int i = 2;
                                  string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleCommunity[i].title)); ;
                                  tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                                  Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                      articleCommunity[i].id + "\">" + tmp + "</a>");
                              }
                              catch (Exception)
                                {
                                    Response.Write("<a>关爱老人</a>");
                              }
                                 %>
                        </td>
                        <td align="center">
                            <img src="<%=FC.cjstudio.getConfigValue("社区管理Pic3")%>" class="manager_img"/>
                            <br />
                                 <%
                                try
                              {
                                  int i = 3;
                                  string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleCommunity[i].title)); ;
                                  tmp = tmp.Length > 8 ? tmp.Substring(0, 6) + "..." : tmp;

                                  Response.Write("<a href=\"../Others/ShowArticlePage.aspx?article=" +
                                      articleCommunity[i].id + "\">" + tmp + "</a>");
                              }
                              catch (Exception)
                              {
                                    Response.Write("<a>关爱老人</a>");
                              }
                                 %>
                        </td>
                    </tr>
                    </tbody>
                </table>
                 <%-- <%
                      for (int i = 0; i < articleCommunity.Count && i < 8; i++)
                      {
                          try
                          {
                              string tmp = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(articleCommunity[i].title)); ;
                              tmp = tmp.Length > 12 ? tmp.Substring(0, 10)+"..." : tmp;

                              Response.Write("<ul><a href=\"../Others/ShowArticlePage.aspx?article=" +
                                  articleCommunity[i].id + "\">" + tmp + "</a>&nbsp;" +
                                  articleCommunity[i].createDT.ToShortDateString() + "</ul>");   
                          }
                          catch (Exception)
                          {
                              throw;
                          }
                      }                      
                       %>--%>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentConfig.aspx.cs" Inherits="FC.Admin.ContentConfig" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title><%=FC.cjstudio.getValue("MainTitle")%></title>
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

<body  style="padding-top:0px;min-height:1000px;min-width:800px;">
    <div class="container" id="page_main_content" style=" margin-left:0px;">

        <div class="container-fluid">
            <% if (isIdenUser && (user.type&8)!=0 )
                //if(true)
               { %>
	        <div class="row-fluid">
		        <label><h2>栏目编辑</h2></label>
	        </div>
            <div class="row-fluid">
                <div class="form-group form-group-lg">
                    <h4>标题&nbsp;&nbsp;<input class="form-control" type="text" id="article_title" placeholder="链接处所显示的内容"/></h4>
                    <h4>栏目&nbsp;&nbsp;
                    <select style="width:auto;" id="super_content_type" onchange="chageSuperContentType();">
                        <% 
                            foreach (KeyValuePair<int ,string> pair in superContentType)
                            {
                                Response.Write("<option value=\"" +
                                       pair.Key + "\">" +
                                       pair.Value + "</option>");
                            }
                                %>
                    </select>
                    <select style="width:auto;" id="content_type">
                        <% 
                            Dictionary<int, string> ContentType = FC.cjstudio.getContentType(1);
                            foreach (KeyValuePair<int ,string> pair in ContentType)
                            {
                                Response.Write("<option value=\"" +
                                       pair.Key + "\">" +
                                       pair.Value + "</option>");
                            }
                                %>
                    </select>
                    </h4>
                </div>

	            <div class="html_edit">
		            <div class="span12">
                        <div class="top_div">
                            <div class="edit_toolbar">
                                <ul id="cmdItem">
                                    <!--<li><a id="undo" href="#" title="撤消"></a></li>
                                    <li><a id="redo" href="#" title="重复"></a></li>-->
                                    <li><a id="b" href="#" title="加粗"></a></li>
                                    <li><a id="i" href="#" title="倾斜"></a></li>
                                    <li><a id="u" href="#" title="下划线"></a></li>
                                    <li><a id="superscript" href="#" title="上标"></a></li>
                                    <li><a id="suffix" href="#" title="下标"></a></li>
                                    <li><a id="ol" href="#" title="编号"></a></li>
                                    <li><a id="ul" href="#" title="项目符号"></a></li>
                                    <li><a id="algLf" href="#" title="文本左对齐"></a></li>
                                    <li><a id="algCn" href="#" title="居中"></a></li>
                                    <li><a id="algRg" href="#" title="文本右对齐"></a></li>
                                    <li><a id="addIndtat" href="#" title="增加缩进量"></a></li>
                                    <li><a id="reduceIndtat" href="#" title="减少缩进量"></a></li>
                                    <li><a id="link" href="#" title="插入超链接"></a></li>
                                    <!--<li><a id="img" href="#" title="插入图片"></a></li>-->
                                    <li><a id="tb" href="#" title="表格"></a></li>
                                    <li><a id="fontColor" href="#" title="字体颜色"></a></li>
                                    <li><a id="bgColor" href="#" title="以不同颜色突出显示文本"></a></li>
                                    <li>
                                        <select id="fS" title="字号" class="select">
                                            <option value=""></option>
                                            <option value="8" selected="selected">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="14">14</option>
                                            <option value="16">16</option>
                                            <option value="18">18</option>
                                            <option value="20">20</option>
                                            <option value="24">24</option>
                                            <option value="26">26</option>
                                            <option value="28">28</option>
                                            <option value="36">36</option>
                                            <option value="48">48</option>
                                            <option value="72">72</option>
                                        </select>
                                    </li>
                                    <li>
                                        <select id="fF" title="字体" class="select">
                                            <option value=""></option>
                                            <option value="宋体" selected="selected">宋体</option>
                                            <option value="幼圆">幼圆</option>
                                            <option value="Arial">Arial</option>
                                        </select>
                                    </li>
                                </ul>
                            </div>
                            <div id="linkDiv" style="display: none;">
                                链接地址<br />
                                <input type="text" id="linkAddress" value="http://" class="input" /><br />
                                <br />
                                显示的文本<br />
                                <input type="text" id="linkText" class="input" /><br />
                                <br />
                                <input type="button" value="插入" onclick="sureLink()" />&nbsp;&nbsp;<input type="button"
                                    value="取消" onclick="linkDialog('none', 'none')" />
                                <span id='tip' style="color: Red"></span>
                            </div>
                            <div id="tableDiv" style="display: none;">
                                <div>
                                    行数&nbsp;&nbsp;<select id="rs">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>&nbsp;&nbsp;&nbsp;&nbsp; 列数&nbsp;&nbsp;<select id="cs">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select><br />
                                    <br />
                                    <input type="button" value="确定" onclick="sureTable()" />&nbsp;&nbsp;<input type="button"
                                        value="取消" onclick="tableDialog('none', 'none')" />
                                </div>
                            </div>
                            <div id="fcSel" class="colorSel">
                                <a href="#" id="fcBck" title="黑色" style="background-color:Black;"></a><a href="#"
                                    id="fcRed" title="红色" style="background-color:red;"></a><a href="#" id="fcBle" title="蓝色"
                                        style="background-color:blue;"></a><a href="#" id="fcGre" title="绿色" style="background-color:green;">
                                        </a><a href="#" id="fcYel" title="黄色" style="background-color:yellow;">
                                </a><a href="#" id="fcGry" title="灰色" style="background-color:gray;"></a><a href="#"
                                    id="fcPpl" title="紫色" style="background-color:purple;"></a><a href="#" id="fcOve"
                                        title="橄榄色" style="background-color:Olive;"></a><a href="#" id="fcSlr" title="银灰色"
                                            style="background-color:Silver;"></a>
                            </div>
                            <div id="bcSel" class="colorSel">
                                <a href="#" id="bcBck" title="黑色" style="background-color:black;"></a><a href="#"
                                    id="bcRed" title="红色" style="background-color:red;"></a><a href="#" id="bcBle" title="蓝色"
                                        style="background-color:blue;"></a><a href="#" id="bcGre" title="绿色" style="background-color:green;">
                                        </a><a href="#" id="bcYel" title="黄色" style="background-color:yellow;">
                                </a><a href="#" id="bcGry" title="灰色" style="background-color:gray;"></a><a href="#"
                                    id="bcPpl" title="紫色" style="background-color:purple;"></a><a href="#" id="bcOve"
                                        title="橄榄色" style="background-color:Olive;"></a><a href="#" id="bcSlr" title="银灰色"
                                            style="background-color:Silver;"></a><a href="#" id="bcWht" title="白色" style="background-color:White;">
                                            </a>
                            </div>
                        </div>
		            </div>
                    <div class="edit_div" id="edit_box" contentEditable="false">
                    </div>
	            </div>
            </div>
            <div>
                <label class="checkbox" >
                <input type="checkbox" id="show_at_home" /> 是否允许在首页上显示</label>
                <button onclick="commitContent();return false;">提交</button>
            </div>
            <% }
               else if(isIdenUser)
               { %>
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
        function chageSuperContentType() {
            var typeid = document.getElementById("super_content_type").value;
            htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
                async: false,
                data: { "code": "get_content_type",
                    "super_content_typeId": typeid
                }
            });
            var oTypeSelect = document.getElementById("content_type");
            var dataRes = $.parseJSON(htmlobj.responseText); ;
            if (dataRes.status == 'success') {
                var value = dataRes.msg;
                oTypeSelect.innerHTML = decode64(value);
            } else {
            ;
            }
    }
    function commitContent() {
        var contenttmp = document.getElementById('edit_box').innerHTML;
        var titletmp = document.getElementById('article_title').value;
        if (titletmp=='') {
            alert('标题不能为空');
            return;
        }
        if (confirm == '') {
            alert('内容不能为空');
            return;
        }
        var content = encode64(contenttmp);
        var article_title = encode64(titletmp);
        var article_type = document.getElementById('content_type').value;
        var showAtHome = document.getElementById('show_at_home').checked.toString();

        htmlobj = $.ajax({ url: "../Account/AjaxServer.aspx",
            async: false,
            data: { "code": "commit_article",
                "title": article_title,
                "content_type": article_type,
                "show_at_home": showAtHome,
                "content": content
            }
        });
        var dataRes = $.parseJSON(htmlobj.responseText);
        if (dataRes.status == 'success') {
            showSuccessMsg('page_main_content', dataRes.msg);
        } else {
            showErrorMsg('page_main_content', dataRes.msg); 
        }
    }
    </script>

</body>
</html>
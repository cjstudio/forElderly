<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueNeed.aspx.cs" Inherits="FC.Community.IssueNeed" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta charset="utf-8"/>
  <title><%=FC.cjstudio.getConfigValue("MainTitle")%></title>
  <meta name="author" content="CJ_Studio"/>

  <!-- Le styles -->
  <link href="../JqueryUi/assets/css/bootstrap.min.css" rel="stylesheet">
  <link type="text/css" href="../JqueryUi/css/custom-theme/jquery-ui-1.10.0.custom.css" 
        rel="stylesheet" />
  <link type="text/css" href="../JqueryUi/assets/css/font-awesome.min.css" rel="stylesheet" />
  <link type="text/css" href="../Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />

  <link href="../JqueryUi/assets/css/docs.css" rel="stylesheet">
  <link href="../JqueryUi/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
</head>
<body style="width:750px;">
    <div class="container-fluid">

    <% 
        //if (isIdenUser && (user.type&2)!=0 )
        if(true)
        {
            %>

        <div class="row-fluid">
	        <div class="span12">
                <h2>
                    需求发布
                </h2>
	        </div>
        </div>
        <div >
            <table class="table">
	            <thead>
		            <tr>
			            <th></th>
			            <th></th>
			            <th></th>
			            <th></th>
			            <th></th>
		            </tr>
	            </thead>
                    
	            <tbody>
                    <tr><%
                            for (int i = 0; i < elderlys.Count; i++)
                            {
                                FC.cjstudio.Elderly tmp = elderlys[i];
                                if (i % 4 == 0 && i != 0)
                                {
                                    Response.Write("</tr><tr>");
                                }
                                Response.Write("<td><label><input type=\"checkbox\" name=\""+tmp.id+
                                    "\" />" + tmp.name + "(" + tmp.id + ")" + "</label></td>");
                            }
                    %>
                    </tr>
	            </tbody>
            </table>

            <label for="baz[1]">
            <input type="radio" name="quux[2]" id="radio_once" checked="checked" onclick="radioChage(1);"/>一次</label>
            <table class="table">
		        <tr>
			        <th>
                        <label>
                            从： <input class="span2 form_datetime " id="once_start" size="16" type="text"  data-date-format="yyyy-mm-dd hh:ii"
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
			        <th>
                        <label>
                            到：<input class="span2 form_datetime " id="once_end" size="16" type="text"  data-date-format="yyyy-mm-dd hh:ii"
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
                    <td></td>
		        </tr>
            </table>  

            <label for="baz[2]"><input type="radio" name="quux[2]" id="radio_week" onclick="radioChage(2);"/>每周</label>
            <table class="table">
		        <tr>
                    <td>
                        <select disabled="disabled" style="width:auto;" id="week_num">
                            <option value="0">星期日</option>
                            <option value="1">星期一</option>
                            <option value="2">星期二</option>
                            <option value="3">星期三</option>
                            <option value="4">星期四</option>
                            <option value="5">星期五</option>
                            <option value="6">星期六</option>
                        </select>
                    </td>
			        <th>
                        <label>
                         从：<input disabled="disabled" class="span2 form_time " id="week_start" size="16" type="text" data-date-format="hh:ii" 
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
			        <th>
                        <label>
                         到：<input disabled="disabled" class="span2 form_time " id="week_end" size="16" type="text"  data-date-format="hh:ii"
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
                    <td></td>
		        </tr>
            </table>  

            <label for="baz[3]"><input type="radio" name="quux[2]" id="radio_month" onclick="radioChage(3);" />每月</label>
            <table class="table">
		        <tr>
                    <td>
                        <select disabled="disabled" style="width:auto;" id="month_num">
                        <%
                            for (int i = 1; i < 32; i++)
                            {
                                if (i == DateTime.Now.Day)
                                {
                                    Response.Write("<option selected=\"selected\" value=\"" + i + "\">" + i + "</option>"); 
                                }
                                else
                                {
                                    Response.Write("<option value=\"" + i + "\">" + i + "</option>");
                                }
                            } %>
                        </select>
                    </td>
			        <th>
                        <label>
                            从：<input disabled="disabled" class="span2 form_time " id="month_start" size="16" type="text"  data-date-format="hh:ii"
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
			        <th>
                        <label>
                            到：<input disabled="disabled" class="span2 form_time " id="month_end" size="16" type="text"  data-date-format="hh:ii"
                                value="<%=DateTime.Now.Year +"-"+DateTime.Now.Month +"-"+DateTime.Now.Day +" "+DateTime.Now.Hour +":"+DateTime.Now.Minute %>" />
                        </label>
                    </th>
                    <td></td>
		        </tr>
            </table>  
        </div>
        <% 
        }
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
			</h4> <strong>警告!</strong> 访问此页请先登录或者刷新页面.
		</div>
        <% } %>
	</div>

    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/md5.js" type="text/javascript"></script>
    <script src="../Scripts/cjstudio.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
    <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap-datetimepicker.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>

    
<script type="text/javascript">
    var times_type = 1;
    function radioChage(num) {
        //alert(num);
        times_type = num;
        switch (num) {
            case 1: 
                document.getElementById("once_start").removeAttribute("disabled");
                document.getElementById("once_end").removeAttribute("disabled");
                document.getElementById("week_num").disabled = "disabled";
                document.getElementById("week_start").disabled = "disabled";
                document.getElementById("week_end").disabled = "disabled";
                document.getElementById("month_num").disabled = "disabled";
                document.getElementById("month_start").disabled = "disabled";
                document.getElementById("month_end").disabled = "disabled";
                break;
            case 2: 
                document.getElementById("once_start").disabled = "disabled";
                document.getElementById("once_end").disabled = "disabled";
                document.getElementById("week_num").removeAttribute("disabled");
                document.getElementById("week_start").removeAttribute("disabled");
                document.getElementById("week_end").removeAttribute("disabled");
                document.getElementById("month_num").disabled = "disabled";
                document.getElementById("month_start").disabled = "disabled";
                document.getElementById("month_end").disabled = "disabled";
                break;
            case 3:
                document.getElementById("once_start").disabled = "disabled";
                document.getElementById("once_end").disabled = "disabled";
                document.getElementById("week_num").disabled = "disabled";
                document.getElementById("week_start").disabled = "disabled";
                document.getElementById("week_end").disabled = "disabled";
                document.getElementById("month_num").removeAttribute("disabled");
                document.getElementById("month_start").removeAttribute("disabled");
                document.getElementById("month_end").removeAttribute("disabled");
            default:
        }
        document.getElementById("");
    }

    
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        //todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldAjax.aspx.cs" Inherits="FC.TEST.OldAjax" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>原始Ajax</title>
    <script src=src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //为按钮绑定事件。
            $("#AjaxGetHtml").bind("click", { resultType: "html" }, GetData);
            $("#AjaxGetJson").bind("click", { resultType: "json" }, GetData);
        })

        //用原始AJAX获取服务器数据
        function GetData(event) {

            //获取XmlHttpRequest对象
            var xmlhttp = new GetAjaxXmlHttpRequest();

            //每当 readyState 改变时，就会触发 onreadystatechange 事件
            //在 onreadystatechange 事件中，我们规定当服务器响应已做好被处理的准备时所执行的任务。
            xmlhttp.onreadystatechange = function () {
                //请求已完成，且响应已就绪 
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    $("#oldAjaxResult").html(xmlhttp.responseText);
                }

            }

            //设子请求的URL，添加Math.random()避免得到缓存的结果
            var url = "Data/GetCity.aspx?resultType=" + event.data.resultType.toString() + "&t=" + Math.random();

            //规定请求的类型、URL 以及是否异步处理请求。
            xmlhttp.open("GET", url, true);

            //将请求发送到服务器
            xmlhttp.send();
        };


        //跨浏览器获取XmlHttpRequest对象
        function GetAjaxXmlHttpRequest() {

            var xmlhttp;
            try {
                if (window.XMLHttpRequest) {
                    //for for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {
                    //for IE5,6
                    xmlhttp = new ActiveXObject("Microsoft.XmlHttp");
                }

            } catch (e) {
                alert("您的浏览器不支持AJAX！");
                return false;

            }

            return xmlhttp;

        }

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <input id="AjaxGetHtml" type="button" value="AjaxGetHtml" />
        <input id="AjaxGetJson" type="button" value="AjaxGetJson" />
        <div id="oldAjaxResult"></div>
    </div>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestAjax2.aspx.cs" Inherits="FC.TEST.TestAjax2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css"/>

</head>
<body>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function () {
            //为各个按钮绑定事件
            //$("#TestLoad-Get").bind("click", LoadGet);
            $("#TestLoad-Post").bind("click", LoadPost);
            //$("#TestLoad-Callback").bind("click", LoadCallback);
            //$("#TestLoad-Filter").bind("click", LoadFilter);
        });

        //测试load，以Get方式请求
        //加时间戳(new Date()).getTime()，防止返回缓存内容 
        function LoadGet(event) {
            $("#result").load("TestAjax.aspx?param=TestLoad-Get&t=" + (new Date()).getTime());
        }

        //测试load，以Post方式请求，注意：默认使用 GET 方式 - 传递附加参数时自动转换为 POST 方式
        function LoadPost(event) {
            $("#result").load("TestAjax.aspx", { "param": "TestLoad-Post", "data": "fuck you" });
        }

        //测试load，使用回调函数
        //注意：load()方法提供了回调函数（callback），该函数有三个参数，分别代表请求返回的内容、请求状态和XMLHttpRequest对象
        function LoadCallback(event) {

            $("#result").load("TestAjax.aspx", { "param": "TestLoad-Callback" }, function (responseText, textStatus, XMLHttpRequest) {

                $("#result").html("回调函数在起作用,结果：" + responseText);

            });
        }

        //测试load，使用选择器
        function LoadFilter(event) {
            $("#result").load("TestAjax.aspx?resultType=html&t=" + (new Date()).getTime() + " ul>li:not(:contains('天津'))");

        }     
        
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="TestLoad-Get" type="button" value="Load-Get方式" />
        <input id="TestLoad-Post" type="button" value="Load-Post方式" />
        <input id="TestLoad-Callback" type="button" value="Load-回调函数" />
        <input id="TestLoad-Filter" type="button" value="Load-过滤结果" />
           
        <div id="result">
        </div>
    </div>
    </form>
</body>
</html>


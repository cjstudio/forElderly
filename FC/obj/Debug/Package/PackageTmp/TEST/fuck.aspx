<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fuck.aspx.cs" Inherits="FC.TEST.fuck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
asdlfk;alsdkn
<input id='input' type ="text" />
<%
    Response.Write(System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes("你好")));
    ;
    string s = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String("5L2g5aW9"));
    Response.Write(s); %>
<button onclick="click123();return false;">Hero</button>
<input id='output' type ="text" />
    </div>
    </form>
    <script src="../Scripts/cjstudio.js" type="text/javascript"></script>
    <script type="text/javascript">
        function click123() {
            var s = document.getElementById('input').value;
            alert(s);
            s = encode64((s));
            alert(s);
            document.getElementById('output').value = ((s));
            alert('Hero');
        }
    </script>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicInformation.aspx.cs" Inherits="FC.Account.BasicInformation" %>

<!DOCTYPE html>
<html lang="zh-cn">
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

<body algin="center">
<script type="text/javascript">
    var is_changed = false;
</script>
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
                    <%if (isIdenUser && isDataOver)
                      { %>
					<div class="row-fluid">
                        <form id="form1" runat="server" enctype="multipart/form-data">
                            <asp:Button ID="Button1" class="btn" runat="server" Text="保存" OnClick="Button1_Click" />
						    <div align="left" style="padding-left:30px;font-color:red;" >
                                <asp:Label ID="Label1" runat="server" Text="" Style="color: Red"></asp:Label>
			                    <img alt="280x280" src="userPic/Default.jpg" class="img-rounded" />
                                <input type="file" name="file" />
                                <p ><label>姓名：</label><asp:TextBox runat="server" ID="username" type="text" value="Hero"/></p>
                                <p ><label>联系地址</label><input type="text" value="Hero"/></p>
                                <p ><label>联系地址</label><input type="text" value="Hero"/></p>
                                <p ><label>联系地址</label><input type="text" value="Hero"/></p>
                            </div>
                        </form>

					</div>
                    <%} %>
				</div>
			</div>
		</div>
	</div>




  <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>  
  <script src="../Scripts/md5.js" type="text/javascript"></script>  
  <script src="../Scripts/Login.js" type = "text/javascript"></script>
  <script src="../JqueryUi/assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/docs.js" type="text/javascript"></script>
  <script src="../JqueryUi/assets/js/demo.js" type="text/javascript"></script>
</body>
</html>

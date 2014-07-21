<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxUploadClient.aspx.cs" Inherits="FC.TEST.AjaxUploadClient" %>


<!DOCTYPE HTML>

<html lang="en">
<head>
<meta charset="utf-8">

</head>
<body>

<div class="container">
	<td><input id="fileToUpload" type="file" size="45" name="fileToUpload" class="input"></td>	
    <button class="button" id="buttonUpload" onclick="return ajaxFileUpload();">Upload</button> 
    <div id="loading"></div>
</div>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="ajaxfileupload.js"></script>
<script type="text/javascript">
    function ajaxFileUpload() {
        var oodiv = document.getElementById("fileToUpload");
        //alert(oodiv.value);
        //starting setting some animation when the ajax starts and completes
        $("#loading")
		.ajaxStart(function () {
		    $(this).show(); 
		})
		.ajaxComplete(function () {
		    $(this).hide(); 
		});
        
        $.ajaxFileUpload
		(
			{
			    url: 'AjaxUploadServer.aspx',
			    secureuri: false,
			    fileElementId: 'fileToUpload',
			    dataType: 'json',
                data:{"code":"fuuuuuck"},
			    success: function (data, status) {
			        if (typeof (data.error) != 'undefined') {
			            if (data.error != '') {
			                alert(data.error);
			            } else {
			                alert(data.msg);
			            }
			        }
			    },
			    error: function (data, status, e) {
			        alert(e);
			    }
			}
		)
        return false;
    }  
</script>
</body> 
</html>

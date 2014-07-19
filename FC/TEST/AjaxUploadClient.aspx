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

        /*
        prepareing ajax file upload
        url: the url of script file handling the uploaded files
        fileElementId: the file type of input element id and it will be the index of  $_FILES Array()
        dataType: it support json, xml
        secureuri:use secure protocolG:\code\ASP.Net\FC\FC\TEST\AjaxUploadServer.aspx.cs
        success: call back function when the ajax complete
        error: callback function when the ajax failed
			
        */
        $.ajaxFileUpload
		(
			{
			    url: 'AjaxUploadServer.aspx',
			    secureuri: false,
			    fileElementId: 'fileToUpload',
			    dataType: 'json',
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

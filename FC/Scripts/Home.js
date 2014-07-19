function LoadPost(event) {
    var username = document.getElementById("username").value.toString();
    var passwordold = document.getElementById("password").value.toString();
    var password = passwordold;
    if (password.length != 32) {
        password = hex_md5(passwordold).toLocaleLowerCase();
    }
    var member = document.getElementById("member").checked.toString();
    var oDiv = document.getElementById("login_commit_result");
    htmlobj = $.ajax({ url: "./Account/Login.aspx",
        async: false,
        data: { "username": username, "password": password, "member": member }
    });
    var dataRes = $.parseJSON(htmlobj.responseText);
    if (dataRes.status == "Success") {
        LoginSuccess(oDiv, dataRes);
    } else if (dataRes.status == "Error") {
        oDiv.innerHTML =
                                    '<div class="alert alert-danger" role="alert">' + dataRes.msg + '</div>';
    } else {
        oDiv.innerHTML =
                                    '<div class="alert alert-warning" role="alert">' + dataRes.msg + '</div>';
    }
}

function LoginSuccess(oDiv, dataRes) {
    oDiv.innerHTML =
                                    '<div class="alert alert-success" role="alert">登陆成功</div>';
    var oDivloginSignup = document.getElementById("login_signup_div");
    var oBtn = $("#commit_login_div");
    oBtn.html('<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>');
    oDivloginSignup.innerHTML = '<div class="btn-group">' +
                                '<button class="btn ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">' + dataRes.username +
                                '</span></button> <button data-toggle="dropdown" class="btn dropdown-toggle ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">' +
                                '<span class="caret"></span></span></button>' +
				                '<ul class="dropdown-menu">' +
                                '<li><a href="<%=getTypePath()%>">个人信息</a></li>' +
					            '<li><a href="#">设置栏目</a></li>' +
					            '<li><a href="#">更多设置</a></li>' +
					            '<li class="divider"></li>' +
					            '<li><a onclick="exitLogin();">安全退出</a></li>' +
					            '</ul></div>';
    location.replace(location.href);

}

function exitLogin() {
    clearCookie();
    location.replace(location.href);
}

function clearCookie() {
    var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
    if (keys) {
        for (var i = keys.length; i--; )
            document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
    }
}


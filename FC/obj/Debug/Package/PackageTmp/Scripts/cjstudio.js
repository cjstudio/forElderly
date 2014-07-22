
function checkUserInput(str) {
    var bases = new Array();
    bases[0] = ' ';
    bases[1] = '\'';
    bases[2] = '"';
    bases[3] = '<';
    bases[4] = '>';
    bases[4] = '-';
    for (var i = 0; i < bases.length; i++) {
        if (str.indexOf(bases[i]) >= 0) {
            return false;
        }
    }
    return true;
}

function chageIframeContent(IframeDivId,IframeSrc) {
    var mainContentDiv = document.getElementById(IframeDivId);
    var divWidth = document.all.main_content.offsetWidth;

    mainContentDiv.innerHTML = '<iframe src="' + IframeSrc + '"  scrolling="no" frameborder="0" height="100%" id="content_iframe" width="100%" onload="IFrameReSize(\'content_iframe\');IFrameReSizeWidth(\'content_iframe\');"></iframe>';
    var divIframe = document.getElementById("content_iframe");
    divIframe.offsetWidth;
}

function showErrorMsg(DivId, msg) {
    document.getElementById(DivId).innerHTML = '<div class="alert alert-error">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>警告!</strong> ' +msg+
								 '</div>';
}

function showSuccessMsg(DivId, msg) {
    document.getElementById(DivId).innerHTML = '<div class="alert alert-success">' +
								 '<button type="button" class="close" data-dismiss="alert">×</button>' +
								 '<h4>' +
								 '提示!' +
								 '</h4> <strong>成功!</strong> ' + msg +
								 '</div>';
}

function IFrameReSize(iframename) {
    var pTar = document.getElementById(iframename);
    if (pTar) { //ff
        if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
            pTar.height = pTar.contentDocument.body.offsetHeight;
        } //ie
        else if (pTar.Document && pTar.Document.body.scrollHeight) {
            pTar.height = pTar.Document.body.scrollHeight;
        }
    }
}

//iframe宽度自适应

function IFrameReSizeWidth(iframename) {
    var pTar = document.getElementById(iframename);
    if (pTar) { //ff
        if (pTar.contentDocument && pTar.contentDocument.body.offsetWidth) {
            pTar.width = pTar.contentDocument.body.offsetWidth;
        } //ie
        else if (pTar.Document && pTar.Document.body.scrollWidth) {
            pTar.width = pTar.Document.body.scrollWidth;
        }
    }
}


function autoIframeSize(iframename) {
    IFrameReSizeWidth(iframename);
    IFrameReSize(iframename);
}


function clickChanged(ContentPath) {
    var mainContentDiv = document.getElementById("main_content");
    var divWidth = document.all.main_content.offsetWidth;

    mainContentDiv.innerHTML = '<iframe src="' + ContentPath + '"  scrolling="no" frameborder="0" height="100%" id="content_iframe" width="100%" onload="IFrameReSize(\'content_iframe\');IFrameReSizeWidth(\'content_iframe\');"></iframe>';
    var divIframe = document.getElementById("content_iframe");
    divIframe.offsetWidth;
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
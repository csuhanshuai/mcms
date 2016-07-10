var ANDROID_DOWNLOAD_URL = "/touch/agent";
var ANDROID_OPEN_URL = "/touch/agent";
var openApp_header_hide = true;

function open_or_download_app() {
    if (navigator.userAgent.match(/(iPhone|iPod|iPad);?/i)) {
    	$("#openApp_header").hide();
    } else if (navigator.userAgent.match(/android/i)) {
    	onpen_or_download(ANDROID_DOWNLOAD_URL,ANDROID_OPEN_URL);
    }else{
    	onpen_or_download(ANDROID_DOWNLOAD_URL,ANDROID_OPEN_URL);
    }
}

$(document).ready(function(){
	var strCookie = document.cookie;
	var arrCookie=strCookie.split("; ");
	for(var i=0;i<arrCookie.length;i++){
        var arr=arrCookie[i].split("=");
        if("openApp_header_hide"==arr[0]){
        	openApp_header_hide=arr[1];
               break;
        }
	}
	 if(openApp_header_hide!="false"&&openApp_header_hide&&navigator.userAgent.match(/android/i)){
         $("#openApp_header").show();
	 }
	$("#close").click(function(){
		$("#openApp_header").hide();
		document.cookie="openApp_header_hide = false";
	});
});

function onpen_or_download(downloadUrl,openUrl){
	var loadDateTime = new Date();
    window.setTimeout(function() {
        var timeOutDateTime = new Date();
        if (timeOutDateTime - loadDateTime < 5000) {
            window.location = downloadUrl;
        } else {
            window.close();
        }
    },
    25);
  window.location = openUrl;
}
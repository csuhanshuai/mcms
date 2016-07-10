function goBack(from) {
	var url = getBackUrl(from);
	url =  url.replace(eval("/@38@/g"),"&");
    location.href = url;
}

function getCurrentUrl(){
	var referrer =  document.location.href;
	if(referrer.indexOf("&") != -1)
    	referrer = referrer.replace(eval("/&/g"),"@38@");
	return referrer;
}

function getBackUrl(from){
	
	var referrer =  document.referrer;
	if(from == null || from == ""){
		referrer = document.referrer;
	}else if(from == "topFrame"){
		referrer = window.top.frames["mbdif"].document.location.href;
	}
	
    if (!referrer) {
        try {
            if (window.opener) {
                referrer = window.opener.location.href;
            }
        }
        catch (e) {}
    }
    
    if(referrer.indexOf("&") != -1)
    	referrer = referrer.replace(eval("/&/g"),"@38@");
    return referrer;
}

function getThickBoxUrl(){
	
	var referrer = window.top.frames["content"].document.location.href;
	if (!referrer) {
        try {
            if (window.opener) {
                referrer = window.opener.location.href;
            }
        }
        catch (e) {}
    }
	
	 if(referrer.indexOf("&") != -1)
	    	referrer = referrer.replace(eval("/&/g"),"@38@");
    return referrer;
}

function formatBackUrl(url){
	if(url.indexOf("@38@") != -1)
		url =  url.replace(eval("/@38@/g"),"&");
	
	return url;
}
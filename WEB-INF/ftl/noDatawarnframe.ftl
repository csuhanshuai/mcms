<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />
<#assign spring=JspTaglibs["/WEB-INF/tlds/spring.tld"]/>
<title>网络营销系统-信息提示</title>
</head>

<body>

<div class="warnFrm" style="margin:0px auto;text-align:center;vertical-align: middle;">
  <div class="warnFrmTop"><span>温馨提示您：</span>
  <a href="${returnUrl?default('mbdif')}" class="close">close</a></div>
  <div class="warnFrmCenter">
      <span>
      	<!--<@spring.message code="${warnMessagekey?default('system.error')}" /><br/>-->
      	${errorMsg?default('system.error')}
      </span>
  </div>
  <div class="warnFrmBt">
  	<#if returnUrl?? && (returnUrl != "-1") && ( (returnUrl?index_of('?parentSourcePage') > 0) || (returnUrl?index_of('&parentSourcePage') > 0)  )>
  		<a href="${returnUrl?default('')}" target="${target?default('content')}">确定</a>
  	<#elseif !returnUrl?? || (returnUrl == "-1") >
  		<a href="#" onclick="window.history.go(-1);" target="${target?default('content')}">确定</a>
  	<#else>
  		<a href="${returnUrl?default('')?replace("@38@",'&')}" target="${target?default('content')}">确定</a>
  	</#if>
  	
  </div>
 </div>
		 
</body>
</html>

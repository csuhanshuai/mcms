<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健坤商城_500错误</title>
<meta name="description" content="健坤商城"/>
<meta name="keywords"  content="健坤商城"/>

<#include "include.ftl">

<script>
var i = 5;
var intervalid;
function reload() {
	if (i == 0){
		window.location.href = "/";
		clearInterval(intervalid);
	}
	i--;
}
intervalid = setInterval("reload()", 1000);
</script>

</head>
<body>

<!-- 头部start -->
<#include "../webtemplate/header.ftl" >
<!-- 头部end -->

<div class="blank15"></div>
<div class="w960 hbox">
	<div class="erropage500"><h3>服务器异常，正在抢修，马上回来... ...</h3>
	</div>

</div>
<div class="blank20"></div>
<div class="blank20"></div>

<!-- 底部start -->
<#include "../webtemplate/footer.ftl" />
<!-- 底部end -->
</body>
</html>
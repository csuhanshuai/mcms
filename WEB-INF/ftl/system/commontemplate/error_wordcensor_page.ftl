<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健坤商城_非法字符</title>
<meta name="description" content="健坤商城"/>
<meta name="keywords"  content="健坤商城"/>

<#include "include.ftl">

</head>
<body>
<!-- 头部start -->
<#include "../webtemplate/header.ftl" >
<!-- 头部end -->
<div class="w960">
	<p class="curLct">您当前位置：首页 >  登录健坤商城商城</p>
    	<div class="blank8"></div>
        <div class="erropage404_x erropage404">
        	<div class="erropage404_dt">
                <div>
                	<span style="color:red">提交失败   , 提交信息包含如下非法字符:</span>
                	<span><font size="+2">${wordcensor?default('')}</font></span>
                	<span><a class="Blue" href="/">进入商城首页</a>
                	<a class="Blue"  onclick="window.history.go(-1);"  href="#">返回上一页</a></span>
                </div>
            </div>
        </div>
</div>
<p class="blank8"></p>
<!-- 底部start -->
<#include "../webtemplate/footer.ftl" />
<!-- 底部end -->
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信公众平台管理系统</title>
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

</head>

<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
        <div class="r_nav">
    <ul>
	<li class="cur"><a href="${BasePath}/cardManage/queryConfigList.kq">刮刮卡</a></li>
	<li><a href="${BasePath}/cardManage/queryPrizeConfigList.kq">奖项管理</a></li>
	<li><a href="${BasePath}/zj/getActivities.kq?type=3">兑奖管理</a></li>
	
	
   </ul>
</div>


<div id="url" class="r_con_wrap">
	<form action="${BasePath}/cardManage/updateConfig.kq" name="qcust" id="qcust" enctype="multipart/form-data" method="post">
	<input type="hidden" name="type" value="${config.type}"/>
	<input type="hidden" name="id" value="${config.id}"/>
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
                <td>配置项 </td>
            	<td>${config.illustrate}</td>
            </tr>
            <tr>
                <td>配置类型</td>
            	
                <td><#if config.type==1>图片</#if><#if config.type==2>文字</#if> </td>
            </tr>
            <tr>
             <td>修改配置</td>
             <td>
	            <#if config.type==1>
					<img src="${BasePath}${config.info}" />
					</br>
					<input name="file"  id="imgbut" type="file"/>
					<input type="hidden" name="info" value=""/>
				</#if>
				<#if config.type==2>
					<textarea name="info" rows="5" cols="100">${config.info}</textarea>
					<div style="display:none"><input name="file"  id="imgbut" type="file"/></div>
				</#if>
	          </td>  
	        </tr>
            
	        <tr>
		        <td></td>
	            <td>
		            <input type="button" class="btn_green" value="提交" name="submit_btn"  id="submit_btn"/>
		        </td>  
	        </tr>
        </table>
    </form>
   
</body>
</html>
<script type="text/javascript" >

$(document).ready(function() {

	$("#submit_btn").click(function(){	 		
	document.getElementById("qcust").submit();	 			 
	});

});
	

</script>
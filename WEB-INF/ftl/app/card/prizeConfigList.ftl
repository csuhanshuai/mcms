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
	
	<li><a href="${BasePath}/cardManage/queryConfigList.kq">刮刮卡</a></li>
	<li class="cur"><a href="${BasePath}/cardManage/queryPrizeConfigList.kq">奖项管理</a></li>
	<li><a href="${BasePath}/zj/getActivities.kq?type=3">兑奖管理</a></li>
	
   </ul>
</div>


<div id="url" class="r_con_wrap">
<form action="${BasePath}/cardManage/toAddPrizeConfig.kq" name="qcust" id="qcust" method="post">
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
            
         <td>
						<input type="button" class="btn_green" value="增加奖项" name="submit_btn"  id="submit_btn">
				</td>
            </tr>
        </table>
    </form>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
        <thead>
            <tr>
                <td width="5%" nowrap="nowrap">序号</td>
                <td width="10%" nowrap="nowrap">奖项名</td>
                <td width="10%" nowrap="nowrap">奖品名称</td>
                <td width="10%" nowrap="nowrap">奖品个数</td>
                <td width="10%" nowrap="nowrap">中奖机率</td>
                <td width="10%" nowrap="nowrap">图片</td>
                <td width="10%" nowrap="nowrap">操作</td>

		            
            </tr>
        </thead>
        <tbody>
                    
        <#if list??>
	      		<#list list as item>		
	      		<tr id='Tr${item.id}'>
					 <td>${item_index+1}</td>
					 <td>${item.name?default("")}</td>
					 <td>
					 	<#if giftlist?? && (giftlist?size>0) >
	      						<#list giftlist as gift>
	      							<#if item.giftid?? && item.giftid==gift.id>
	      								${gift.name?default("")}
	      							<#else>
	      								--
	      							</#if>
	      						</#list>
	      						<#else>
	      							--
	      						</#if>
					 </td>
					 <td>${item.number?default(0)}</td>
					 <td>${item.v}%</td>
					 <td> <img width="40" height="30" src="${BasePath}${item.path?default("")}" /> </td>
					 <td><a href="${BasePath}/cardManage/queryPrizeConfig.kq?id=${item.id}">
					 <img src="${BasePath}/images/icon/mod.gif" align="absmiddle" alt="修改">
					 </a></td>
					                   
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="4"><div class="yt-tb-list-no">暂无内容</div></td></tr>
		</#if>
                   
                </tbody>
    </table>
    <div class="blank20"></div>


</body>
</html>
<script type="text/javascript" >

$(document).ready(function() {

	$("#submit_btn").click(function(){	 		
	document.getElementById("qcust").submit();	 			 
	});
	
});


</script>
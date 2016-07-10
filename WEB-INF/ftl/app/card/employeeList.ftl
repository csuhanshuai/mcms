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
	<li><a href="${BasePath}/cardManage/queryPrizeConfigList.kq">奖项管理</a></li>
	<li class="cur"><a href="${BasePath}/zj/getActivities.kq?type=3">兑奖管理</a></li>
	
	
   </ul>
</div>


<div id="url" class="r_con_wrap">
	<form action="${BasePath}/cardManage/queryEmployeeList.kq" name="qcust" id="qcust" method="post">
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
            
                <td>姓名 <input type="text" name="name" value="${employee.name?default("")}" size="25" class="form_input" notnull /></td>
                <td>电话 <input type="text" name="mobilephone" value="${employee.mobilephone?default("")}" size="25" class="form_input" notnull /></td>
                <td>
		<input type="button" class="btn_green" value="查询" name="submit_btn"  id="submit_btn">
		<input type="button" class="btn_green" value="导出Excel" name="toExcel_btn"  id="toExcel_btn">

		
		</td>
            </tr>
        </table>
    </form>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
        <thead>
            <tr>
                <td width="5%" nowrap="nowrap">序号</td>
                <td width="10%" nowrap="nowrap">姓名</td>
		        <td width="10%" nowrap="nowrap">联系电话</td>
		        <td width="10%" nowrap="nowrap">奖品</td> 
		        <td width="10%" nowrap="nowrap">是否已兑奖</td>		            
            </tr>
        </thead>
        <tbody>
                    
    <#if pageFinder?? && (pageFinder.data)?? >
	      		<#list pageFinder.result as item>		
	      		<tr id='Tr${item.id}'>
					 <td>${item_index+1}</td>
					 <td>${item.name?default("")}</td>
		             <td>${item.mobilephone?default("")} </td>
					 <td>${item.prizename?default("")} </td>
					 <td><#if item.isprizes==1>已兑奖</#if><#if item.isprizes==0>未兑奖</#if></td>
					                   
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="5"><div class="yt-tb-list-no">暂无内容</div></td></tr>
		</#if>
                   
                </tbody>
    </table>
    <div class="blank20"></div>
<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="qcust" />
<form action="${BasePath}/cardManage/toExcel.kq"   id="toExcel" method="post">
</form>

</body>
</html>
<script type="text/javascript" >

$(document).ready(function() {

	$("#submit_btn").click(function(){	 		
	var obj = {  name : '', mobilePhone : ''  };
	document.getElementById("qcust").submit();	 			 
	})
	
	$("#toExcel_btn").click(function(){	 		
	var form = document.getElementById("toExcel");
	 form.submit();			 
	})
	
	$("#award_btn").click(function(){	 		
	document.getElementById("qcust").action="${BasePath}/gqftManage/award.kq"
	document.getElementById("qcust").submit();	 			 
	})

   });
   
	// 发达ajax请求
	function ajaxRequest(url, reqParam, callback) {
	 $.ajax({ 
			type : 'POST',
			url : url,
			data : reqParam,
			cache : true,
			success : callback
		});
	}
	

</script>
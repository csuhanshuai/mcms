<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var BasePath="${BasePath}";
	
</script>

<title>微信公众平台管理系统</title>

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>
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
	<li>库存积压分析</li>
	
   </ul>
</div>


<div id="url" class="r_con_wrap">

    
    
    <div style="height:10px;"> </div>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
        <thead>
            <tr>
                <td width="5%" nowrap="nowrap">序号</td>
                <td width="10%" nowrap="nowrap">年份</td>
		        <td width="10%" nowrap="nowrap">月份</td>
		        <td width="10%" nowrap="nowrap">状态</td> 
		        <td width="10%" nowrap="nowrap">操作</td>
            </tr>
        </thead>
        <tbody>
        <#if pageFinder?? && (pageFinder.data)?? >
	      	<#list pageFinder.result as item>		
	 			<tr id=''>
	 				 <input type="hidden" >
					 <td>${item_index+1}</td>
					 <td>${item.year?default("")}</td>
					 <td>${item.month?default("")}</td>
					 <td>${item.status?default("")}</td>
					
					
					 <td align="center">
						<a href="javascript:getmaterialDetail('${item.id}');"><img src="${BasePath}/images/material/detail.png"></a>
						<a href=""><img src="${BasePath}/images/material/update.png"></a>
					</td>  
                </tr>
		     </#list>	
		<#else>
		     <tr><td colspan="8"><div class="yt-tb-list-no">暂无内容</div></td></tr>
	    </#if>
	     </tbody>
    </table>
    <div class="blank20"></div>
 <!-- 翻页标签 -->  
</body>
<script>

  function getmaterialDetail(id){
		showThickBox("审核信息明细",BasePath+"/material/queryMaterialMonthById/"+id+".kq?TB_iframe=true&height=550&width=750",false);
	}
	
	function getmaterialupdate(id){
		showThickBox("审核信息明细",BasePath+"/material/queryMaterialMonthById/"+id+".kq?TB_iframe=true&height=550&width=750",false);
	}
  
</script>
</html>

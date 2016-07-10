
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="物料消耗管理系统系统">
<meta name="description" content="">
<meta name="keywords" content="">
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<title>物料消耗管理系统</title>

<#include "base.ftl">
<style>
.demo1 {
margin-left: -10px;
margin-top: 15px;
border-left: 0px solid #DDDDDD;
position: fixed;
word-wrap: break-word;
overflow:hidden;
}


.icon{ width:22px; height:22px; display:inline-block; background:url(${BasePath}/css/images/icon.png) no-repeat; vertical-align:middle;}
.icon-1{ background-position:-1px -3px;}
.icon-2{ background-position:-1px -48px;}
.icon-3{ background-position:-1px -94px;}
.icon-4{ background-position:0 -136px;}
.icon-5{ background-position:0 -199px;}
.icon-6{ background-position:0 -250px;}
.icon-7{ background-position:0 -314px;}
</style>
<script type='text/javascript' >
	window.onload=function(){
		//var myContent=document.getElementById('myContent');
		//	myContent.style.height=(document.documentElement.clientHeight-10)+"px";
		//document.getElementById("content").style.height=(document.documentElement.clientHeight-60)+"px";
		//document.getElementById("content").style.width=(document.documentElement.clientWidth-200)+"px";
		
		$("#myContent a").each(function(){
			$(this).css("text-decoration","none");
		});
		document.getElementById("iClick").click();
		document.getElementById("estRows").style.display="";
	}
</script>

</head>

<body style="cursor: auto;overflow:hidden;" class="edit">
<#include "navigator.ftl">
			  <div class="sidebar-nav">
				  <#list login_system_user_resources as item>
				      <#if item.isleaf=='0'&&item.id??&&item.id!=""&&item.menuName!="组织结构"&&item.menuName!="关键字过滤">
				      <ul class="nav nav-list accordion-group">
				          <li class="nav-header">
				          <div class="pull-right popover-info">
				        </div>
				          <i class="icon icon-1"></i> ${item.menuName}
				          </li>
				          <li style="display: none;" class="rows" id="estRows">
				               <ul id="menuId">
				                  <#list login_system_user_resources as child>
					                  <#if child.id??&&child.id!=""&&child.menuName!="组织结构"&&child.menuName!="关键字过滤">
						                  <#if child.structure?substring(0,child.structure?last_index_of('-'))==item.structure>
						                  
							                  <li>
							                  	<a href="${BasePath}${child.memuUrl}"  target="content" style="color:#fff">
							                  		<#if "库存管理"=="${child.menuName}">
							                  			<i id="iClick" class="icon icon-2"></i>&nbsp;
							                  		<#elseif "库存导入"=="${child.menuName}">
							                  			<i class="icon icon-5"></i>&nbsp;
							                  		<#elseif "物料查询"=="${child.menuName}">
							                  			<i class="icon icon-3"></i>&nbsp;
							                  		<#elseif "库存对比"=="${child.menuName}">
							                  			<i class="icon icon-6"></i>&nbsp;
							                  		<#elseif "操作日志"=="${child.menuName}">
							                  			<i class="icon icon-4"></i>&nbsp;
							                  		</#if>
							                  		${child.menuName}
							                  	</a>
							                  </li>
							                  
						                  </#if>   
					                  </#if>
				                  </#list>
				              </ul>
				          </li>
				      </ul>   
				      </#if>
				  </#list>
			  </div>
		   	  <iframe id="content" name="content" frameborder="0" class="demo1" width="100%" height="100%" ></iframe>

</body>
</html>
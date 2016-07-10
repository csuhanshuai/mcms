<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信公众平台管理系统</title>
<link href='${BasePath}/css/global.css?t=2013122302' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css?t=2013122302' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js?t=2013122302'></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js?t=2013122302'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

</head>

<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
        <div class="r_nav">
    <ul>
    	<li class="<#if type=='ptMessage'>cur</#if>"><a href="${BasePath}/ptMessage.kq?type=ptMessage">图文消息管理</a></li>
	 <li class="<#if type=='customUrl'>cur</#if>"><a href="${BasePath}/queryLink.kq?type=customUrl">自定义URL管理</a></li>
	 <li class="<#if type=='systemUrl'>cur</#if>"><a href="${BasePath}/querysysLink.kq?type=systemUrl">系统URL查询</a></li>
    
 	<li ><a href="${BasePath}/articleManage/queryProductType.kq">文章分类</a></li>
	<li class="cur"><a href="${BasePath}/articleManage/queryArticles.kq">文章管理</a></li>
   </ul>
</div>


<div id="url" class="r_con_wrap">
	<form action="${BasePath}/articleManage/queryArticles.kq" name="qcust" id="qcust" method="post">
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
                <td>文章标题 <input type="text" name="title" value="${title?default("")}" size="25" class="form_input" notnull /> </td>
                 <td>文章类型
             
                <select name="ctype" id="ctype" >  
                <option value="0" >所有</option>                
                	     <#if list??  >
						    <#list list as ptype>
							<option value="${(ptype.id)}" >${(ptype.typename)}</option>
						    </#list>   
			             </#if>

                </select>
                </td>
                <td><input type="button" class="btn_green" value="查询" name="submit_btn"  id="submit_btn"></td>
                <td><input type="button" class="btn_green" value="新增" name="add_btn"  id="add_btn"></td>
              
            </tr>
        </table>
    </form>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
        <thead>
            <tr>
                <td width="5%" nowrap="nowrap">序号</td>
                <td width="10%" nowrap="nowrap">文章分类</td>
                <td width="10%" nowrap="nowrap">文章标题</td>	
                 <td width="10%" nowrap="nowrap">URL</td>		        
		        <td width="3%" nowrap="nowrap">编辑时间</td>
		        <td width="3%" nowrap="nowrap">操作</td>
                
            </tr>
        </thead>
        <tbody>
                    
    <#if pageFinder?? && (pageFinder.data)?? >
    	<#assign fcount=pageFinder.pageSize*(pageFinder.pageNo-1) />
	      		<#list pageFinder.result as item>	
				<#assign fcount=fcount+1 />
	      		<tr id='Tr${item.id}'>
					 <td>${fcount}</td>
					 
					 <td>
					
						    <#list list as ptype>						    
						     <#if ptype.id== item.type >
						          ${ptype.typename}
						     </#if>
						    </#list>   
			           
					
					 
					 </td>	
					 		 
		             <td>${item.title}</td>
		             <td>${domain+item.url}</td>
		             <td>${item.date}</td>
		             <td><a href="${BasePath}/articleManage/queryArticle.kq?id=${item.id?default("")}" target="content">编辑</a>
		             <a href="${BasePath}/articleManage/delArticle.kq?id=${item.id?default("")}&linkid=${item.systemlinkid?default("")}" target="content" onclick="if(!confirm('删除后不可恢复，请同时删除关联微信图文，否则会导致部分图文无法访问，继续删除吗？')){return false};">删除</a></td>
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="6"><div class="yt-tb-list-no">暂无内容</div></td></tr>
		</#if>
                   
                </tbody>
    </table>
    <div class="blank20"></div>
<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="qcust" />


</body>
</html>
<script type="text/javascript" >

$(document).ready(function() {

	$("#submit_btn").click(function(){	 		
		document.getElementById("qcust").submit();	 			 
	})
	
	$("#add_btn").click(function(){	 		
		location.href = "toAddArticle.kq"; 			 
	})

   });
   $('#ctype').val("${type}");
	
	
</script>
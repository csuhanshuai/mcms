<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/global.js'></script>
<link href='${BasePath}/js/plugin/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/plugin/operamasks/operamasks-ui.min.js'></script>
<!--[if lte IE 9]><script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />
<script src="${BasePath}/js/app/qxmall/producttype.js"></script>
<script src="${BasePath}/js/app/qxmall/qxmall.js"></script>
</head>

<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
<div class="r_nav">
    <ul>
	<li><a href="${BasePath}/ptMessage.kq?type=ptMessage">图文消息管理</a></li>
	 <li><a href="${BasePath}/queryLink.kq?type=customUrl">自定义URL管理</a></li>
	 <li ><a href="${BasePath}/querysysLink.kq?type=systemUrl">系统URL查询</a></li>
    
	<li class="cur"><a href="${BasePath}/articleManage/queryProductType.kq">文章分类</a></li>
	<li ><a href="${BasePath}/articleManage/queryArticles.kq">文章管理</a></li>
      </ul>
</div>

<div id="reply_keyword" class="r_con_wrap">
<form action="${BasePath}/articleManage/queryProductType.kq?type=ptypemanage" name="ptypequery" id="ptypequery" method="post">
</form>
<div class="control_btn"><a href="${BasePath}/articleManage/toAddProductType.kq?type=ptypemanage" class="btn_green btn_w_120">添加分类</a></div>
<table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
<thead>
    <tr>
        <td width="10%" nowrap="nowrap">序号</td>
        <td width="25%" nowrap="nowrap">分类名称</td>
        <td width="15%" nowrap="nowrap">添加时间</td>
      
        <td width="10%" nowrap="nowrap" class="last">操作</td>
    </tr>
</thead>
<tbody>
	<#if pageFinder?? && (pageFinder.data)?? >
	<#assign fcount=pageFinder.pageSize*(pageFinder.pageNo-1) />
			  		<#list pageFinder.result as item>
					<#assign fcount=fcount+1 />
			  		<tr>
			  			  <td nowrap="nowrap">
							${fcount}               
						 </td>
						<td nowrap="nowrap">
							${item.typename?default('')}               
						 </td>
						<td nowrap="nowrap">
							${item.addtime?default('')}      
						</td>
					
						    <td class="last" nowrap="nowrap">
							<a href="${BasePath}/articleManage/toupdateProductType.kq?type=ptypemanage&id=${item.id}" ><img src="${BasePath}/images/icon/mod.gif" align="absmiddle" alt="修改" /></a>
							<!--<a href="${BasePath}/articleManage/removeProductType.kq?type=ptypemanage&id=${item.id}" onClick="if(!confirm('删除后不可恢复,继续吗？')){return false};"><img src="${BasePath}/images/icon/del.gif" /></a>-->
						    </td>
					</tr>
			  		</#list>				  	
			  	<#else>
					<tr><td colspan="4"><div class="yt-tb-list-no">暂无内容</div></td></tr>
				</#if>        
    </tbody>
</table>
<div class="blank20"></div>
<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="ptypequery" />
</div>  </div>

</div>  </div>
</body>
</html>
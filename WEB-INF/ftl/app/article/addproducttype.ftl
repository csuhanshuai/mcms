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
<script type='text/javascript' src='${BasePath}/js/wechat.js'></script>
</head>

<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
<div class="r_nav">
    <ul>
     <ul>
	<li class="<#if type=='ptMessage'>cur</#if>"><a href="${BasePath}/ptMessage.kq?type=ptMessage">图文消息管理</a></li>
	 <li class="<#if type=='customUrl'>cur</#if>"><a href="${BasePath}/queryLink.kq?type=customUrl">自定义URL管理</a></li>
	 <li class="<#if type=='systemUrl'>cur</#if>"><a href="${BasePath}/querysysLink.kq?type=systemUrl">系统URL查询</a></li>
    
	<li class="cur"><a href="${BasePath}/articleManage/queryProductType.kq">文章分类</a></li>
	<li ><a href="${BasePath}/articleManage/queryArticles.kq">文章管理</a></li>
      </ul>
    </ul>
</div>
<div id="reply_keyword" class="r_con_wrap">
            <script language="javascript">$(document).ready(wechat_obj.reply_keyword_init);</script>
        <form id="keyword_reply_form" class="r_con_form" method="post" role="form" action="addProductType.kq">
	    <input type="hidden" id="type" name="type" value="${type}"/>
	    <input type="hidden" id="id" name="id" value="${(pt.id)?default("")}"/>
	    <div class="rows">
                <label>分类名称</label>
                <span class="input"> 
		<input id="typename" name="typename" type="text"  value="${(pt.typename)?default("")}"/>
		<div class="tips">分类名称会展示到页面</div></span>
                <div class="clear"></div>
            </div>
            
            <div class="rows">
                <label></label>
                <span class="input">
		
		<input type="submit" class="btn_green" name="submit_button"  value="提交保存" />
		<a href="queryProductType.kq" class="btn_gray">返回</a></span>
                <div class="clear"></div>
            </div>

        </form>
    </div>  </div>
<div>

</body>
</html>
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

<style type="text/css">body, html{background:url(images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
<div class="r_nav">
    <ul>
        <li class="<#if type=='firstAttention'>cur</#if>"><a href="${BasePath}/queryAttentionMsg.kq?type=firstAttention">首次关注设置</a></li>
        <li class="<#if type=='keyReplay'>cur</#if>"><a href="${BasePath}/queryCustomReplay.kq?type=keyReplay">智能回复</a></li>
        <li class="<#if type=='customMenu'>cur</#if>"><a href="${BasePath}/queryMenu.kq">自定义菜单</a></li>
        <li class="<#if type=='binding'>cur</#if>"><a href="${BasePath}/binding.kq">公众账号绑定</a></li>
        <li class="<#if type=='auth'>cur</#if>"><a href="${BasePath}/myweixin.kq?type=auth">授权管理</a></li>
    </ul>
</div>

<script language="javascript">$(document).ready(wechat_obj.set_token_init);</script>
<div id="token" class="r_con_wrap">
            <div class="tips_info">你已成功绑定微信公众平台，绑定信息：</div>
        <div class="r_con_form">
            <div class="rows">
                <label>帐号名称:</label>
                <span class="input"><span class="tips">dlxt688</span></span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label>接口URL:</label>
                <span class="input"><span class="tips">http://www.ptweixin.com/api/c818a62c03/attention/</span></span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label>接口Token:</label>
                <span class="input"><span class="tips">b11974cfe6</span></span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label></label>
                <span class="input"><a href="./?m=wechat&a=set_token&do_action=wechat.token_unbind" class="btn_green" onClick="if(!confirm('确定要解除绑定，继续吗？')){return false};">解除绑定</a></span>
                <div class="clear"></div>
            </div>
        </div>
    </div>  </div>
<div>

</body>
</html>
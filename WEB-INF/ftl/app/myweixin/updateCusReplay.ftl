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
        <li class="<#if type=='binding'>cur</#if>"><a href="${BasePath}/myweixin.kq?type=binding">公众账号绑定</a></li>
        <li class="<#if type=='auth'>cur</#if>"><a href="${BasePath}/myweixin.kq?type=auth">授权管理</a></li>
    </ul>
</div>
<div id="reply_keyword" class="r_con_wrap">
            <script language="javascript">$(document).ready(wechat_obj.reply_keyword_init);</script>
            
        <form id="keyword_reply_form" class="r_con_form" method="post" action="${BasePath}/updateCustomReplay.kq?type=${type}">
            <input type="hidden" value="${cr.id}" name="id">
            <div class="rows">
                <label>关键词</label>
                <span class="input"><textarea name="Keywords" class="keywords"  notnull>${cr.keyword}</textarea><div class="tips">多个关键词，请每行填写一个</div></span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label>匹配模式</label>
                <span class="input">
                    <input type="radio" name="PatternMethod" value="0" <#if cr.patten=="0">checked</#if> />精确匹配<span class="tips">（用户输入的文字和此关键词一样才会触发）</span><br />
                    <input type="radio" name="PatternMethod" value="1"  <#if cr.patten=="1">checked</#if> />模糊匹配<span class="tips">（只要用户输入的文字包含此关键词就触）</span><br />
                </span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label>回复类型</label>
                <span class="input"><select name="ReplyMsgType">
                    <option value="1"  <#if cr.type=="1">selected</#if>>文字消息</option>
                    <option value="2"  <#if cr.type=="2">selected</#if>>图文消息</option>
                </select></span>
                <div class="clear"></div>
            </div>
            <div class="rows" id="text_msg_row">
                <label>回复内容</label>
                <span class="input"><textarea name="TextContents">${cr.replay?default('')}</textarea></span>
                <div class="clear"></div>
            </div>
            <div class="rows" id="img_msg_row">
                <label>回复内容</label>
                <span class="input">
                <select name='msgId'>
                <option value=''>--请选择--</option>
                <#if ptList??>
                <#list ptList as item>
                <option value='${item.id}' <#if item.id==cr.msgid>selected</#if> <#if msg??&&msg.msgid==item.id>selected</#if>><#if item.items?size==1>【单图文】<#else>【多图文】</#if>
				
			<#if item.items[0]??>
				${item.items[0].title?default('')}
				<#else>
				此图文已删除请勿使用
				</#if></option>
                </#list>
		</#if>
                </select>
                <a href="${BasePath}/ptMessage.kq?type=ptMessage" class="material">图文消息管理</a>
                </span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label></label>
                <span class="input"><input type="submit" class="btn_green" name="submit_button" value="提交保存" /><a href="?m=wechat&a=reply_keyword" class="btn_gray">返回</a></span>
                <div class="clear"></div>
            </div>

        </form>
    </div>  </div>
<div>

</body>
</html>
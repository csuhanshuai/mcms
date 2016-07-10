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
<script type="text/javascript">
	var BasePath="${BasePath}"; 	
</script>
</head>

<body>

<style type="text/css">body, html{background:url(images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
<div class="r_nav">
    <ul>
        <li ><a href="${BasePath}/queryAttentionMsg.kq?type=firstAttention">首次关注设置</a></li>
        <li><a href="${BasePath}/queryCustomReplay.kq?type=keyReplay">智能回复</a></li>
        <li class="cur"><a href="${BasePath}/queryMenu.kq">自定义菜单</a></li>
        <li><a href="${BasePath}/wxbinding.kq?type=binding">公众账号绑定</a></li>
        <li><a href="${BasePath}/myweixin.kq?type=auth">授权管理</a></li>
    </ul>
</div>

<div id="wechat_menu" class="r_con_wrap">
<script type='text/javascript' src='${BasePath}/js/plugin/dragsort/dragsort-0.5.1.min.js'></script>
<script language="javascript">$(document).ready(wechat_obj.menu_init);</script>
<div class="m_menu">
    <div class="tips_info">
        1. 您的公众平台帐号类型必须升级为<span>服务号</span>。<br />
        2. 升级为服务号后，必须在微信公众平台申请接口使用的<span>AppId</span>和<span>AppSecret</span>，然后在【<a href="./?m=wechat&a=auth">微信授权配置</a>】中设置。<br />
        3. 最多创建<span>3</span>个一级菜单，每个一级菜单下最多可以创建<span>5</span>个二级菜单，菜单最多支持两层。<br />
        4. 拖动树形菜单可以对菜单重排序，但最终只有“<span>发布菜单</span>”后才会生效，公众平台限制了每天的发布次数，请勿频繁操作。<br />
        5. 微信公众平台规定，<span>菜单发布24小时后生效</span>。您也可先取消关注，再重新关注即可马上看到菜单。<br />
        6. 点击“<span>删除菜单</span>”操作只删除微信公众平台上的菜单，并不是删除本系统已经设置好的菜单。
    </div>
    <div class="form">
        <div class="m_lefter">
            <dl>
            <#if fmenus??>
                <#list fmenus as item>
                <dd MId="${item.id}">
                <div class="list ">
                    <a href="${BasePath}/toUpdateMenu.kq?id=${item.id}" title="修改"><img src="${BasePath}/images/icon/mod.gif" align="absmiddle" /></a>
                    <a href="${BasePath}/removeMenu.kq?id=${item.id}" title="删除" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="${BasePath}/images/icon/del.gif" align="absmiddle" /></a>
                ${item.menuname}
                </div>
                <ul>
                    <#if amenus??>
                    <#list amenus as sub>
                        <#if sub.pid==item.id>
                        <li MId="${sub.id}">
                        <div class="title"><img src="${BasePath}/images/icon/jt.gif" /> ${sub.menuname}</div>
                        <div class="opt">
                        <a href="${BasePath}/toUpdateMenu.kq?id=${sub.id}" title="修改"><img src="${BasePath}/images/icon/mod.gif" align="absmiddle" /></a>
                        <a href="${BasePath}/removeMenu.kq?id=${sub.id}" title="删除" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="${BasePath}/images/icon/del.gif" align="absmiddle" /></a>
                        </div>
                        </li>
                        </#if>
                    </#list>
                    </#if>
                    

                    </ul>
                    <div class="blank9"></div>
                </dd>
                </#list>
            </#if>
           
            </dl>
            <div class="publish">
	    <input type="button" class="btn_green" name="publish_btn" value="发布菜单" />
	    <input type="button" class="btn_gray" name="del_btn" value="删除菜单" /></div>            </div>
        <div class="m_righter">
            <form id="wechat_menu_form" class="" action="${BasePath}/addMenu.kq" method="post">
            <input type="hidden" id="id"/>
                <h1>添加菜单</h1>
                <div class="opt_item">
                    <label>菜单名称：</label>
                    <span class="input"><input type="text" id="menuname" name="menuname" value="" class="form_input" size="15" maxlength="15" notnull /> <font class="fc_red">*</font></span>
                    <div class="clear"></div>
                </div>
                        <div class="opt_item">
                        <label>添加到：</label>
                        <span class="input">
                            <select id="pmenu" name="pmenu">
                            <option value="">一级菜单</option>
                            <#list fmenus as mi>
                                <option value="${mi.id}">${mi.menuname}</option>
                            </#list>
                        </select>
                            </span>
                        <div class="clear"></div>
                    </div>
                   <div class="opt_item">
                    <label>消息类型：</label>
                    <span class="input"><select name="replayType">
                        <option value="1" selected>文字消息</option>
                        <option value="2" >图文消息</option>
                        <option value="3" >连接网址</option>
                    </select>
                    </span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item" id="text_msg_row">
                    <label>文字内容：</label>
                    <span class="input"><textarea name="TextContents"></textarea></span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item" id="img_msg_row">
                    <label>图文内容：</label>
                    <span class="input">
                    <select name='msgId'>
                    <option value=''>--请选择--</option>
                    <#if ptList??>
                    <#list ptList as item>
                    <option value='${item.id}' <#if msg??&&msg.msgid==item.id>selected</#if>><#if item.items?size==1>【单图文】<#else>
		    【多图文】</#if>
		    
			    	<#if item.items[0]??>
				${item.items[0].title?default('')}
				<#else>
				此图文已删除请勿使用
				</#if>
		    </option>
                    </#list>
                    </#if>
                    </select><a href="${BasePath}/ptMessage.kq?type=ptMessage">素材管理</a></span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item" id="url_msg_row">
                    <label>链接网址：</label>
                    <span class="input"><input type="text" name="Url" value="" class="form_input" size="35" maxlength="200" /></span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item">
                    <label></label>
                    <span class="input"><input type="submit" class="btn_green btn_w_120" name="submit_button" value="添加菜单" /></span>
                    <div class="clear"></div>
                </div>
                <input type="hidden" name="do_action" value="wechat.menu">
                <input type="hidden" name="MId" value="0">
                <input type="hidden" name="ajax" value="1">
            </form>
        </div>
        
       
        <div class="clear"></div>
    </div>
</div>
</div>  </div>
<div>

</body>
</html>
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
        <li class="<#if type=='binding'>cur</#if>"><a href="${BasePath}/wxbinding.kq?type=binding">公众账号绑定</a></li>
        <li class="<#if type=='auth'>cur</#if>"><a href="${BasePath}/myweixin.kq?type=auth">授权管理</a></li>
    </ul>
</div>
<#if type=='firstAttention'>
<script language="javascript">$(document).ready(wechat_obj.attention_init);</script>
<div id="attention" class="r_con_wrap">
    <form id="attention_reply_form" class="r_con_form" method="post" action="${BasePath}/updateAttentionMsg.kq">
        <input type="hidden" name="id" value=""/>
        <input type="hidden" name="type" value="${type}">
        <div class="rows">
            <label>回复类型</label>
            <span class="input">
                <select name="ReplyMsgType">
              
                    <option value="1" <#if msg??&&msg.type=="1">selected</#if>>文字消息</option>
                    
                    <option value="2" <#if !msg??>selected</#if>
		    <#if msg??&&msg.type=="2">selected</#if>>图文消息</option>
                </select>
            </span>
            <div class="clear"></div>
        </div>
        <div class="rows" id="text_msg_row">
            <label>回复内容</label>
            <span class="input"><textarea name="TextContents"><#if msg??>${msg.replay}<#else>你好，欢迎关注我们</#if></textarea></span>
            <div class="clear"></div>
        </div>
        <div class="rows" id="img_msg_row">
            <label>回复内容</label>
            <span class="input">
                <select name='msgId'>
                <option value=''>--请选择--</option>
                <#if ptList??>
                <#list ptList as item>
                <option value='${item.id}' <#if msg??&&msg.msgid==item.id>selected</#if>>
			<#if item.items?size==1>	【单图文】<#else>【多图文】</#if>
				<#if item.items[0]??>
				${item.items[0].title?default('')}
				<#else>
				此图文已删除请勿使用
				</#if>
		</option>
                </#list>
                </#if>
              </select>
                <a href="${BasePath}/ptMessage.kq?type=ptMessage" class="material">素材管理</a>
            </span>
            <div class="clear"></div>
        </div>
	<input type="hidden" name="ReplySubscribe" value="1">
        <!--div class="rows" id="img_msg_row">
            <label>任意关键词</label>
            <span class="input"><input type="checkbox" value="1" name="ReplySubscribe" <#if !msg??>checked</#if><#if msg??&&msg.openAnyKey??&&msg.openAnyKey=="1">checked</#if> /><span class="tips">开启（开启后，当输入的关键字无相关的匹配内容时，则使用本设置回复）</span></span>
            <div class="clear"></div>
        </div-->
        <div class="rows">
            <label></label>
            <span class="input"><input type="submit" class="btn_green" name="submit_button" value="提交保存" /></span>
            <div class="clear"></div>
        </div>
        <input type="hidden" name="do_action" value="wechat.attention_reply">
    </form>
</div>  </div>
<div>
<#elseif type='keyReplay'>
<div id="reply_keyword" class="r_con_wrap">
<form action="${BasePath}/queryCustomReplay.kq?type=keyReplay" name="queryForm" id="queryForm" method="post">
</form>
<div class="control_btn"><a href="${BasePath}/toAddCustomReplay.kq?type=keyReplay" class="btn_green btn_w_120">添加关键字</a></div>
<table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
<thead>
    <tr>
        <td width="10%" nowrap="nowrap">序号</td>
        <td width="25%" nowrap="nowrap">触发关键词</td>
        <td width="15%" nowrap="nowrap">匹配模式</td>
        <td width="35%" nowrap="nowrap">回复内容</td>
        <td width="10%" nowrap="nowrap" class="last">操作</td>
    </tr>
</thead>
<tbody>
    <#if pageFinder?? && (pageFinder.data)?? >
    <#list pageFinder.result as item>
    <tr>
    <td nowrap="nowrap">
        ${item_index+1}               
    </td>
    <td nowrap="nowrap">
        【${item.keyword?default('')}】               
    </td>
    <td nowrap="nowrap">
        <#if item.patten=='1'>
                    精确匹配
                    <#else>
                    模糊匹配
        </#if>   
    </td>
    <td>
        <#if item.type=='1'>
                文本消息【<#if (item.replay?length>=10)>${item.replay?substring(0,10)}<#else>${item.replay}</#if>】
        <#elseif item.type=="2">
               <#if item.wxmsg??>【<#if (item.wxmsg.items?size>1)>多图文<#else>单图文</#if>
	      
				<#if item.wxmsg.items[0]??>
				 ${item.wxmsg.items[0].title?default('')}
				<#else>
				此图文已删除请勿使用
				</#if>
	       </#if>】
        <#elseif item.type=="3">
                    语音消息
        <#else>
                视频消息
        </#if>
    </td>
    <td class="last" nowrap="nowrap">
    <a href="${BasePath}/toUpdateCustomReplay.kq?type=keyReplay&id=${item.id}"><img src="${BasePath}/images/icon/mod.gif" align="absmiddle" alt="修改" /></a>
    <a href="${BasePath}/removeCustomReplay.kq?type=keyReplay&id=${item.id}" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="${BasePath}/images/icon/del.gif" align="absmiddle" alt="删除" /></a>
    </td>
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
<@page.queryForm formId="queryForm" />

</div>  </div>
<div>
<#elseif type='customMenu'>
<div id="wechat_menu" class="r_con_wrap">
<script type='text/javascript' src='http://static.ptweixin.com/js/plugin/dragsort/dragsort-0.5.1.min.js?t=2013122302'></script>
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
                                        <dd MId="1870">
                        <div class="list ">
                            <a href="./?m=wechat&a=menu&d=menu&MId=1870" title="修改">
			    <img src="http://static.ptweixin.com/member/images/ico/mod.gif" align="absmiddle" /></a>
                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1870" title="删除" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};">
			    <img src="http://static.ptweixin.com/member/images/ico/del.gif" align="absmiddle" /></a>
                            公司简介                            </div>
                                                        <ul>
                                                                        <li MId="1873">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 微官网</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1873"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1873" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1874">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 电脑网站</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1874"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1874" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1882">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 微吧</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1882"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1882" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                </ul>
                            <div class="blank9"></div>
                                                </dd>
                                        <dd MId="1871">
                        <div class="list ">
                            <a href="./?m=wechat&a=menu&d=menu&MId=1871" title="修改"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" align="absmiddle" /></a>
                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1871" title="删除" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" align="absmiddle" /></a>
                            产品介绍                            </div>
                                                        <ul>
                                                                        <li MId="1875">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 网站建设</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1875"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1875" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1876">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 微信平台</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1876"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1876" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1883">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 会员卡</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1883"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1883" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1884">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 调研</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1884"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1884" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1885">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 团购</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1885"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1885" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                </ul>
                            <div class="blank9"></div>
                                                </dd>
                                        <dd MId="1872">
                        <div class="list ">
                            <a href="./?m=wechat&a=menu&d=menu&MId=1872" title="修改"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" align="absmiddle" /></a>
                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1872" title="删除" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" align="absmiddle" /></a>
                            联系我们                            </div>
                                                        <ul>
                                                                        <li MId="1877">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 微商城</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1877"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1877" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1878">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 微汽车</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1878"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1878" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1879">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 联系电话</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1879"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1879" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1880">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 附近门店</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1880"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1880" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                        <li MId="1881">
                                        <div class="title"><img src="http://static.ptweixin.com/member/images/ico/jt.gif" /> 预约</div>
                                        <div class="opt">
                                            <a href="./?m=wechat&a=menu&d=menu&MId=1881"><img src="http://static.ptweixin.com/member/images/ico/mod.gif" /></a>
                                            <a href="./?m=wechat&a=menu&d=menu&do_action=wechat.menu_del&MId=1881" onClick="if(!confirm('删除后不可恢复，继续吗？')){return false};"><img src="http://static.ptweixin.com/member/images/ico/del.gif" /></a>
                                        </div>
                                    </li>
                                                                </ul>
                            <div class="blank9"></div>
                                                </dd>
                                </dl>
            <div class="publish"><input type="button" class="btn_green" name="publish_btn" value="发布菜单" /><input type="button" class="btn_gray" name="del_btn" value="删除菜单" /></div>            </div>
        <div class="m_righter">
            <form id="wechat_menu_form" class="">
                <h1>添加菜单</h1>
                <div class="opt_item">
                    <label>菜单名称：</label>
                    <span class="input"><input type="text" name="Name" value="" class="form_input" size="15" maxlength="15" notnull /> <font class="fc_red">*</font></span>
                    <div class="clear"></div>
                </div>
                                        <div class="opt_item">
                        <label>添加到：</label>
                        <span class="input"><select name="SupMId">
                            <option value="0">一级菜单</option>
                            <option value='1870'>公司简介</option><option value='1871'>产品介绍</option><option value='1872'>联系我们</option>                          </select></span>
                        <div class="clear"></div>
                    </div>
                                    <div class="opt_item">
                    <label>消息类型：</label>
                    <span class="input"><select name="MsgType">
                        <option value="0" selected>文字消息</option>
                        <option value="1" >图文消息</option>
                        <option value="2" >连接网址</option>
                    </select></span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item" id="text_msg_row">
                    <label>文字内容：</label>
                    <span class="input"><textarea name="TextContents"></textarea></span>
                    <div class="clear"></div>
                </div>
                <div class="opt_item" id="img_msg_row">
                    <label>图文内容：</label>
                    <span class="input"><select name='MaterialId'><option value=''>--请选择--</option><optgroup label='---------------系统业务模块---------------'></optgroup><option value='2961' >微官网</option><option value='2962' >微商城</option><option value='2963' >微团购</option><option value='2964' >微调研</option><option value='2965' >微相册</option><option value='2966' >微吧</option><option value='2967' >会员卡</option><option value='2968' >LBS门店定位</option><option value='2969' >在线预约</option><option value='2970' >刮刮卡</option><option value='2971' >水果达人</option><option value='2972' >欢乐大转盘</option><option value='' selected>微房产</option><option value='' selected>微汽车</option><optgroup label="---------------自定义图文消息---------------"></optgroup><option value='12647' >【单图文】联系电话</option><option value='12643' >【单图文】微信平台</option><option value='12642' >【多图文】网站建设</option><option value='12641' >【多图文】关于信通</option></select><a href="./?m=material">素材管理</a></span>
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
<#elseif type='binding'>
<script language="javascript">$(document).ready(wechat_obj.set_token_init);</script>
<div id="wechat_auth" class="r_con_wrap">
            <div class="tips_info">
	   *  平台为您提供绑定微信公众平台API接口<br />
	   *  <span>首次使用：</span>请您到腾讯公众平台-->高级功能-->开发模式-->服务器配置-->修改<br />
	    </div>
	    <form id="binding_form" >
        <div class="r_con_form">
              <div class="rows">
                <label>接口URL:</label>
                <span class="input"><span class="tips">${apiurl?default('')}</span></span>
                <div class="clear"></div>
            </div>
            <div class="rows">
                <label>接口Token:</label>
                <span class="input"><span class="tips">${apitoken?default('')}</span></span>
                <div class="clear"></div>
            </div>
	    </form>
            </div>
    </div>
    </div>
<div>
<#elseif type='auth'>
<div id="wechat_auth" class="r_con_wrap">
<script language="javascript">$(document).ready(wechat_obj.auth_init);</script>
<div class="tips_info">
    1. 您的公众平台帐号类型必须升级为<span>服务号</span>。<br />
    2. 升级为服务号后，请先在公众平台申请接口使用的<span>AppId</span>和<span>AppSecret</span>，然后填入下边表单。
</div>
<form id="auth_form" action="${BasePath}/addSecret.kq?type=auth" class="r_con_form">
    <div class="rows">
        <label>AppId <span class="fc_red">*</span></label>
        <span class="input">
	<input name="appID" value="${secret.appID?default('')}" type="text" class="form_input" size="50" maxlength="18" notnull></span>
        <div class="clear"></div>
    </div>
    <div class="rows">
        <label>AppSecret <span class="fc_red">*</span></label>
        <span class="input"><input name="appsecret" value="${secret.appsecret?default('')}" type="text" class="form_input" size="50" maxlength="32" notnull></span>
        <div class="clear"></div>
    </div>
   <!--   ------------------------
    <div class="rows">
        <label>微信认证</label>
        <span class="input">
            <input type="checkbox" value="1" name="WechatAuth" checked /> <span class="tips">如果您的公众号已通过微信认证，请勾选此选项</span><br />
            <input type="checkbox" value="1" name="VoiceIden" checked /> <span class="tips">开启语音关键词回复，需同时开启微信认证选项</span>
            <div class="oauth_tips">
                <h1><strong>这个有什么用？</strong></h1>
                通过微信认证的公众号可以使用微信最新推出的9大新接口<br />
                请在微信公众平台高级接口处的“<span class="fc_red">OAuth2.0网页授权</span>​”设置授权回调页面域名为“<span class="fc_red">www.ptweixin.com</span>”<br />
                <span class="fc_red">开微信认证选项后，客户端中所有需要用户登录的页面，将直接读取用户的微信资料进行一键登录，免去用户注册的步骤</span><br />
                <span class="fc_red">开启语音关键词回复，您的微信帐号必须已通过微信认证并在高级接口中开启了语音识别，系统将自动识别出语音内容并启用模糊匹配方式进行关键字回复</span>
            </div>
        </span>
        <div class="clear"></div>
    </div>
    --------------------   -->
    <div class="rows">
        <label></label>
        <span class="input"><input type="submit" class="btn_green" name="submit_button" value="提交保存" /></span>
        <div class="clear"></div>
    </div>
    <script language="javascript">
		if("oklab"=="${oklab?default('')}")
				alert("提交成功！")
    </script>
   </form>
</div>  </div>
<div>
</#if>
</body>
</html>
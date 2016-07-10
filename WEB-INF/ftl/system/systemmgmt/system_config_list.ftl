<#include "../../system/system-include.ftl">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content=" />
<meta name="Description" content="" />
<title>网络营销系统-系统管理-系统配置</title>
</head>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemconfig.js"></script>

<body>

<div class="main-body" id="main_body">
	<div class="cont-nav ft-sz-12"><span><a href="#">系统管理</a> &gt;系统配置列表 </span></div>
	<br/>
	<input  type="button" value="一键更新缓存" onclick="javascript:updateCache();">
	<br/>
	<#if selectTab?? && selectTab !="-1">
		<div class="pro-list">
			<div class="mb-btn-fd-bd">
				<div class="mb-btn-fd relative">
					<span class="btn-extrange absolute ft-sz-14">
						<ul <#if selectTab?? && selectTab="0">class="onselect"<#else>class="unselect"</#if> >
							<li class="pl-btn-lfbg"></li>
							<li class="pl-btn-ctbg"><a href="queryUseSystemConfigList.kq" class="btn-onselc" >使用中配置</a></li>
							<li class="pl-btn-rtbg"></li>
						</ul>
						<ul <#if selectTab?? && selectTab="1">class="onselect"<#else>class="unselect"</#if> >
							<li class="pl-btn-lfbg"></li>
							<li class="pl-btn-ctbg"><a href="querySystemConfigList.kq"  class="btn-onselc" >所有配置</a></li>
							<li class="pl-btn-rtbg"></li>
						</ul>
					</span>
				</div>
				<div class="add-newpd ft-sz-12 fl-rt"><a href="javascript:toAddConfig();">&nbsp;&nbsp;增&nbsp;加</a></div>
				
			</div>
		</div>
	</#if>

	<div class="div-pl">

		<div class="yt-c-div">
            <table cellpadding="0" cellspacing="0" class="ytweb-table">
            <thead>
            <tr>
	            <th>配置名称</th>
	            <th>键</th>
	            <th>值</th>
	            <th>状态</th>
				<th>备注</th>
	            <th colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>

            	<#if configList ?? >
		      		<#list configList as item>
		      		<tr id='Tr${item.id}'>
		                <td style="text-align:left">
		                	<#if item.configName?length lt 25 >
								${item.configName}
		                 	<#else>
		                 		${item.configName[0..24]}...
		                 	</#if>
		                </td>
		                <td style="text-align:left" title="${item.key!""}">
		                 	<#if item.key?length lt 25 >
								${item.key}
		                 	<#else>
		                 		${item.key[0..24]}...
		                 	</#if>
		                </td>
		                 <td style="text-align:left" title="${item.value!""}">
		                 	<#if item.value?length lt 25 >
								${item.value}
		                 	<#else>
		                 		${item.value[0..24]}...
		                 	</#if>
		                </td>
		                <td>
	                		<#if item.deleteFlag?? && item.deleteFlag == "1" >
	                			正在使用
		                 	<#else>
		                 		已停用
		                 	</#if>
		                </td>
		                 <td style="text-align:left"  title="${item.remark!""}">
		                 	<#if item.remark?? >
			                	<#if item.remark?length lt 25 >
									${item.remark}
			                 	<#else>
			                 		${item.remark[0..24]}...
			                 	</#if>
		                 	</#if>
		                </td>
		                <td style="text-align:center;width:35px;">
		                	<a href="javascript:toUpdateConfig('${item.id}');" target="content">编辑</a>
		                </td>
		                <#if selectTab?? && selectTab="0">
		                	 <td style="text-align:center;width:35px;">
		                		<a href="javascript:removeConfig('${item.id}');" >删除</a>
		                	</td>
		                </#if>
	                	<#if !item.deleteFlag?? || item.deleteFlag == "0" >
			                 <td class="td0" style="text-align:center;width:35px;">
		                		<a href="#" onclick="javascript:location.href='u_useConfig.kq?id=${item.id}'" >启用</a>
			                </td>
	                	</#if>
		            </tr>
		      		</#list>
	      		</#if>
            </tbody>
            </table>
     	</div>
	</div>
</div>
</body>
</html>
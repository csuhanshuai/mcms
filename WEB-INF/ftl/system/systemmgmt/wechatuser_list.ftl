<#include "../system-include.ftl">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content=" />
<meta name="Description" content="" />
<title>网络营销系统-系统管理-微信用户管理</title>
</head>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemUser.js"></script>


<body>


<div class="main-body" id="main_body">
	<div class="cont-nav ft-sz-12"><span><a href="#">微信管理</a> &gt;微信用户管理 </span></div>
	<div class="pro-list">
		<div class="mb-btn-fd-bd">
			<div class="mb-btn-fd relative">
				<span class="btn-extrange absolute ft-sz-14">
					<ul class="onselect">
						<li class="pl-btn-lfbg"></li>
						<li class="pl-btn-ctbg">微信用户列表</li>
						<li class="pl-btn-rtbg"></li>
					</ul>
				</span>
			</div>
			<div class="add-newpd ft-sz-12 fl-rt"><a href="../../../system/systemmgmt/wechatuser/toWeChatUser.kq" target="content">&nbsp;&nbsp;增&nbsp;加</a></div>
		</div>
	</div>
	<div class="div-pl">
		
		<form method="get" action="queryUserList.kq" name="queryForm" id="queryForm"  >
		<div class="div-pl-hd ft-sz-12">
			<span>真实姓名：</span>
			<input name="name" class="blakn-sl" value="${name?default('')}"/>
			
			<span>登录用户名：</span>
			<input name="username" class="blakn-sl" value="${username?default('')}"/>
			<a href="javascript:document.queryForm.submit();" class="btn-sh">搜索</a>
		</div>
		</form>
		
		
		<div class="yt-c-div">
            <table cellpadding="0" cellspacing="0" class="ytweb-table">
            <thead>
            <tr>
	            <th>真实姓名 </th>
	            <th>登录用户名</th>
	            <th> 城市</th>
	            <th>手机</th>
	            <th>用户类型</th>
	            <th>接入类型</th>
		    <th>接入时间</th>
	            <th>Email</th>
	            <th>地址</th>
	            <th>备注</th>
	            <th>操作</th>
            </tr>              
            </thead>
            <tbody>
            
            
              <#if pageFinder?? && (pageFinder.data)?? >
	      		<#list pageFinder.result as item>		
	      		<tr id='Tr${item.id}'>
                    <td>
						${item.name?default("")}                 
                    </td>
                    <td>
                    	${item.username?default("")}
                    </td>
                    <td>
                    	${item.city?default("")}
                    </td>
                    <td>
                    	${item.telephone?default("")}
                    </td>
                    <td>
                    	${item.type?default("")}
                    </td>
                     <td>
                    	${item.accounttype?default("")}
                    </td>
		    <td>
                    	${item.addtime?default("")}
                    </td>
                       <td>
                    	${item.email?default("")}
                    </td>
                    <td>
                    	${item.address?default("")}
                    </td>
                    <td>
                    ${item.description?default("")}
                    </td>                  
                   
                    <td class="td0" style="text-align:left;">
                    
                    	<a href="../../../system/systemmgmt/wechatuser/toUpdatewechatUser.kq?id=${item.id}" target="content" style="padding-right: 5px;padding-left: 5px;">编辑</a>
			<a href="javascript:removewechatUser('${item.id}');"  style="padding-right: 5px;">删除</a>
			<a href="javascript:toUpdateWechatPassword('${item.id}');"  style="padding-right: 5px;">修改密码</a>           	
						
                    </td>
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="8"><div class="yt-tb-list-no">暂无内容</div></td></tr>
		</#if>
            </tbody>
            </table> 
     	</div>
     	
		
		<div class="div-pl-bt">
			<!-- 翻页标签 -->
			<#import "../../common.ftl"  as page>
			<@page.queryForm formId="queryForm" />
			
		</div>
	</div>
</div>
</body>
</html>
<#include "../../system/system-include.ftl">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content=" />
<meta name="Description" content="" />
<title>网络营销系统-系统管理-系统用户管理</title>
</head>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemEmail.js"></script>


<body>

<div class="main-body" id="main_body">
	<div class="cont-nav ft-sz-12"><span><a href="#">系统管理</a> &gt; 邮件发送列表 </span></div>
	<div class="pro-list">
		<div class="mb-btn-fd-bd">
			<div class="mb-btn-fd relative">
				<span class="btn-extrange absolute ft-sz-14">
					<ul class="onselect">
						<li class="pl-btn-lfbg"></li>
						<li class="pl-btn-ctbg">邮件发送列表</li>
						<li class="pl-btn-rtbg"></li>
					</ul>
				</span>
			</div>
		</div>
	</div>
	<div class="div-pl">
		
		<form action="querySystemEmailList.kq" name="queryForm" id="queryForm" method="post">
			<div class="div-pl-hd ft-sz-12">
		
			<span>收件地址：</span>
			<input name="receive_email" class="blakn-sl" value="${systemEmail.receive_email?default('')}"/>
			<a href="javascript:document.queryForm.submit();" class="btn-sh">搜索</a>
			</div>
<!-- 			<a href="sendMailTest.kq">发送</a>  -->
		</form>
	
		
		<div class="yt-c-div">
            <table cellpadding="0" cellspacing="0" class="ytweb-table">
            <thead>
            <tr>
	            <th>收件地址 </th>
	            <th>主题</th>
	            <th>邮件类型</th>
	            <th>发送时间 </th>
	            <th>发送状态</th>
	            <th>操作</th>
            </tr>              
            </thead>
            <tbody>
            
            
              <#if pageFinder?? && (pageFinder.data)?? >
	      		<#list pageFinder.result as item>		
	      		<tr id='Tr${item.id}'>
                    <td>
						${item.receive_email?default("")}                 
                    </td>
                    <td>
                    	${item.subject?default("")}
                    </td>
                    <td>
                    	<#if item.type == "0" >
                    		会员找回密码
                     	<#elseif item.type == "1" >
                     		订单发货
                     	<#elseif item.type == "2" >
                     		订单创建
                     	<#elseif item.type == "3" >
                     		订单付款
                     	<#elseif item.type == "4" >
                     		订单退货
                     	<#elseif item.type == "5" >
                     		订单退款
                     	<#elseif item.type == "6" >
                     		订单到货
                     	<#elseif item.type == "7" >
                     		会员注册
                     	<#elseif item.type == "8" >
                     		会员更改密码
                     	<#elseif item.type == "9" >
                     		订单作废
                     	<#elseif item.type == "10" >
                     		购物体验评价邀请
                 		<#elseif item.type == "11" >
                     		促销
                     	<#elseif item.type == "12" >
                     		货到付款
                     	<#else>
                     		其他
						</#if>                 
                    </td>
                    <td>
                    	${item.sendTime?default("")}
                    </td>
                     <td>
                     	<#if item.state == "0" >
                     		失败
                     	<#elseif item.state == "1" >
                     		成功
						</#if>                     	
                    </td>
                    
                    </td>
                    <td class="td0" style="text-align:left;">
                    	<a href="javascript:toShowDetail('${item.id}');" target="content">查看内容</a>
                    	<a href="javascript:removeSystemEmail('${item.id}');" >删除</a>
                    </td>
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="6"><div class="yt-tb-list-no">暂无内容</div></td></tr>
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
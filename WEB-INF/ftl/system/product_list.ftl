<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="网络营销系统,商品管理" />
<meta name="Description" content="网络营销系统-商品管理" />

<#include "system-include.ftl" >
<title>网络营销系统</title>

<script>
	$(function(){
	$(".popup-nav").mouseup();
	$(".topnav-more").hover(function(){
	$(".popup-nav").slideDown(300);
	});
	
	$(".pop-span").hover(function(){
	},function(){
	$(".popup-nav").slideUp(300);
	});
});
	
function redirectFrame(){
	var url = "${BasePath}/ecsystem/systemmgmt/systemuser/toUpdateSystemUser.sc?id=${systemUser.id}&fromifr=topFrame";
	 window.top.frames["content"].document.location.href = url;
	 return true;
	
	
}
	
</script>

</head>

<body>
<#assign systemModelList=all_system_model_list>
<div class="continer">
	<!-- 引入外部文件	-->
	<div class="head">
		<div class="logo ft-fm-bk relative">
			<span class="ft-cl-r ft-sz-26">&nbsp;&nbsp;奇新时代&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;后台管理系统</span>
		</div>
		
		<div class="hdrt ft-sz-12">
			<div class="topnav">
				<div class="topnavlk ft-cl-Exp relative">
					<a href="mainFrame.kq?root_struc=" class="sp-topnavlk-a">首页</a>|
					<#list systemModelList as modelItem>
						<#if (modelItem_index < 7) >
							<a href="mainFrame.kq?root_struc=${modelItem.structure}">${modelItem.menuName}</a>|
						</#if>
					</#list>
					<span class="pop-span">
					<a href="#" class="topnav-more" style="padding-right:15px;">更多</a>
                    <ul class="popup-nav absolute" >
                    	<li><a href="mainFrame.kq?root_struc=">首页</a></li>
                    	 <#list systemModelList as modelItem>
							<a href="mainFrame.kq?root_struc=${modelItem.structure}">${modelItem.menuName}</a>
						</#list>
                    </ul></span>  
				</div>
				<div class="topnav-lfbg"><img src="${BasePath}/images/ecsystem/topnavbglf.gif" alt="" /></div>
			</div>
            <div class="st-uloged ft-cl-Exp">
            	<span class="ft-cl-n">
	           		<#if hours?? && (hours < 12 && hours >= 5 ) >
	           			上午好！
	           		<#elseif hours?? && (hours >= 12 && hours < 18 )>
	           			下午好！
	           		<#else>
	           			晚上好！
	           		</#if>
	           		${systemUser.username?default("")}
	           	</span> 
                 <a  href="#" onclick="redirectFrame();">个人设置</a>|
                 <a href="logout.kq" target="_top">退出</a>
            </div>
		</div>
		
	</div>
	
	<div class="divH12 interval-bg">
		
	</div>
	<div class="content">
		<div class="ctr-lf-bar absolute">
			<a id="closelfbar" class="close-st2" href="javascript:void(0);" onclick="cl_lfbar_a()">closelfbar</a>
			<a id="openlfbar" class="open-st1" href="javascript:void(0);" onclick="op_lfbar_a()">openlfbar</a>
		</div>
    	<div id="navifr" >
           <iframe id="lfbarif" frameborder="0" src="product_manage_lfbar.kq?root_struc=${root_struc?default('')}" width="100%" height="600px" name="lfbarif"  scrolling="no" >
        </iframe>
        </div>
        <div id="conifr" >
            <iframe frameborder="0" id="content" name="content" src="sealnetreview.kq" width="100%" scrolling="no" >
        </iframe>
        </div>
	</div>
	<div class="divH8"></div>
	<div class="footer">
		如果你有任何建议和意见请联系 <a href="mailto:service@domain.com">service@domain.com</a>
		<br />
		©2011 XXX资讯部
	</div>
</div>

<script type="text/javascript">

function resetH(){
	
	var h=$("#content").contents().find("div:first").height()+20;

	var lefth=$("#lfbarif").contents().find("div:first").height()+20;

	if(h==null || h<350) h=350;
	 	
	$("#content").height(h);
	
	if(lefth==null || lefth<350) lefth=350;
	
	$("#lfbarif").height(lefth);
}

setInterval('resetH()',100);
setInterval('resetW()',100);

var opflag = 0;

//控制主体框宽度
function resetW(){
	if(opflag==1){
		document.getElementById("conifr").style.width="99%";
	}else{
    	var fxw=document.documentElement.scrollWidth-165;
		document.getElementById("conifr").style.width=fxw+'px';
	}
}

//设置页面最小宽度
function resetMinW(){
	$(document.body).attr('style' ,'min-width:1000px');
}


window.onresize=function(){
	resetW();//设置主框架宽度
	resetMinW();//最小宽度
}

$(function(){
	resetMinW();//自适应宽度
	resetW();
	$("#content").load(function(){         
		$('html, body').animate({scrollTop: '0px'});//滚动到顶部 
	});
});



</script>

</body>
</html>

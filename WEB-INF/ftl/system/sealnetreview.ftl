<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="网络营销系统,商品管理" />
<meta name="Description" content="网络营销系统-商品管理" />
<#include "system-include.ftl" >

<script type="text/javascript">
//右上角下拉菜单
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
    </script>
<title>网络营销系统-商品管理</title>
</head>

<body>
	<div class="main-body" id="main_body">
		<div class="prod-list-gather">
        	<div class="leftInfo">
            	<div class="leftInfoDt">
                	<span>待处理业务</span>
                    <ul>
                    	<li><b class="bx1"></b><label>未处理的xx</label><a href="#">0 笔</a></li>
                        <li><b class="bx2"></b><label>未回复的xx咨询</label><a href="#">4 笔</a></li>
                        <li><b class="bx3"></b><label>未回复的xx反馈</label><a href="#">1 笔</a></li>
                        <li><b class="bx4"></b><label>未通知的xx登记</label><a href="#">0 笔</a></li>
                        <li><b class="bx5"></b><label>xxxx</label><a href="#">2 笔</a></li>
                        <li><b class="bx5"></b><label>xxxx</label><a href="#">1 笔</a></li>
                    </ul>
                </div>
                <div class="leftInfoDt">
                	
                </div>
            </div>
            <div class="rightInfo">
            	<div class="baobiao">
                	<span>xxxx趋势</span>
                    <p><img src="${BasePath}/images/ecsystem/baobiao.gif" alt="" /></p>
                </div>
                <div class="baobiao">
                	<span>常见问题</span>
                    <div class="baobiao_dt">
                    	<ul>
                        	<li><a href="#">如何录入信息，xx怎么录入？</a></li>
                            <li><a href="#">如何录入xx信息，xx怎么录入？</a></li>
                        </ul>
                        <ul>
                        	<li><a href="#">xx处理是按什么样的流程？</a></li>
                            <li><a href="#">xx处理是按什么样的流程？</a></li>
                        </ul>
                        <ul>
                        	<li><a href="#">xxx有什么好的方式吗，和xx有什么大的区别？</a></li>
                            <li><a href="#">xx有什么好的方式吗，和xx有什么大的区别？</a></li>
                        </ul>
                        <ul>
                        	<li><a href="#">如何录入xx信息，xx怎么录入？</a></li>
                            <li><a href="#">如何录入xx信息，xx怎么录入？</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="blank10"></div>
        </div>
	</div>
</body>
</html>

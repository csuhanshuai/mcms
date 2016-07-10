<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健坤商城_404错误</title>
<meta name="description" content="健坤商城"/>
<meta name="keywords"  content="健坤商城"/>
<script>
var i = 10;
var intervalid;
function reload() {
	if (i == 0){
		window.location.href = "/";
		clearInterval(intervalid);
	}
	document.getElementById("time").innerHTML = i;
	i--;
}
intervalid = setInterval("reload()", 1000);
</script>
<link href="${BasePath}/template/common/css/base.css" type="text/css" rel="stylesheet" />
<link href="${BasePath}/template/common/css/mold.css" type="text/css" rel="stylesheet" />

</head>
<body>
<!-- 头部start -->
<#include "../webtemplate/header.ftl" >
<!-- 头部end -->
<div class="blank15"></div>
<div class="w960 hbox">
	<div class="errorpage">
		<h3>很抱歉，您访问的页面不存在！</h3><br />
		<p class="Gray">系统<em id="time">10</em>秒钟之后将带您进入首页！<br /><br />
		<a class="Blue" href="/">返回首页</a><a class="Blue" onclick="window.history.go(-1);"  href="javascript:void(0);">返回上一页</a>
	 	</p>
	</div>
</div>
<div class="blank20"></div>
<div class="blank20"></div>
<!-- 底部start -->
<div class="w960">
	<div class="w958 grayborder n_endservice">
	<a href="/help/aboutus.html" target="_blank"><img src="/template/common/images/endsevice.gif" /></a>
	</div>
	<div class="w960 n_email"> <span class="tleft Black">
		<form action="?" name="markemail">
			<label for="email">Email订阅最新特惠信息：</label>
			<input type="text" name="email" id="email" class="n_emailin" maxlength="100" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" id="subscribe" value=" " name="subscribe"  class="subscribe" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="sethomeurl" value=" " name="sethomeurl" onclick="setHomepage()" class="sethomeurl" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="collection" value=" " name="collection" class="collection" onclick="addFavorite()" />
		</form>
		</span> </div>
	<div class="w960 f_black" id="n_help">
		<dl>
			<dt>新手帮助</dt>
			<dd><a href="/help/agreement.html" title="交易条款协议">交易条款协议</a></dd>
			<dd><a href="/help/registration.html" title="注册新用户">注册新用户</a></dd>
			<dd><a href="/help/orderprocess.html" title="订购流程">订购流程</a></dd>
			<dd><a href="/help/memberpoints.html" title="会员积分详情">会员积分详情</a></dd>
			<dd><a href="/help/memberlevel.html" title="会员等级">会员等级</a></dd>
		</dl>
		<dl>
			<dt>购物指南</dt>
			<dd><a href="/help/payment.html" title="支付方式">支付方式</a></dd>
			<dd><a href="/help/shippingmethod.html" title="配送方式">配送方式</a></dd>
			<dd><a href="/help/deliverytf.html" title="配送时间及运费">配送时间及运费</a></dd>
			<dd><a href="/help/cashondelivery.html" title="货到付款">货到付款</a></dd>
			<dd><a href="/help/inspectionandsign.html" title="验货与签收">验货与签收</a></dd>
			<dd><a href="/help/orderinquiries.html" title="订单配送查询">订单配送查询</a></dd>
		</dl>
		<dl>
			<dt>售后服务</dt>
			<dd><a href="/help/returnpolicy.html" title="退换货政策">退换货政策</a></dd>
			<dd><a href="/help/applyforreturn.html" title="如何办理退换货">如何办理退换货</a></dd>
			<dd><a href="/help/refund.html" title="退款方式">退款方式</a></dd>
			<dd><a href="/help/invoicesystem.html" title="发票制度">发票制度</a></dd>
		</dl>
		<dl>
			<dt>会员服务</dt>
			<dd><a href="/help/hotIssues.html" title="热点问题">热点问题</a></dd>
			<dd><a href="/help/forgotpassword.html" title="找回密码">找回密码</a></dd>
			<dd><a href="/help/sizes.html" title="尺码选择">尺码选择</a></dd>
			<dd><a href="/help/suggestions.html" title="投诉和建议">投诉和建议</a></dd>
			<dd><a href="/help/contactus.html" title="联系我们">联系我们</a></dd>
		</dl>
	  <dl class="help">
			<dt>健坤商城客服</dt>
			<dd class="kf tleft"> <span class="pl25px"><a href="javascript:;" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=800023329&eid=2188z8p8p8p8K8P8P8K80&o=127.0.0.1&q=7', '_blank');">在线咨询</a></span> </dd>
			<dt>健坤商城热线</dt>
			<dd>订购电话：<b class="Red Size16 f_geo">400 6963 666</b></dd>
			<dd class="blank10"></dd>
			<dd>售后电话：<b class="Red Size16 f_geo">400 6262 036</b></dd>
		</dl>
	</div>
	<div class="w960 n_footinfo">
		<div class="n_footl fl tleft"><a href="/"><img src="/template/common/images/endlogo.jpg" title="健坤商城" alt="健坤商城" /></a></div>
		<div class="n_footr fr f_white">
			<p class="tright"><a href="/help/aboutus.html" target="_blank" >关于健坤商城</a> | <a href="/help/zhaopin.html" target="_blank">招贤纳士</a> | <a href="/help/contactus.html" target="_blank">联系我们</a></p>
			<p class="tright">Copyright &copy; 2011 Domain Technology Co., Ltd. <a href="http://www.miibeian.gov.cn" target="_blank">粤ICP备09070608号-2</a> 增值电信业务经营许可证：<a href="http://www.miibeian.gov.cn" target="_blank" >粤 B2-20090203</a></p>
		</div>
	</div>
</div>
<!-- 底部end -->
<script type="text/javascript"]]>
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount','UA-23566531-1']);
  _gaq.push(['_setDomainName', '.domain.com']);
  _gaq.push(['_addOrganic', 'baidu', 'word']);
  _gaq.push(['_addOrganic', 'soso', 'w']);
  _gaq.push(['_addOrganic', '3721', 'name']);
  _gaq.push(['_addOrganic', 'yodao', 'q']);
  _gaq.push(['_addOrganic', 'vnet', 'kw']);
  _gaq.push(['_addOrganic', 'sogou', 'query']);
  _gaq.push(['_trackPageview',' "/404.html?page=" + document.location.pathname + document.location.search + "&from=" + document.referrer ']);
  _gaq.push(['_trackPageLoadTime']);


  (function() {
    var ga = document.createElement('script'); ga.type ='text/javascript'; ga.async =true;
    ga.src ='http://www.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</body>
</html>
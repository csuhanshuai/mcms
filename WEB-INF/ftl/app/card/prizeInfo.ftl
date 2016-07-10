<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" > 
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="${BasePath}/css/card/main.css">
<script type="text/javascript" src="${BasePath}/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div id="container">

<section>
	 <article>
       <div style="text-align:left;" class="button green">&nbsp;&nbsp;中奖纪录</div>
     </article>
	 
	 <article class="intro">
			<fieldset style="border:0;">
				<ul class="good_friend_list">
					<li class="title"><span class="name">中奖情况</span><span class="time">过期时间</span>
					<#if employee.isprizes==0><span class="name">操作</span></#if>
					</li>
			        
			        <li><span class="name">${employee.prizename?default("")}</span><span class="time">${expiredTime}</span>
			        
			        <span class="name">
			        <#if employee.isprizes==0>
			        <form action="${BasePath}/card/toPrizes.kq?openid=${openid}" name="qcust" id="qcust" method="post">
			         <input type="button" id="bsubmit" value="兑奖"></span>
			        </form>
			        </#if>
			        
			        </li>
					
				</ul>
			</fieldset>
			
     </article>
</section>


</div>
</body>
<script type="text/javascript">


		$(document).ready(function() {
 			
	 		
	 		$("#bsubmit").click(function(){
	 		
	 			if(confirm('是否兑奖?'+String.fromCharCode(10)+'温馨提示：请到兑奖点出示给工作人员兑奖，如自己点击“兑奖”则此奖作废'))
				{
				  var form = document.getElementById("qcust");
				  form.submit();
				}
				else
				{
				   //alert('选择了否'); 
				}
				
			});
				
		});


	
	function onBridgeReady(){
 WeixinJSBridge.call('hideOptionMenu');
}

if (typeof WeixinJSBridge == "undefined"){
    if( document.addEventListener ){
        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
    }else if (document.attachEvent){
        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
    }
}else{
    onBridgeReady();
}
</script>


</html>


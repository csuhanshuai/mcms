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
	  
	 	 <form id="form1" method="post">
	 		<input  name="openid" type="hidden" value="${openid}">
	  <article class="intro">
			<h1 style="width:80%">亲，恭喜中奖，请填写您的兑奖信息</h1>
			<ul class="contact_info"><li class="text_info">姓名：</li><li><input style="width:200px;" name="name" type="text"></li></ul>
			<ul  class="contact_info"><li class="text_info">电话号码：</li><li><input maxlength="12" style="width:200px;" name="mobilephone" type="text"></li></ul>
     </article>
     	<div style="margin: 10px; text-align: center;">
					<a id="bsubmit" class="btn_submit" style="margin: 10px auto; text-align: center;">提交订单 </a>
			</div>
			</form>
		<footer style="text-align:center; color:#ffd800;margin-right:20px;margin-top:0px;"><a href="" style="color: #000;"></a></footer> 
	</section>
</div>

<script type="text/javascript">
	 
 	$(document).ready(function() {
 			
	 		
	 		$("#bsubmit").click(function(){
	 			var form = document.getElementById("form1");
	
			

				if ('undefined' !== typeof (form.name)) {
					if (form.name.value.length <= 0) {
						alert("请输入您的真实姓名");
						return;
					};

				}

				
				if ('undefined' !== typeof (form.mobilephone)) {
					form.mobilephone.value=form.mobilephone.value.replace(/\D/g,'');
						if (form.mobilephone.value.length <= 7) {
						alert("请输入正确的电话号码");
						return;
					};

				}
				
				
			
				var $btn = $("#bsubmit");
				if($btn.hasClass("disabled")) return;
				$btn.addClass("disabled");
				
				
				form.action="${BasePath}/card/zjminweb/addEmployee.kq";
			    form.submit();	
	
			
					
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

	<div mark="stat_code" style="width: 0px; height: 0px; display: none;">
	</div>

</body>
</html>
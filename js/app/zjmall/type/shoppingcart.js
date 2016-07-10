//购物车

$(function(){
	//加入收藏
	$('.fav').click(function(){
		/*$.ajax('',function(){
			showWapTip({
				msg:'收藏成功',
				autoHide:true
			})
		});*/
		var flag = $(this).attr('flag')*1;
		var _f = new Favorites();
		var no = $(this).attr('no');
		if(flag >0){
			_f.delCallback = function(){
				window.location.reload();
			};
			_f.doDelete(no);
		}else{
			_f.addCallback = function(){
				window.location.reload();
			};
			_f.add(no);
		}
	});
	
	//删除购物车商品
	$('.delpro').click(function(){
		var me = $(this);
		if(confirm('确定删除吗')){
			//清除cookie
			var productNo = me.attr("data");
			var tradeCurrency = me.attr("tradeCurrency");
			if(typeof productNo != 'undefined'){
				var url = (context + "/delshoppingcart.sc");
				var param={"productId" : productNo, "tradeCurrency" : tradeCurrency};
				$.post(url, param, function(data){
					var flag = data.flag*1;
					if(flag > 0){
						window.location.href= (context + "/shoppingcart.sc");
					}else{
						YouGouWap.base.showWapTip({
							msg:'删除购物车失败,请重新删除',
							autoHide:true
						});
					}
				}, "json")
			}
		}
	});
	
	
	//修改购物车货品数量
	$('.proNO').blur(function(){
		var productNo = $(this).attr('data');
		var tradeCurrency = $(this).attr("tradeCurrency");
		if(!tradeCurrency){
			tradeCurrency = "";
		}
		var num = $(this).val()*1;
		if(num > 10){
			$(this).val(10);
			YouGouWap.base.showWapTip({
				msg:'同一款商品限购10件!',
				autoHide:true
			});
		}
		if(num < 1){
			$(this).val(1);
		}
		var url = (context + "/setshoppingcart.sc");
		var param={"productId" : productNo, "productNum" : $(this).val()*1, "tradeCurrency" : tradeCurrency, "r" : new Date().getTime()};
		$.post(url, param, function(data){
			var flag = data.flag*1;
			if(flag < 0){
				alert(data.msg);
			}else if(flag > 0){
				$("#amount"+tradeCurrency).text(data.amount);//修改金额
				$("#downnum"+tradeCurrency).text("数量：" + data.num + "件");//修改数量
				if(tradeCurrency == "hkd"){
					$("#tit").text("购物车(" + (parseInt(data.num) + parseInt(cnynum)) + ")件");
				}else{
					$("#tit").text("购物车(" + (parseInt(data.num) + parseInt(hkdnum)) + ")件");
				}
			}
		}, "json");
	});
	
	
	//购物车去结算页面
	$('input[name="checkout"]').click(function(){
		var tradecurrency = $(this).attr("tradecurrency")
		window.location.href= context + "/pay/checkout.sc?tradecurrency="+tradecurrency;
	});
	
	//加入购物车
	$("#addShop").click(function (){
		var productNo = $("#sizeNo").val();
		if(productNo*1 <= 0){
			YouGouWap.base.showWapTip({
				msg:'请选择尺码!',
				autoHide:true
			});
			return;
		}
		if($.trim(productNo).length < 11){
			YouGouWap.base.showWapTip({
				msg:'商品不合法，请重新选择商品!',
				autoHide:true
			});
			return;
		}
		if(typeof productNo != 'undefined'){
			var url = (context + "/addshoppingcart.sc");
			var num = $("#inpProNum").val()*1;
			if(num <= 1){
				$("#inpProNum").val(1);
			}
			var param={"productNo" : productNo, "productNum" : num};
			$.post(url, param, function(data){
				var flag = data.flag*1;
				if(flag > 0){
					YouGouWap.base.showWapTip({
						msg:'加入购物车成功!',
						autoHide:true
					});
				}
				else if(flag == -1){
					document.location.href = context + "/toLogin.sc?redirectURL="+encodeURIComponent(document.location);
				}
				else{
					alert(data.msg);
				}
			}, "json");
			return false;
		}
	});
	
	//立即购买
	$("#buy").click(function (){
		var productNo = $("#sizeNo").val();
		if(productNo*1 <= 0){
			YouGouWap.base.showWapTip({
				msg:'请选择尺码!',
				autoHide:true
			});
			return;
		}
		if($.trim(productNo).length < 11){
			YouGouWap.base.showWapTip({
				msg:'商品不合法，请重新选择商品!',
				autoHide:true
			});
			return;
		}
		if(typeof productNo != 'undefined'){
			var url = (context + "/pay/checkout.sc");
			var num = $("#inpProNum").val()*1;
			if(num <= 1){
				$("#inpProNum").val(1);
			}
			var buyNow = "now"
			window.location.href= url+"?productNo="+productNo+"&productNum="+num+"&buyNow=rightnow";
			return false;
			
		}
	});
	
	//立即购买
	$("#buynow").click(function (){
		var productNo = $("#sizeNo").val();
		var tradecurrency = $("#tradecurrency").val();
		if(productNo*1 <= 0){
			YouGouWap.base.showWapTip({
				msg:'请选择尺码!',
				autoHide:true
			});
			return;
		}
		if($.trim(productNo).length < 11){
			YouGouWap.base.showWapTip({
				msg:'商品不合法，请重新选择商品!',
				autoHide:true
			});
			return;
		}
		
		if(typeof productNo != 'undefined'){
			var url = (context + "/pay/checkout.sc");
			var num = $("#inpProNum").val()*1;
			if(num <= 1){
				$("#inpProNum").val(1);
			}
			window.location.href= url+"?buyNow=rightnow&productNo="+productNo+"&productNum="+num+"&tradecurrency="+tradecurrency;
			return false;
		}
	});
	
	
	function sumitNum(name, number){
		var couponNum = $('#couponcard').val();
		var giftNum = $('#cardid').val();
		var address = $('#address').val();
		var payway = $(".payway[checked='checked']").val();
		
		var tradecurrency = $('#tradecurrency').val();
		var productNo = $('#productNo').val();
		var productNum = $('#productNum').val();
		var url;
		if(tradecurrency == 'hkd'){
			url = context + '/pay/checkout.sc?address=' + address +'&payway=' + payway + '&tradecurrency=' + tradecurrency + '&productNo=' + productNo + '&productNum=' + productNum;
		}else{
			url = context + '/pay/checkout.sc?address=' + address +'&payway=' + payway;
		}
		//var url = context + '/pay/checkout.sc?address=' + address +'&payway=' + payway;
		if(typeof name !=  'undefined'){
			if('coupon' == name){
				url = url + '&couponcard=' + number + '&cardid=' + giftNum;
				
			}else if('giftcard' == name){
				url = url  + '&couponcard=' + couponNum + '&cardid=' + number;
			}
			window.location.href = url;
		}
	};
	
	$('.gftcpn_lst .areacheck').click(function(){
		var _this=$(this);
		var number = _this.attr('data');
		var name = _this.attr('name');
		sumitNum(name, number);
	});
	
	
	//选择支付方式
	$('.payway').click(function(){
		var couponNum = $('#couponcard').val();
		var giftNum = $('#cardid').val();
		var address = $('#address').val();
		var payway = $(this).attr('data');
		
		var tradecurrency = $('#tradecurrency').val();
		var productNo = $('#productNo').val();
		var productNum = $('#productNum').val();
		
		//如果是货到付款,判断手机验证
		if('1' == payway){
			var mobilecheck = $("#mobilecheck").val();
			if(mobilecheck == 'false'){
				window.location.href = context + "/my/gotoVerificationPhoneNumber.sc";
				return false;
			}
		}
		url = url + '&couponcard=' + couponNum + '&cardid=' + giftNum;
		if(tradecurrency == 'hkd'){
			url = url + '&tradecurrency=' + tradecurrency + '&productNo=' + productNo + '&productNum=' + productNum;
		}
		window.location.href = url;
	});
	
	$('.inpsmt').click(function(){
		var _this=$(this);
		var number = $.trim(_this.siblings('.inptxt').val());
		var name = _this.attr('name');
		sumitNum(name, number);
		var couponNum = $('#couponcard').val();
		var giftNum = $('#cardid').val();
		var address = $('#address').val();
		var payway = $(".payway[checked='checked']").val();
		var url = context + '/pay/checkout.sc?address=' + address +'&payway=' + payway;
		
		var tradecurrency = $('#tradecurrency').val();
		var productNo = $('#productNo').val();
		var productNum = $('#productNum').val();
		
		if(typeof name !=  'undefined'){
			if('coupon' == name){
				url = url + '&couponNumber=' + number + '&cardid=' + giftNum;
				
			}else if('giftcard' == name){
				url = url + '&couponcard=' + couponNum + '&cardNumber=' + number;
			}
			if(tradecurrency == 'hkd'){
				url = url + '&tradecurrency=' + tradecurrency + '&productNo=' + productNo + '&productNum=' + productNum;
			}
			window.location.href = url;
		}
		return false;
	});
	



});
	

var YouGouWap={};
YouGouWap={
		base:{
			showWapTip:function(opt){
				var opt = $.extend({
					msg:'',
					title:'',
					autoHide:false,
					time:1000,
					isOkButton:false,
					okButtonTxt:'知道了',
					button:null,
					type:'tip',
					confirmCallback:null,
					confirmButton:'确定',
					isCloseButton:true
				},opt||{});
				var str='<div class="waptip"><div class="hd">'+opt.title+'</div><div class="bd"></div><div class="ft"></div></div>';
				$('body').append(str);
				var waptip = $('.waptip'),bd =$('.waptip .bd'),ft=$('.waptip>.ft');
				bd.html(opt.msg);
				if(opt.button){
					ft.append(opt.button);
				}				
				if(opt.type=='tip'){
					if(opt.isOkButton){
						ft.append('<span class="btn_org" id="closeTip">'+opt.okButtonTxt+'</span>');
					}
				}
				if(opt.type=='confirm'){
					ft.append('<span class="btn_org" id="waptip_confirmok">'+opt.confirmButton+'</span>');
					if(opt.isCloseButton){
						ft.append('<span class="btn_org" id="closeTip">取消</span>');
					}
					if(opt.confirmCallback){
						$('#waptip_confirmok').click(function(){
							opt.confirmCallback();
						});
					}
				}
				//关闭
				$('#closeTip').live('click',function(){
					waptip.remove();
				});
				
				waptip.css('margin-top',-waptip.height()/2);
				//按钮

				//自动消失
				if(opt.autoHide){
					setTimeout(function(){
						waptip.animate(
							{opacity:0},300,
							{complete:function(){
								waptip.remove();
							}});
					},opt.time);
				}
				
				
			}
		}
	}

function initOultesIndex(){
	TouchSlide({					
		slideCell:"#focus2",
		mainCell:".bd ul", 
		effect:"leftLoop",
		isStopPropagation:true,
		autoPlay:true//自动播放
	});	
	//翻屏到优购
	/*$('.jsgotoyg').click(function(){
		if($('#scrollpage').attr('type')=='ol'){
			$('#nextCell').click();
		}else{
			$('#prevCell').click();
		}
	});*/
	//弹窗
	$('.outletsbd .jswapdialog').click(function(){
		var id=$(this).attr('dialogid');
		var domDialog=id?'#'+id:'.wap_full_dialog';
		//首页搜索单独处理
		$('#focus2').hide();
		$('.outletsbd .module').hide();
		$('.outletsbd .catbrand').hide();
		$(domDialog).eq(0).height($('body').height()).show().animate({top:0},'ease-in');	
		return false;
		
	});	
	//弹窗关闭按钮
	$('.outletsbd .wap_full_dialog_close2').click(function(){
		//var dialog = $('.wap_full_dialog');
		//首页搜索单独处理

		$('#focus2').show();
		$('.outletsbd .module').show();
		$('.outletsbd .catbrand').show();

		var dialog=$(this).closest('.wap_full_dialog');
		dialog.animate({
				top:'100%'
			},{
				easing:'ease-in',
				complete:function(){
					dialog.hide();}
			});
	});		
}

function initYgIndex(){
	//首页焦点图
	TouchSlide({					
			slideCell:"#focus",
			mainCell:".bd ul", 
			effect:"leftLoop",
			isStopPropagation:true,
			autoPlay:true//自动播放
	});
	//翻屏到奥莱
	/*
	$('.jsgotool').click(function(){
		if($('#scrollpage').attr('type')=='yg'){
			$('#nextCell').click();
		}else{
			$('#prevCell').click();
		}
	});*/
	//弹窗
	$('#index .jswapdialog').click(function(){
		var id=$(this).attr('dialogid');
		var domDialog=id?'#'+id:'.wap_full_dialog';
		//首页搜索单独处理
		$('#focus').hide();
		$('#index .module').hide();
		$('#index .catbrand').hide();
		$('#index '+domDialog).eq(0).height($('body').height()).show().animate({top:0},'ease-in');	
		return false;
		
	});
	//弹窗关闭按钮
	$('#index .wap_full_dialog_close').click(function(){
		//var dialog = $('.wap_full_dialog');
		//首页搜索单独处理
		$('#index #focus').show();
		$('#index .module').show();
		$('#index .catbrand').show();

		var dialog=$(this).closest('.wap_full_dialog');
		dialog.animate({
				top:'100%'
			},{
				easing:'ease-in',
				complete:function(){
					dialog.hide();}
			});
	});		
}
/*首页*/
if($('#scrollpage')[0]){
	//提示左滑有惊喜
	/*if(!localStorage.getItem('tipguide')){
		var tpguide=$('.tpguide');
		tpguide.show();
		tpguide[0].addEventListener('touchmove', function(event) {
			tpguide.hide();
			localStorage.setItem('tipguide',true);
		}, false); 	
	//增加一个click
		tpguide[0].addEventListener('click', function(event) {
			tpguide.hide();
			localStorage.setItem('tipguide',true);
		}, false);
	};*/
	//首页焦点图
	TouchSlide({					
			slideCell:"#scrollpage",
			mainCell:".scrollpage-inwrap", 
			titCell:'.scrollpage-item',
			prevCell:'#prevCell',
			nextCell:'#nextCell',			
			endFun:function(i,c){
				var curPg = $('.scrollpage-item').eq(i);
				var type=curPg.attr('type');
				if(type){
					location.hash='target='+type;
				}else{
					location.hash='';
				}				
				if(curPg.attr('url')){
					curPg.load(curPg.attr('url'),function(){
						/* curPg.attr('url',null);
						//初始化奥莱首页
						if(curPg.attr('type')=='olindex'){
							initOultesIndex();
						}else{
							initYgIndex();
						}*/
						
					});
				}			
				window.scrollTo(0,0);
			}
	});
	/*if($('#scrollpage').attr('type')=='yg'){
		initYgIndex();
		//判断是否要显示特卖
		if(location.hash.indexOf('ol')>0){
			$('#nextCell').click();
		}		
	}else{
		initOultesIndex();
		//判断是否要显示优购
		if(location.hash.indexOf('yg')>0){
			$('#nextCell').click();
		}			
	}*/
	if($('#scrollpage').attr('type')=='yg'){
		initYgIndex();
	}
	
}
//弹窗
if(!$('#scrollpage')[0]){
$('.jswapdialog').click(function(){
	var id=$(this).attr('dialogid');
	var domDialog=id?'#'+id:'.wap_full_dialog';
	//首页搜索单独处理
	if($('#index #focus')[0]){
		$('#focus').hide();
		$('#index .module').hide();
		$('#index .catbrand').hide();
	}
	$(domDialog).eq(0).height($('body').height()).show().animate({top:0},'ease-in');	
	return false;
	
});
//弹窗关闭按钮
$('.wap_full_dialog_close').click(function(){
	//var dialog = $('.wap_full_dialog');
	//首页搜索单独处理
	if($('#index #focus')[0]){
		$('#index #focus').show();
		$('#index .module').show();
		$('#index .catbrand').show();
	}
	var dialog=$(this).closest('.wap_full_dialog');
	dialog.animate({
			top:'100%'
		},{
			easing:'ease-in',
			complete:function(){
				dialog.hide();}
		});
});
}	
/*搜索页 条件筛选*/
if($('#srchFilter')[0]){
	//全选
	$('.checkall').click(function(){
		var box = $(this).parents('.box');
		if(this.checked){
		box.addClass('checkallbox').find('input[type=checkbox]').prop('checked',this.checked);
		}else{
			box.removeClass('checkallbox').find('input[type=checkbox]').prop('checked',false);
			box.find('.colorchecked').removeClass('colorchecked');
		}
	});
	//颜色选择
	$('.colorlabel label').click(function(){
		var me=$(this);
		me.addClass('colorchecked').siblings().removeClass('colorchecked');
	});
	//清空选项
	$('#resetform').click(function(){
		var form = $(this).parents('form');
		form[0].reset();
		$('input[type=checkbox]',form).prop('checked',false);
		$('.colorchecked').removeClass('colorchecked');
		$('.checkallbox').removeClass('checkallbox');
		return false;
	});
}

//购物车 礼品卡、优惠劵选择
$('.gftcpn .prowrdlst').click(function(){
	var _this=$(this);
	var _parent=_this.parent();
	var _bd=_this.siblings();
	_parent.toggleClass('gftcpn_curr');
});

/*
 * 商品收藏
 *
 * Creator by yang.mq
 */
function Favorites() {
	this.addCallback = undefined;
	this.delCallback = undefined;
	this.addShoppingCartCallback = undefined;
	window._Favorites_Refer = this;
}
Favorites.prototype.addShoppingCart = function(commodityNo){
	var thisObj = $(this);
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: (context + '/addshoppingcart.sc?rnd=' + Math.random()),
		data: {
			'productNum': 1,
			'productNo': ($.type(commodityNo) === 'string' ? commodityNo : thisObj.attr('no'))
		},
		success: function(data, textStatus) {
			var flag = data.flag * 1;
			if(flag > 0){
				if ($.type(window._Favorites_Refer.addShoppingCartCallback) === 'function') {
					window._Favorites_Refer.addShoppingCartCallback.call(this);
				} else {
					YouGouWap.base.showWapTip({
						msg: '加入购物车成功',
						autoHide: true,
						time: 2000
					});
				}
			} else {
				YouGouWap.base.showWapTip({
					msg: data.msg,
					autoHide: true,
					time: 2000
				});
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			YouGouWap.base.showWapTip({
				msg: '服务器内部错误',
				autoHide: true,
				time: 2000
			});
		}
	});
};
Favorites.prototype.add = function(commodityNo){
	var thisObj = $(this);
	$.ajax({
		type: 'post',
		url: (context + '/my/addFavorite.sc?rnd=' + Math.random()),
		dataType: 'html',
		data: {
			'commodityNo': ($.type(commodityNo) === 'string' ? commodityNo : thisObj.attr('no'))
		},
		success: function(data, textStatus) {
			if (data == 'success') {
				if ($.type(window._Favorites_Refer.addCallback) === 'function') {
					window._Favorites_Refer.addCallback.call(this);
				} else {
					YouGouWap.base.showWapTip({
						msg: '加入收藏夹成功',
						autoHide: true,
						time: 2000
					});
				}
			} else{
				YouGouWap.base.showWapTip({
					msg: data,
					autoHide: true,
					time: 2000
				});
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			YouGouWap.base.showWapTip({
				msg: '服务器内部错误',
				autoHide: true,
				time: 2000
			});
		}
	});
};
Favorites.prototype.prepareDelete = function(commodityNo){
	var thisObj = $(this);
	YouGouWap.base.showWapTip({
		title: '提示',
		msg: '确定要取消该商品收藏吗?',
		isOkButton: true,
		okButtonTxt: '取消',
		button: '<span class="btn_org" id="closeTip" onclick="javascript:window._Favorites_Refer.doDelete(&quot;' + thisObj.attr('no') + '&quot;);">确定</span>'
	});
};
Favorites.prototype.doDelete = function(commodityNo){
	var thisObj = $(this);
	$.ajax({
		type: 'post',
		url: (context + '/my/deleteFavorite.sc?rnd=' + Math.random()),
		dataType: 'html',
		data: {
			'commodityNo': ($.type(commodityNo) === 'string' ? commodityNo : thisObj.attr('no'))
		},
		success: function(data, textStatus) {
			if (data == 'success') {
				if ($.type(window._Favorites_Refer.delCallback) === 'function') {
					window._Favorites_Refer.delCallback.call(this);
				} else {
					window.location.reload();
				}
			} else {
				YouGouWap.base.showWapTip({
					msg: data,
					autoHide: true,
					time: 2000
				});
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			YouGouWap.base.showWapTip({
				msg: '服务器内部错误',
				autoHide: true,
				time: 2000
			});
		}
	});
};
Favorites.prototype.loadMore = function(){
	var container = $('.pro_items');
	var depth = parseInt(container.attr('depth')) + 1;
	$.ajax({
		type: 'post',
		url: (context + '/my/moreMyFavorites.sc?rnd=' + Math.random()),
		data: {
			'page': depth,
		},
		success: function(data, textStatus) {
			if ($.trim(data) != '') {
				container.attr('depth', depth);
				container.append(data);
				$('.morelinker').css('display', window._has_next ? 'block' : 'none');
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			YouGouWap.base.showWapTip({
				msg: '服务器内部错误',
				autoHide: true,
				time: 2000
			});
		}
	});
};
if($('.myfavorites').size() > 0){
	var _favorites = new Favorites();
	$('.addshoppingcart').bind('click', _favorites.addShoppingCart);
	$('.delfavorite').bind('click', _favorites.prepareDelete);
	$('.addfavorite').bind('click', _favorites.add);
	$('.loadmorefavorite').bind('click', _favorites.loadMore);
	
}

/*
 * 手机验证
 *
 * Creator by yang.mq
 */
function VerificationCode() {
	this.timerId = null;
	this.millisec = 1000;
	this.phoneRegexp = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/g;
}
VerificationCode.prototype.timer = function(){
	var sec = 59;
	_verificationCode.timerId = window.setInterval(function(){
		$('#getCode').text('已发送..（' + (sec) + 's）');
		if (sec-- <= 0) {
			window.clearInterval(_verificationCode.timerId);
			_verificationCode.timerId = null;
			$('#getCode').text('重新获取验证码（60s）');
		}
	}, _verificationCode.millisec);
};
VerificationCode.prototype.get = function(){
	var phoneNumber = $.trim($('#mobile').val());
	if (_verificationCode.timerId != null) {
		return false;
	} else if (phoneNumber == '') {
		YouGouWap.base.showWapTip({
			msg: '请输入手机号',
			autoHide: true
		});
		return false;
	} else if (!_verificationCode.phoneRegexp.test(phoneNumber)) {
		YouGouWap.base.showWapTip({
			msg: '请输入正确的手机号',
			autoHide: true
		});
		return false;
	} else {
		$.ajax({
			type: 'post',
			url: (context + '/my/getVerificationCode.sc?rnd=' + Math.random()),
			data: {
				'phoneNumber': phoneNumber
			},
			success: function(data, textStatus) {
				if (data == 'success') {
					_verificationCode.timer();
				} else {
					YouGouWap.base.showWapTip({
						msg: data.error.text,
						autoHide: true,
						time: 2000
					});
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				YouGouWap.base.showWapTip({
					msg: '服务器内部错误',
					autoHide: true,
					time: 2000
				});
			}
		});
	}
};
VerificationCode.prototype.verify = function(){
	var verificationCode = $.trim($('#verificationCode').val());
	if (verificationCode == '') {
		YouGouWap.base.showWapTip({
			msg: '请输入验证码',
			autoHide: true
		});
		return false;
	} else {
		$.ajax({
			type: 'post',
			url: (context + '/my/verifyPhoneNumber.sc?rnd=' + Math.random()),
			data: {
				'verificationCode': verificationCode
			},
			success: function(data, textStatus) {
				if (data == 'success') {
					$('#validSuccessTip').show();
				} else {
					YouGouWap.base.showWapTip({
						msg: data.error.text,
						autoHide: true,
						time: 2000
					});
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				YouGouWap.base.showWapTip({
					msg: '服务器内部错误',
					autoHide: true,
					time: 2000
				});
			}
		});
	}
};
if($('#checkmobile')[0]){
	var _verificationCode = new VerificationCode();
	$('#getCode').bind('click', _verificationCode.get);
	$('#submit').bind('click', _verificationCode.verify);
}
/*
 * 用户反馈
 *
 * Creator by yang.jj
 */
if(document.getElementById('submitFeedback')){
	$('#submitFeedback').click(function(){
		if(verifyFeedback())
		{
			$('#formFeedback').submit();
		}
	});
}

//验证用户输入
function verifyFeedback()
{
	var content = $.trim($('#content').val());
	var contact = $.trim($('#contact').val());
	
	if (content == '') {
		YouGouWap.base.showWapTip({
			msg: '请输入反馈内容！',
			autoHide: true
		});
		$('#content').focus();
		return false;
	}
	if (contact == '') {
		YouGouWap.base.showWapTip({
			msg: '请输入联系方式！',
			autoHide: true
		});
		$('#contact').focus();
		return false;
	}
	// utf-8 one chinese character 3 bytes  
	if (900 < content.getBytesLength()) {
		YouGouWap.base.showWapTip({
			msg: '反馈内容不有超过300字',
			autoHide: true
		});
		return false;
	}
	if (!(/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/g.test(contact)
			|| /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/g.test(contact)
			|| /^[1-9][0-9]{4,}$/g.test(contact))) {
		YouGouWap.base.showWapTip({
			msg: '联系方式必需为QQ/邮箱/手机',
			autoHide: true
		});
		return false;
	}
	return true;
}

/*
 * 字符串处理
 *
 * Creator by yang.mq
 */
String.prototype.getBytesLength = function() {
    var bytesLength = 0;
    var charCode;
    for (var i = 0; i < this.length; i++) {
        charCode = this.charCodeAt(i);
        if (charCode < 0x007f)  {
            bytesLength++;
        } else if ((0x0080 <= charCode) && (charCode <= 0x07ff))  {
            bytesLength += 2;
        } else if ((0x0800 <= charCode) && (charCode <= 0xffff))  {
            bytesLength += 3;
        } else{
            bytesLength += 4;
        }
    }
    return bytesLength;
};

//右侧主站导航
if(document.getElementById('mainnav')){
	$('#mainnav').click(function(){
		if($('#ygnavmenu').height()<10){
			$('#ygnavmenu').animate(
				{height:530},
				{
					complete:function(){
						$('#ygnavmenu').css('overflow','visible');}
				}
			);			
		}else{
			$('#ygnavmenu').css('overflow','hidden');
			$('#ygnavmenu').animate({height:0},200);			
		}
		return false;
	});
}
//搜索页更多
if($('#srchFilter')[0]){
	//更多条件
	$('#srchFilter .showmore').click(function(){
		var _this=$(this);
		if(!_this.hasClass('showmore_on')){
			_this.addClass('showmore_on');
			_this.parent().height('auto');
		}else{
			_this.removeClass('showmore_on');
			_this.parent().height('88px');			
		}
	});
	//条件筛选
	$('#srchFilter .box').each(function(){
		var _this = $(this);
		if(_this.find('label').length>10){
			_this.find('.showmore').show();
			_this.height('88px');
		}
	});
	//品牌筛选
	if($('#srchbrand .brandfltr_lst dd').length>10){
		$('#jsMorebrand').show();
		$('#srchbrand .brandfltr_lst').height('310px');
	}
	//更多品牌
	$('#jsMorebrand').click(function(){
		$(this).hide();
		$('#srchbrand .brandfltr_lst').height('auto');
	});
}

/*特卖排行*/
if($('.srch_nav a').length>0){
	$('.srch_nav a').click(function(){
		if($(this).siblings('a').hasClass('on')){
			$(this).removeClass('on').siblings('a').removeClass('on');
			$('.srch_column').hide();
		}else{
			$(this).removeClass('on').siblings('a').addClass('on');
			var index=$(this).index();
			$('.srch_column').hide().eq(index).show();
		}
		return false;
	});
}
/*--------页面底部搜索框----------*/
function footerSearch(form){
	var kword = form.kword.value;
	if(kword.length==0){
		YouGouWap.base.showWapTip({
			msg: '请输入搜索关键词',
			autoHide: true
		});
		return false;
	}
	return true;
}

//特卖弹窗搜索框
function olClickKeyword(kword){
	$("#olKeyword").val(kword);
	document.outletsSearchform.submit(); 
}
//时尚弹窗搜索框
function mallClickKeyword(kword){
	$("#kword").val(kword);
	document.mallSearchform.submit(); 
}

//根据屏幕分辨率，把精选优惠的图片变换成大图
function imgToBig(){
	// 设备像素比
	var dpr = window.devicePixelRatio || 1;
	// 宽度
	var sw = screen.width;
	// 高度
	var sh = screen.height;
	// iOS像素值处理
	if (/iPhone|iPod|iPad/ig.test(navigator.userAgent)) {
		sw *= dpr;
		sh *= dpr;
	}
	if($("#promotionImageUrl").length>0){
		var img = $("#promotionImageUrl");
		if(img.size() > 0 && sw >= 480 && sh >= 800) {
			img.attr("src", img.attr("src").replace("235-99.jpg", "295-130.jpg"));
		}
	}
}

//首页签到
$("#sign").click(function(){
	var url = context + "/my/sign.sc";
	$.get(url, function(data){
		var flag = data.flag*1;
		if(flag >= 0){
			if(flag == 1){
				$("#signtext").text("已签到");
			}
			YouGouWap.base.showWapTip({
				msg:data.msg,
				autoHide:true
			});
		}else{
			alert(data.msg);
		}
	}, "json");
});
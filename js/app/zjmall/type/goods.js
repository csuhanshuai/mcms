/*弹窗*/
var mDialog=function(options){
	var opts = { 
		title:'',
		content:'',
		mask:true,
		jt:false,
		jtposition:'bottom',
		jtright:'9%',
		jtleft:null,
		closable:true,
		fix:true,
		left:'50%',
		right:null,
		top:'50%',
		close:null,
		success:null,
		width:'auto'
	}; 
	opts = $.extend(opts, options || {});
	var popHeight,popWidth;
	var mask=opts.mask;
	var title=opts.title;
	var jt=opts.jt;
	var content=opts.content;
	var closable=opts.closable;
	var fix=opts.fix;
	var _left=opts.left;
	var _right=opts.right;
	var _top=opts.top;
	var _jtposition=opts.jtposition;
	var _jtright=opts.jtright;
	var _jtleft=opts.jtleft;
	var mpop=$('<section class="mpop">');
	var m=$('<div class="mpop_mask">');
	var c=$('<div class="mpop_c">');
	var hd=$('<div class="mpop_c_hd">');
	var clos=$('<span class="mpop_close">');
	var bd=$('<div class="mpop_c_bd">');
	var jtHtml='<i class="jt"></i>';
	
	if(_right==null){c.css({left:_left,top:_top});}
	
	if(mask){
		mpop.append(m);
	}
	if(title){
		hd.append('<h2>'+title+'</h2>');
	}
	if(closable){
		hd.append(clos);
	}
	if(content){
		bd.html(content);	
	}
	c.append(hd).append(bd);
	mpop.append(c);
	$('.screen_wrap').append(mpop);	
	m.width($('.screen_wrap').width());
	if(fix){
		if(_left=='50%'){
			setTimeout(function(){
				popWidth=c.width()/2;
				c.css({'margin-left':-popWidth});
			},0);
		}
		if(_top=='50%'){
			popHeight=c.height()/2;
			c.css({'margin-top':-popHeight});
		}
		c.css('position','fixed');
	}else{
		c.css('position','absolute');
	}
	c.css('width',opts.width);
	if(jt){
		c.append(jtHtml);
		var _jiantou=c.find('.jt');
		_jtleft==null?_jiantou.css('right',_jtright):_jiantou.css('left',_jtleft);
		popHeight=c.height();
		c.css({right:_right,top:_top});
		switch(_jtposition){
			case 'bottom':
			_jiantou.css({'bottom':-11});
			c.css('margin-top',-popHeight-15);
			break;
			case 'top':
			_jiantou.addClass('jt_up').css({'top':-11});
			c.css('margin-top',30);
			break;
		}
	}
	if(!title&&!closable){
		hd.remove();
	}
	
	if(typeof (opts.success)=="function"){
		opts.success();
	}
	
	clos.click(function(){
		if(typeof (opts.close)=="function"){
			opts.close();
		}
		mpop.remove();
	});
}

/*tab切换*/
$.fn.clickTab=function(){
	var _this;
	return this.each(function(){
		_this=$(this);
		var _tabItem=_this.find('.tab_bd .tab_item');
		_this.find('.tab_hd li').click(function(){
			_this=$(this);
			var _index=_this.index();
			_this.addClass('curr').siblings().removeClass('curr');
			var _thisTabCnt = _tabItem.eq(_index);
			_thisTabCnt.removeClass('none').siblings().addClass('none');
			if(_this.attr('ajaxurl')&&_this.attr('ajaxurl')!=''){
				$.get(_this.attr('ajaxurl'),function(d){
					_thisTabCnt.html(d);
					_this.attr('ajaxurl','');
					if(_this.attr('callback')){
						window[_this.attr('callback')]();
					}
				})
			}
			
		});
	});
}
$('.jsTab').clickTab();

//品牌馆
$('.brand_pvln_item .hd').bind('click',function(){
	var _this=$(this);
	var ico=_this.find('.ico_updown');
	var parent=_this.parent('.brand_pvln_item');
	var siblings=parent.siblings('.brand_pvln_item');
	if(parent.hasClass('curr')){
		ico.removeClass('up').addClass('down');
		parent.removeClass('curr');
	}else{
		ico.removeClass('down').addClass('up');
		parent.addClass('curr');
		siblings.removeClass('curr');
		siblings.find('.hd .ico_updown').removeClass('up').addClass('down');
	}
});
//分类查找
$('.subcatsrch_item .item_hd').click(function(){
	$(this).parent().toggleClass('subcatsrch_item_hover');
	$(this).parent().siblings().removeClass('subcatsrch_item_hover');
})
//通过修改样式来显示不同的星级
$(".big_encmmt a").click(function(){
	var _this=$(this);
	var index=_this.index()+1;
	_this.parent().removeClass().addClass("big_encmmt "+"big_encmmt"+index);
	return false;
});


//订单详情页
(function(){
	//选择尺码\颜色
	$('.jsCheckColor a,.jsCheckCm a').click(function(){
		var _this=$(this);
		_this.addClass('checked').siblings().removeClass('checked');
		$('#sizeNo').val(_this.attr('nos'));
		$('#sizeNoArea').html(_this.text())
	});
	//尺码加减
	$('.add').click(function(){
		var val=parseInt($('#inpProNum').val());
		$('#inpProNum').val(val+1)
	});
	$('.plut').click(function(){
		var val=parseInt($('#inpProNum').val());
		if(val<1){val=1}
		$('#inpProNum').val(val-1)		
	});
	//分享弹窗
	var sharePop=$('#sharepop');
	$('.jsIshare').click(function(){
		var jsOptTx_top=$('.jsOptTx').offset().top;
		$('.jsIshare').addClass('curr_ishare');
		mDialog({
			title:'分享',
			content:sharePop.html(),
			jt:true,
			fix:false,
			left:9,
			top:jsOptTx_top,
			success:function(){
				sharePop.remove();
				$('header').css('z-index',101);
			},
			close:function(){
				$('.jsIshare').removeClass('curr_ishare');
				$('header').css('z-index','');
			}
		});
		return false;
	});
	
	//大图弹窗
	var big_pro_img=$('#big_pro_img');
	$('.jsShowBigProImg a').click(function(){
		mDialog({
			content:big_pro_img.html(),
			top:45,
			fix:false,
			mask:false,
			left:0,
			width:'100%',
			success:function(){
				big_pro_img.remove();
				$('header').css('z-index',101);
				$('.jsSmallProImg a').click(function(){
					var _this=$(this);
					var bigImg=_this.find('img').attr('bigImg');
					$('.jsBigProImg img').attr('src',bigImg);
					return false;
				});
				$('.prodtl').hide();
			},
			close:function(){
				$('header').css('z-index','');
				$('.prodtl').show();
			}
		});
		return false;
	});
	//验证
	function checkForm(){
		var arrErr=[];
		if($('#sizeNo').val()==''){
			arrErr.push('请选择尺码!');
		}
		return arrErr.join('');
	}
	//加入购物车
	$('#addShopcart').click(function(){
		var err=checkForm();
		if(err==''){
			/*$.ajax('',function(){
				YouGouWap.base.showWapTip({
					title:'恭喜',
					msg:'已成功加入购物车',
					isOkButton:true,
					okButtonTxt:'继续购物',
					button:'<a href="shopcart.shtml" class="btn_brown">查看购物车</a>'
				});					
			})*/
			YouGouWap.base.showWapTip({
				title:'恭喜',
				msg:'已成功加入购物车',
				isOkButton:true,
				okButtonTxt:'继续购物',
				button:'<a href="shopcart.shtml" class="btn_brown">查看购物车</a>'
			});			
		}else{
			YouGouWap.base.showWapTip({
				title:'温馨提示',
				msg:err,
				isOkButton:true
			});
		}
		return false;
	});
	//收藏
	$('.jsAddFav').click(function(){
		var favurl=$(this).attr('no');
		var thisObj=$(this);
		$.ajax({
			  type: 'POST',
			  dataType: 'html',
			  url: favurl,
			  // data to be added to query string:
			 // data: { name: 'Zepto.js' },
			  // type of data we are expecting in return:
			  //dataType: 'json',
			  timeout: 50000,
			  //context: $('body'),
			  success: function(data){
			    // Supposing this JSON payload was received:
			    //   {"project": {"id": 42, "html": "<div>..." }}
			    // append the HTML to context object.
			    //this.append(data.project.html)
				if (data == 'success') {
					YouGouWap.base.showWapTip({
						msg:'收藏成功',
						autoHide:true					
					});
					thisObj.addClass('collect_hover');
				}
			  },
			  error: function(xhr, type){
			    alert('Ajax error!');
			  }
			});
	});
})();

	//加载评论
	function bindComment(){
		$('#morecomment span').bind('click',function(){
			var morecomment=$('#morecomment'),curPage = morecomment.attr('curpage');
			
			$.get(morecomment.attr('ajaxUrl')+'&page='+curPage,function(d){
				if(d!=''){
					$(d).insertBefore(morecomment);
					morecomment.attr('curpage',parseInt(curPage)+1);
				}
				if(curPage == morecomment.attr('totalpage')){
					morecomment.html('已全部显示');
				}
			});
		});			
	}
(function(){
	//订单详情-取消订单
	var _cancelOrderPop=$('#cancelOrderPop');
	function resetOrderUi(tart){
		$('header').css('z-index','');
		tart.css({'color':'','position':'','z-index':''});
	}
	$('.jsCancelOrder').click(function(){
		var _this=$(this);
		var _top=_this.offset().top;
		var _width=_this.width()/2;
		mDialog({
			title:'取消订单原因',
			content:_cancelOrderPop.html(),
			jt:true,
			jtposition:'top',
			fix:false,
			jtright:_width-12,
			right:20,
			top:_top,
			success:function(){
				_cancelOrderPop.remove();
				$('header').css('z-index',101);
				_this.css({'color':'#fff','position':'relative','z-index':103});
				$('.jsCancleBtn').click(function(){
					$('.mpop').remove();
					resetOrderUi(_this);
					return false;
				});
			},
			close:function(){
				resetOrderUi(_this);
			}
		});
		return false;
	});
	
	//订单详情-选择支付方式
	var _sltPayTypePop=$('#sltPayTypePop');
	$('.jsSltPayType').click(function(){
		var _this=$(this); 
		var _top=_this.offset().top;
		var _width=_this.width()/2
		mDialog({
			title:'选择支付方式',
			content:_sltPayTypePop.html(),
			jt:true,
			jtposition:'top',
			fix:false,
			jtright:_width-10,
			right:20,
			top:_top+15,
			success:function(){
				_sltPayTypePop.remove();
				$('header').css('z-index',101);
				_this.css({'position':'relative','z-index':103});
			},
			close:function(){
				$('header').css('z-index','');
				_this.css({'position':'','z-index':''});
			}
		});
		return false;
	});

})();


(function(){
	var _modifyAddrPop=$('#modifyAddrPop');
	$('.jsModifAddr').click(function(){
		var _this=$(this);
		var _top=_this.offset().top;
		var _width=_this.width()/2;
		mDialog({
			title:'修改收货地址',
			content:_modifyAddrPop.html(),
			jt:true,
			jtposition:'top',
			fix:false,
			jtleft:_width,
			left:12,
			top:_top+15,
			success:function(){
				_modifyAddrPop.remove();
				$('header').css('z-index',101);
				_this.css({'position':'relative','z-index':103});
			},
			close:function(){
				$('header').css('z-index','');
				_this.css({'position':'','z-index':''});
			}
		});
		return false;
	});
	
	$(function(){
		$('.jsModifyAddrHd').click(function(){
			var _this=$(this);
			var _parent=_this.parent();
			var _bd=_this.siblings();
			_parent.addClass('gftcpn_curr');
			return false;
		});
		$('.jsModifyAddrLst .areacheck').click(function(){
			var _this=$(this);
			var _parent=_this.parent();
			var _name=_parent.find('.jsName').html();
			var _phone=_parent.find('.jsPhone').html();
			var _addr=_parent.find('.jsAddr span').html();
			$('.jsModifyAddrHd .tt').html(_name+'&nbsp;'+_phone+'<br />'+_addr);
			_parent.parents('.modify_addr').removeClass('gftcpn_curr');
		});
	});
})();

//倒计时
function countDown(time,type,targ){
	var i=time;
	setInterval(function(){
		i-=1;
		targ.html(i);
		if(i<=1){
			switch (type){
				case 0:
					window.history.go(-1);
				case 1:
					window.location.href= (context + '/my/myIndex.sc');
				break;
			}
		}
	},1000);
}


//10秒倒计时刷新页面
if($('.jsTimeCountDown')[0]){
	var _targ=$('.jsTimeCountDown');
	countDown(10,0,_targ);
}

//5秒后进入个人中心
if($('#regSuccess')[0]){
	var _targ=$('#regSuccess');
	countDown(5,1,_targ);
}

//商品详情页倒计时
function timeDown(times,targ){
	var i=times;
	var looper = setInterval(function(){
		i-=1000;
		if(i < 0){
			clearInterval(looper);
			return;
		}
	   var  leftDay = Math.floor(i/(60*60*24*1000));
	   var  remain = i%(60*60*24*1000);
	   var leftHour = Math.floor(remain/(60*60*1000));
	   remain = remain%(60*60*1000);
	   var  leftMinute = Math.floor(remain/(60*1000));
	   remain = remain%(60*1000);
	   var  leftSecond = Math.round(remain/1000);
		targ.text("还剩"+ leftDay +"天"+ leftHour +"小时"+ leftMinute +"分钟" + leftSecond +"秒");
	},1000);
}

//商品详情页倒计时
if($('#commodityinfoTime')[0]){
	var times=$('#commodityinfoTime').attr('data')*1;
	timeDown(times,$('#commodityinfoTime'));
}












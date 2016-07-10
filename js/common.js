// JavaScript Document
//author:wushiwei
//2011-2-16
//左边栏的开和关
function ge(e){return document.getElementById(e);}
function cl_lfbar_a(){
	var fxw=document.body.scrollWidth;
	ge("navifr").style.display="none";
	ge("conifr").style.width="99%";
	ge("closelfbar").className="close-st1";
	ge("openlfbar").className="open-st2";
	opflag = 1;
}
function op_lfbar_a(){
	var fxw=document.body.scrollWidth;
	ge("navifr").style.display="block";
	ge("conifr").style.width=parseInt(((fxw-145)/fxw)*100)+"%";
	ge("openlfbar").className="open-st1";
	ge("closelfbar").className="close-st2";
	opflag = 0;
}

//列表页，商品列表鼠标经过效果和编辑按钮的现实和隐藏
	$(document).ready(function(){
		$(".div-pl-list").removeClass("cl-change");
	    $.each($(".div-pl-list"), function(){
			$(this).hover(function(){
				$(this).addClass("cl-change");
				$(this).find("span").show();
				//$(this).next().toggle();
			},function(){
				$(".div-pl-list").removeClass("cl-change");
				$(this).find("span").hide();
				});
		});
	});
//列表页，标题鼠标经过效果
	$(document).ready(function(){
		$(".pl-tt-td").removeClass("cl-change");
	    $.each($(".pl-tt-td"), function(){
			$(this).hover(function(){
				$(this).addClass("cl-change");
				
				//$(this).next().toggle();
			},function(){
				$(".pl-tt-td").removeClass("cl-change");
				
				});
		});
	});
	
//左边栏，导航选中时，样式变化效果
$(document).ready(function(){
	    $.each($("#lf_bar ul li a"), function(){
			$(this).click(function(){
				$("#lf_bar ul li a").not($(this)).removeClass("nav-select");
				$(this).addClass("nav-select");
				//$(this).next().toggle();
			});
		});
	});
	
//	
//控制左边栏自适应高度
function reinitifH(){
    var iframe = parent.document.getElementById("mbdif");
	var iframe2 = parent.document.getElementById("lfbarif");
	var miniH=(window.screen.height)/2+100;
    try{
    	var bHeight = iframe.contentWindow.document.body.scrollHeight;
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		var height = Math.max(bHeight, dHeight);
	//alert(height);
	if(height<=miniH){
		iframe.height =  miniH;
		}else{
		iframe.height =  height;
		iframe2.height =  height;
	}
	if(height<=800){
			window.frames["lfbarif"].document.getElementById("lf_bar").style.height="800px";
			iframe2.height =  800;
		}else{
			window.frames["lfbarif"].document.getElementById("lf_bar").style.height=height+"px";
			}
    }catch (ex){}
}
	
//控制主体框宽度
function resetW(){
	var fxw=document.body.scrollWidth;
	if(document.getElementById("conifr").style.width=="99%"){document.getElementById("conifr").style.width="99%";
	}else{
		document.getElementById("conifr").style.width=parseInt(((fxw-145)/fxw)*100)+"%";
		}
	}
	
//商品添加---商品图片位置互换
function imgleftscroll(){
	var imgnum=document.getElementById("imgcontiner").getElementsByTagName("img").length;
	var piclistCuPo=parseInt(document.getElementById("imgcontiner").style.left);
	if(piclistCuPo==(-(imgnum-6)*122)){
		document.getElementById("leftgobtn").style.display="none";
		}else if(piclistCuPo>(-(imgnum-5)*122)){
			document.getElementById("leftgobtn").style.display="block";
			document.getElementById("rightgobtn").style.display="block";
			}
	if(piclistCuPo==(-(imgnum-5)*122)){}else{
 	var imgPositionUpdate=piclistCuPo-122;
 	var imgLeft=imgPositionUpdate+"px";
 	document.getElementById("imgcontiner").style.left=imgLeft; 
	}
	}
function imglrightscroll(){
	var imgnum=document.getElementById("imgcontiner").getElementsByTagName("img").length;
	var piclistCuPo=parseInt(document.getElementById("imgcontiner").style.left);
	if(piclistCuPo==0){
		document.getElementById("rightgobtn").style.display="none";
		}else if(piclistCuPo<0){
			document.getElementById("rightgobtn").style.display="block";
			document.getElementById("leftgobtn").style.display="block";
			}
 	if(piclistCuPo==0){}else{
 	var imgPositionUpdate=piclistCuPo+122;
 	var imgLeft=imgPositionUpdate+"px";
 	document.getElementById("imgcontiner").style.left=imgLeft; 
	}
}
//商品名修改--弹出可编辑宽
$(document).ready(function(){
bindClick();
});
function bindClick()
{
	var proNameOld="天美意2010夏季黑色胎水牛泡泡龙男鞋";
	$(".pl-name-dt font").click(function(){ 
		$(this).parent().replaceWith('<textarea id="textEditor" onblur="rplaceResult(this)">'+proNameOld+'</textarea>'); 
		//$("#textEditor").focus();
	});
	$(".pl-name-dt span").click(function(){ 
		$(this).parent().replaceWith('<textarea id="textEditor" onblur="rplaceResult(this)">'+proNameOld+'</textarea>'); 
		//$("#textEditor").focus();
	}); 
}
//商品名修改--保存修改结果
function rplaceResult(y){
	var proNameNew="天美意2010夏季黑色胎水牛泡泡龙男鞋";
	y.parentNode.innerHTML='<a href="#"><font>'+proNameNew+'</font><span class="num-editor" onclick="rplacearea(this)"><img src="images/pen.gif" alt=""></span></a>';
	bindClick();
		  }
//打开和关闭层
function closediv(x){
	document.getElementById(x).style.display="none";
	reinitifH();
	}
function opendiv(y){
	document.getElementById(y).style.display="block";
	reinitifH();
	}
//
function resetH(){
	parent.document.getElementById("mbdif").height=10;
	reinitifH();
	}
//库存修改---弹出修改层
function totalStock(z){
	var totleStockNum=120;
	z.parentNode.innerHTML='<font>20</font><div class="stock-totle absolute"><div class="stock-totle-tr1">总库存：'+totleStockNum+'</div><ul><li class="stock-totle-tr2">黑色/37：<input type="text" /></li><li class="stock-totle-tr2">黑色/37：<input type="text" /></li><li class="stock-totle-tr2">黑色/37：<input type="text" /></li><li class="stock-totle-tr2">黑色/37：<input type="text" /></li><li class="stock-totle-tr2">黑色/37：<input type="text" /></li><div class="divH30"></div><li class="btn-text"><input type="button" value="保存" onclick="saveStock(this)"/><input type="button" class="reset-btn" onclick="resetStock(this)" value="取消"/></li></ul</div>';
	//document.getElementById("mbdif").height=10;
	reinitifH();
	}

//库存修改---不修改
function resetStock(a){
	a.parentNode.parentNode.parentNode.parentNode.innerHTML='<font>20</font><span class="num-editor" onclick="totalStock(this)"><img src="images/pen.gif" alt=""></span>';
	resetH();
	}
//库存修改---保存修改
function saveStock(b){
	b.parentNode.parentNode.parentNode.parentNode.innerHTML='<font>20</font><span class="num-editor" onclick="totalStock(this)"><img src="images/pen.gif" alt=""></span>';
	resetH();
	}
//列表页，商品列表鼠标经过效果和编辑按钮的现实和隐藏
	$(document).ready(function(){
	    $.each($(".div-pl-list"), function(){
			$(this).click(function(){
				$(".div-pl-list").not(this).children(".kucun").empty();
				$(".div-pl-list").not(this).children(".kucun").append('<div class="stock-num"><font>20</font><span class="num-editor" onclick="totalStock(this)"><img src="images/pen.gif" alt=""></span></div>');
				
			});
		});
	});
/*============================
文件说明：弹出层脚本
创建时间：2010-05-20
作者:KILLHAPPY
============================*/
function getScroll(){
	var top = 0;
	if (document.documentElement && document.documentElement.scrollTop)
	{  
		top=document.documentElement.scrollTop;   
	}
	else if (document.body) {
		top=document.body.scrollTop;
	}
		return 	top
}
//弹出层
function Pop_Layer(UrI,MarTop,MarLeft){  //MarTop为弹出元素相对于当前元素的Top值,MarLeft为弹出元素相当于当前元素的Left值
	$.get(UrI, function(data){
		//var PopDiv = '<div id="MarDiv" style="filter:Alpha(Opacity=20, Style=0); opacity:0.20; background:#000; z-index:8888; display:block;position:absolute;left:0;top:0;"></div>'
		$('<div id="PopLayer">')
		.css({position:"absolute"})
		.appendTo("body")
		document.getElementById("PopLayer").innerHTML = data;
		document.getElementById("PopLayer").style.zIndex=5;
		var cLWidth = document.documentElement.clientWidth/2;
		var cLHeight = document.documentElement.clientHeight/2;
		//alert(cLWidth)
		//alert(cLHeight)
		var PopDivWidth = $(".popReleasePtBox").width()/2;
		var PopDivHeight = $(".popReleasePtBox").height()/2;
		//alert(PopDivWidth)
		//alert(PopDivHeight)
		var Mar_Top = cLHeight - PopDivHeight
		var Mar_Left = cLWidth - PopDivWidth
		//alert(Mar_Left)
		var browser=navigator.appName 
        var b_version=navigator.appVersion 
        var version=b_version.split(";"); 
        var trim_Version=version[1].replace(/[ ]/g,""); 
		if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0"){
		document.getElementById("PopLayer").style.top = Mar_Top + getScroll() + 'px'
		document.getElementById("PopLayer").style.left = 0 + 'px'
		//document.getElementById("PopLayer").style.display = "block"
		}
		else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0"){
		document.getElementById("PopLayer").style.top = Mar_Top + getScroll() + 'px'
		document.getElementById("PopLayer").style.left = 0 + 'px'		
		}
		else{
		document.getElementById("PopLayer").style.top = Mar_Top + getScroll() + 'px'
		document.getElementById("PopLayer").style.left = Mar_Left + 'px'
		}
		$(window).scroll(function(){
			$("body").find("#PopLayer").css({top:getScroll()+Mar_Top})
		});
		$(".close").click(
			function(){
				$("#PopLayer").remove();
			}
		)
	}); 
} 




//修改表单文本框样式
$(document).ready(function(){
$('.contentMain input[type=text]').addClass('input-text');
//$('.wms input[type=button]').attr('style','border:none;height:24px;line-height:24px;');
$('.contentMain select:not(.mult-select)').addClass('input-select');
});


//设置表格隔行换颜色
$(document).ready(function() {
	$(".ytweb-table tr").mouseover(function() {
		$(this).addClass("over");
	}).mouseout(function() {
		$(this).removeClass("over");
	})
});

// 模态对话框初始化
(function() {
	try {
		var d = art.dialog.defaults;
		d.lock = true;
		d.skin = [ 'aero' ];// 预缓存皮肤，数组第一个为默认皮肤
		d.plus = true;
		d.height = 30;
		d.effect = false; // 是否开启特效
		d.showTemp = 0;
	} catch (err) {
	}
})();



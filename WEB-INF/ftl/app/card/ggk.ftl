<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>刮刮乐</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${BasePath}/css/card/main.css">
<script type="text/javascript"  src="${BasePath}/js/jquery-1.4.2.min.js" ></script>
<style>
#logo_container{ absolute;background:url(../gameImg/logo.png) center top no-repeat; height:210px;}
</style>



	<meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
	
</head>
<body>	


  <div id="container">    
      

   <div  style="position: relative;height:210px; width:330px;margin-left:auto;margin-right:auto;" >
	<img style="position:absolute;left:0px;top:0px;width:100%;height:100%;z-Index:-1;" src="${BasePath}/${background?default("")}"/>
	 <div style="position: absolute;z-index:2;left:100px;top:160px;">
	 <canvas id="main" style="width:80px;height:40px;">
	 </canvas>
	 </div> 
  </div>
 
 <#if over??>
 
 <#else>
<div  style="position:relative;top:5px; width:330px;margin-left:auto;margin-right:auto;">
  
<article style="margin-bottom:6px;">
<form action="${BasePath}/card/zjminweb/toPrizeInfo.kq?openid=${openid?default("")}" name="qcust" id="qcust" method="post">
    <article style="margin-top:10px;">
<table width="100%" border="0">
  <tr>
    <td><#if numberover?? && numberover == '1'><input type="button" class="red" value="次数已用完"><#else><input type="button" class="red"  id="go" value="再来一次"></#if></td>
   
<#if but??> <td><input type="submit" class="red" value="中奖纪录"></td></#if>
  </tr>
</table>

     </article>
	</form>
	

</article>
	<article class="intro">
		<h1 style="width:50%;">奖品设置：</h1>
		<#if prize??>
			<#list prize as item>	
			<p>${item}</p>
			</#list>
		</#if>
	      	
   </article>
	
   <article class="intro">
		<h1 style="width:50%;">活动说明：</h1>
		<#if activityExplain??>
			<#list activityExplain as item>	
			<p>${item}</p>
			</#list>
		</#if>
   </article>
   <article class="intro">
		<h1 style="width:50%;">活动时间：</h1>
		<p>${time}</p>
	      	
   </article>
</div>
</#if>
	

<div id= "tip"  style="position:relative;top:5px; width:330px;margin-left:auto;margin-right:auto;display:none;">
   <article class="intro">
		<h1 style="width:50%;"> 温馨提示：</h1>
	        	<br> 
		<p align="center">
			    5次机会已用完！ 去看看自己的奖品吧！
		</p>
			<br>
			    <p align="center">
			   <a  href="${BasePath}/card/toPrizeInfo.kq?openid=${openid}">
			    <input type="button" class="red" id="go" value="确定"> 
			    </a></p>
   </article>
</div>
</div>	

</body>

<script type="text/javascript">

	
		<#if over??>
		//刮卡结束
		//alert("5次机会已用完！"+String.fromCharCode(10)+"去看看自己的奖品吧！");
		 document.getElementById("tip").style.display="block";

		<#else>
		
		$('document').ready(function(){
	
	var backimage = { 'url':'${BasePath}/${path?default("")}', 'img': null };
	// 修改图片的名称和路径
	var canvas = {'temp': null, 'draw': null}; 
	var mouseDown = false;	
	
	// canvas 合成	
	function recompositeCanvases() {
	
		var main = document.getElementById('main');
		var tempctx = canvas.temp.getContext('2d');
		var mainctx = main.getContext('2d');
		
		// clear the temp
		canvas.temp.width = canvas.temp.width;
		
		// 把 canvas.draw 覆蓋到 drawImage 上
		tempctx.drawImage(canvas.draw, 0, 0);
		
		// 以 source-atop 的方式把 backimage 畫到 tempctx 上
		tempctx.globalCompositeOperation = 'source-atop';
		tempctx.drawImage(backimage.img, 0, 0);
		
		// mainctx => 灰色前景 (還沒有刮掉的地方)
		mainctx.fillStyle = "#888";
		mainctx.fillRect(0, 0, backimage.img.width, backimage.img.height);
		
		// 最後把 canvas.temp 覆蓋到 mainctx 上
		mainctx.drawImage(canvas.temp, 0, 0);
	}
	
	// 畫線
	function scratch(canv, x, y, fresh) {
		
		var ctx = canv.getContext('2d');		
		// 畫筆大小, 形狀...
		ctx.lineWidth = 55;
		ctx.lineCap = ctx.lineJoin = 'round';
		
		if (fresh) {
			ctx.beginPath();
			// 為了模擬滑動，所以在 x 加上 0.01，不然點一下不會產生反應
			ctx.moveTo(x+0.01, y);
		}
		ctx.lineTo(x, y);
		ctx.stroke();
	}

	function setupCanvases() {
		var c = document.getElementById('main');
		
		// 取得圖片長寬
		c.width = backimage.img.width;
		c.height = backimage.img.height;

		canvas.temp = document.createElement('canvas');
		canvas.draw = document.createElement('canvas');
		
		canvas.temp.width = canvas.draw.width = c.width;
		canvas.temp.height = canvas.draw.height = c.height;

		recompositeCanvases();
	 
		function mousedown_handler(e) {
			var local = getLocalCoords(c, e);
			mouseDown = true;

			scratch(canvas.draw, local.x, local.y, true);
			recompositeCanvases();

			if (e.cancelable) { e.preventDefault(); } 
			return false;
		};
	 
		function mousemove_handler(e) {
			if (!mouseDown) { return true; }

			var local = getLocalCoords(c, e);

			scratch(canvas.draw, local.x, local.y, false);
			recompositeCanvases();

			if (e.cancelable) { e.preventDefault(); } 
			return false;
		};

		function mouseup_handler(e) {
			if (mouseDown) {
				mouseDown = false;
				if (e.cancelable) { e.preventDefault(); } 
				return false;
			}

			return true;
		};

		// mouse handlers
		c.addEventListener('mousedown', mousedown_handler, false);
		c.addEventListener('touchstart', mousedown_handler, false);

		window.addEventListener('mousemove', mousemove_handler, false);
		window.addEventListener('touchmove', mousemove_handler, false);

		window.addEventListener('mouseup', mouseup_handler, false);
		window.addEventListener('touchend', mouseup_handler, false);
	}

	// 取得座標
	function getLocalCoords(elem, ev) {
		var ox = 0, oy = 0;
		var first;
		var pageX, pageY;
	 
		while (elem != null) {
			ox += elem.offsetLeft;
			oy += elem.offsetTop;
			elem = elem.offsetParent;
		}

		if (ev.hasOwnProperty('changedTouches')) {
			first = ev.changedTouches[0];
			pageX = first.pageX;
			pageY = first.pageY;
		} else {
			pageX = ev.pageX;
			pageY = ev.pageY;
		}

		return { 'x': pageX - ox, 'y': pageY - oy };
	}

	// 動態生一個 img 出來
	backimage.img = document.createElement('img'); 
	backimage.img.addEventListener('load', setupCanvases, false);
	backimage.img.src = backimage.url;

	// reset
	$('#resetbutton').bind('click', function() {
		canvas.draw.width = canvas.draw.width;
		recompositeCanvases();
		return false;
	});	
	
	$("#go").click(function(){
	 		
	 				window.location.reload();
				
			});
	
});
	</#if>




document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	//var _share_img = $('body img:eq(0)').attr("src");
	//if(typeof(_share_img) == "undefined") _share_img = "http://weixin.shike001.com/source/modules/site/icon.jpg";
	
	var titletxt="翼起看世界杯！翼起赢大奖！";
	var contenttxt="参加游戏有机会获取电信红包！心动不如行动，怒点全文查看吧！";
	var _share_img="http://123.249.23.230:8080/zy/gameImg/logo.png";
		var arrayObj ="http://mp.weixin.qq.com/s?__biz=MzA3OTcxMjkwMA==&mid=200289723&idx=1&sn=b97475269ab7ec8dc7e4be3ee3c748c4#rd|http://mp.weixin.qq.com/s?__biz=MzA4OTcxMTgwNg==&mid=200322108&idx=1&sn=a9021bf26bc5d0453bb8acdcf6d25982#rd|http://mp.weixin.qq.com/s?__biz=MzA4MjczNjAwMA==&mid=200203935&idx=1&sn=0ab793faa5366a7a6d3fffba4116997d#rd|http://mp.weixin.qq.com/s?__biz=MzA3MzczNDAxNg==&mid=200331189&idx=1&sn=07f8f896c8f759a3ed10793e8f75350f#rd|http://mp.weixin.qq.com/s?__biz=MzA4MzczNDcwMA==&mid=200376446&idx=1&sn=5b6bbe85c1f643d3081293bf3e0abb23#rd|http://mp.weixin.qq.com/s?__biz=MzA5NTY4ODYyOQ==&mid=200212210&idx=1&sn=8be22a8804bcf9aebbfc38b959ddc97b#rd";
	var arr=arrayObj.split("|");
	var i=Math.floor(Math.random() * 5);
	
	var url=arr[i];
	
	
	window.shareData = {
		"imgUrl": _share_img,
		"timeLineLink":   url,
		"sendFriendLink":url,
		"weiboLink":url,
		"tTitle": titletxt,
		"tContent":contenttxt ,
		"fTitle": titletxt,
		"fContent":  contenttxt,
		"wContent": titletxt,
		"pContent": contenttxt

	};

	// 发送给好友
	WeixinJSBridge.on('menu:share:appmessage', function (argv) {
		WeixinJSBridge.invoke('sendAppMessage', {
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.sendFriendLink,
			"desc": window.shareData.pContent,
			"title": window.shareData.fTitle
		}, function (res) {
			_report('send_msg', res.err_msg);
		})
	});

	// 分享到朋友圈
	WeixinJSBridge.on('menu:share:timeline', function (argv) {
		WeixinJSBridge.invoke('shareTimeline', {
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.timeLineLink,
			"desc": window.shareData.tContent,
			"title": window.shareData.tTitle
		}, function (res) {
			_report('timeline', res.err_msg);
		});
	});

	// 分享到微博
	WeixinJSBridge.on('menu:share:weibo', function (argv) {
		WeixinJSBridge.invoke('shareWeibo', {
			"content": window.shareData.wContent,
			"url": window.shareData.weiboLink
		}, function (res) {
			_report('weibo', res.err_msg);
		});
	});
}, false);


</script>
</html>
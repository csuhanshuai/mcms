<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=1;" name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
    <script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>

<style type="text/css">
	#mcover{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0, 0, 0, 0.7);display:none;z-index:20000;}
	#mcover img{position:fixed;right: 18px;top:5px;width:260px;height:180px;z-index:20001;}
	.share button {
	    background-color: #E8E8E8;
	    background-image: linear-gradient(to top, #DBDBDB, #F4F4F4);
	    border: 1px solid #ADADAB;
	    border-radius: 3px;
	    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.45), 0 1px 1px #EFEFEF inset;
	    color: #000000;
	    font-size: 16px;
	    padding: 8px 0;
	    text-align: center;
	    text-shadow: 0.5px 0.5px 1px #FFFFFF;
	    width: 100%;
	}
	.share img {
	    border: 0 none;
	    height: 22px !important;
	    vertical-align: top;
	    width: 22px !important;
	}
	.share .share-1 {
	    display: block;
	    float: left;
	    width: 49%;
	}
	.share .share-2 {
	    display: block;
	    float: right;
	    width: 49%;
	}
	.fn-clear:after {
	    clear: both;
	    content: " ";
	    display: block;
	    font-size: 0;
	    height: 0;
	    visibility: hidden;
	}
	.share {
	    color: #727272;
	    display: block;
	    font-size: 14px;
	    margin: 15px 0;
	    word-wrap: break-word;
	}
	body{max-width: 680px;margin: auto;background-color:#FFFFFF;}
	img{width:100%;margin: auto;}
	.r_nav{background:url(../images/global/nav-bg.png) right no-repeat; height:40px;/* overflow:hidden;*/}
	.r_con_wrap{background:#fff; padding:5px; padding-top:5px; padding-bottom:1px; min-height:20px;}
	.submit input{height:30px; line-height:30px; background:url(../images/global/ok-btn-bg.jpg); border:none; border-radius:8px; color:#fff; width:145px; font-size:14px;}
  
header {
    background: none repeat scroll 0 0 #ff6699;
    color: #fff;
    height: 44px;
    line-height: 43px;
    position: relative;
}
  </style>

  </head>
  <body>

<div id="iframe_page" style="max-width: 480px;margin: auto;">
<#if  article??>
		<div class="iframe_content"  style="padding:1px 1px;">
			<header>
				<h2 class="title" id="tit">&nbsp;${article.title}</h2>
			</header>
		
			<div   class="r_con_wrap">
				<table border="0" cellpadding="1" cellspacing="0">
				
				 <tr>
				
				   
				  <td> ${article.content}</td>
			      
				   </tr>
			 </table>
			 </div>
		</div>
		<div class="share fn-clear">
			<div class="share-1">
				<button onclick="$('#mcover').show()" class="button">
					<img src="${BasePath}/images/share/icon_msg.png">&nbsp;发送给朋友
				</button>
			</div>
			<div class="share-2">
				<button onclick="$('#mcover').show()" class="button">
					<img src="${BasePath}/images/share/icon_timeline.png">&nbsp;分享到朋友圈
				</button>
			</div>
		</div>
<#else>
<div  style="text-align:center;" >
			<font size=5>您访问的资源已删除或不存在！</font>
</div>
</#if>
</div>
<!-----------------         分享                   ------------------------------->

<div onclick="$(this).hide()" id="mcover" style="display: none;">
<img src="${BasePath}/images/share/guide.png"></div>
<script>
  $(function() {
        if (!navigator.userAgent.match(/Android/i)) {
            $(".contacts").click(function() {
                $('#mcover').show();
                return false;
            });
        }
    });
</script>

<script type='text/javascript' >


document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	var _share_img = $('body img:eq(0)').attr("src");
	if(typeof(_share_img) == "undefined") _share_img = "${BasePath}/images/share/share.jpg";
	var contenttxt="${article.title}";
	var titletxt="${article.title}";
	var url="${domain}/${article.url}";	
	window.shareData = {
		"imgUrl": _share_img,
		"timeLineLink":  url,
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
			"title":window.share.DatatTitle
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

	
	function onBridgeReady(){
 WeixinJSBridge.call('showOptionMenu');
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



</body>

</html>

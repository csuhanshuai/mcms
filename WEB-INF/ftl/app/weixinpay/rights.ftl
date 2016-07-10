<!DOCTYPE html>
<html>
<head>
<title>用户维权处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=1;" name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
    
    <style type="text/css">
		body{max-width: 680px;margin: auto;background-color:#FFFFFF;}
		img{width:100%;margin: auto;}
		.r_nav{background:url(../images/global/nav-bg.png) right no-repeat; height:40px;/* overflow:hidden;*/}
		.r_con_wrap{background:#fff; padding:5px; padding-top:5px; padding-bottom:1px; min-height:20px;}
		.submit input{height:30px; line-height:30px; background:url(../images/global/ok-btn-bg.jpg); border:none; border-radius:8px; color:#fff; width:145px; font-size:14px;}
  </style>

  </head>
  <body>

<div id="iframe_page" style="max-width: 480px;margin: auto;">
<#if  MsgType=="request">
		<div class="iframe_content"  style="padding:1px 1px;">
			
		
			<div   class="r_con_wrap">
				<table border="0" cellpadding="1" cellspacing="0">
				<tr>
				<td><B>${Reason?default('')}</B></td>
				</tr>
				 <tr>
				
				   
				  <td> ${Solution?default('')}</td>
				 <td> ${ExtInfo?default('')}</td>
				   </tr>
			 </table>
			 </div>
		</div>
<#else>
<div  style="text-align:center;" >
			<font size=5>您访问的资源不存在！</font>
</div>
</#if>
</div>
</body>

</html>

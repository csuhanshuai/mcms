<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />

<#include "system-include.ftl" >
<script type="text/javascript"  src="${BasePath}/js/common/Scripts/swfobject_modified.js"></script>

<script type="text/javascript">
	  $(document).ready(function(){
	       $(".popup-nav").hide();
	     $.each($(".topnav-more"), function(){
			$(this).hover(function(){
				//$(".popup-nav").slideToggle(500);
				$(".popup-nav").not(jQuery(this).next()).slideUp();
				$(this).next().slideToggle(500);
			});
			});
	  });
	  $(document).ready(function(){
	     $.each($(".popup-nav"), function(){
			$(this).hover(function(){
				//$(this).next().toggle();
			},function(){
				$(this).slideUp(500);
				//$(this).next().toggle();
			});
			});
	  });
	  
	  function reloadCode(){
			var verify=document.getElementById('imgValidateCode');
			verify.setAttribute('src','${BasePath}/servlet/imageValidate?rand='+Math.random());
		}
    
    
  	var config={form:"loginForm",submit:submitForm,
 	fields:[
		{name:'loginName',allownull:false,regExp:"name",defaultMsg:null,focusMsg:null,errorMsg:'',rightMsg:'',msgTip:'loginNameTip'}
	]}
  
  	Tool.onReady(function(){
		var f = new Fv(config);
		f.register();
	});
  	
  	/**
  	 * 提交表单
  	 */
  	function submitForm(){
  		return true;
  	}
  	
</script>
    
    
	<title>奇新时代后台登录</title>
</head>

<body>
<div class="cont-index">
	<div class="head-index head">
		<div class="logo ft-fm-bk relative">
			<span class="ft-cl-r ft-sz-36">奇新时代后台系统</span>
		</div>
		<div class="hdrt ft-sz-12">
			<div class="topnav">
				<div class="topnavlk ft-cl-Exp relative">
					
				</div>
				<div class="topnav-lfbg"><img src="${BasePath}/images/ecsystem/topnavbglf.gif" alt="" /></div>
			</div>
		</div>
	</div>
    <div class="index-divspr"></div>
	<div class="yt-content">
    	<div class="bannerArea">
        	<div class="banner"><img src="${BasePath}/images/ecsystem/banner.jpg" alt="banner" /></div>
            <div class="weather-x">
           	  <div class="weather"><iframe scrolling="no" height="50" frameborder="0" width="456" vspace="0" hspace="0" marginheight="0" marginwidth="0" src=""></iframe>
                </div>
<div style="display: none;" class="date">
      				<p><a href="#">2009年11月30日</a><a href="#">周一</a><a href="#">运程</a></p>
      				<p class="t_c"><a href="#">农历十月十四日</a><a href="#">黄历</a><a class="fB" href="#">闹钟</a></p>
    			</div>
                <div class="time">
                  <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="85" height="30">
                    <param name="movie" value="${BasePath}/images/ecsystem/clock_4[1].swf" />
                    <param name="quality" value="high" />
                    <param name="wmode" value="transparent" />
                    <param name="swfversion" value="6.0.65.0" />
                    <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                    <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
                    <!--[if !IE]>-->
                    <object type="application/x-shockwave-flash" data="images/ecsystem/clock_4[1].swf" width="85" height="30">
                      <!--<![endif]-->
                      <param name="quality" value="high" />
                      <param name="wmode" value="transparent" />
                      <param name="swfversion" value="6.0.65.0" />
                      <param name="expressinstall" value="Scripts/expressInstall.swf" />
                      <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
                      <div>
                        <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
                        <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/ecsystem/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33" /></a></p>
                      </div>
                      <!--[if !IE]>-->
                    </object>
                    <!--<![endif]-->
                  </object>
              </div>
          </div>
        </div>
        <div class="loginArea">
        	<form action="login.kq" method="post"  name="loginForm" id="loginForm" >
        		<input type="hidden" name="PrivateFromSubmitKey"  value="${PrivateFromSubmitKey?default('')}" />
        	
        		<input type="hidden" name="sysMenuId" value="0" />
	            <p class="topbarbg">
	        		<span class="topbar ft-cl-r ft-sz-14 ft-wt-b">奇新时代科技后台管理系统</span>
	            </p>
	            <#if warnMessagekey?? >
		            <div class="warning-show warn-case ft-cl-n ft-sz-12" style="text-align:left;padding-left:5px;">
		            	<img src="${BasePath}/images/ecsystem/war-stop.gif" alt="" />
		            	<@spring.message code="${warnMessagekey}" />
		            </div>
		        <#else>
		        	<div class="warning-show"></div>
	            </#if>  
	            <div class="login-tr">
	            	<div class="login-td-1 ft-sz-12 ft-cl-n">用户名：</div>
	                <div class="login-td-2">
	                	<input type="text" class="tt-text" name="loginName" value="" />
	                	<span id="loginNameTip"></span>
	                </div>
	            </div>
	            <div class="login-tr">
	            	<div class="login-td-1 ft-sz-12 ft-cl-n">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div>
	                <div class="login-td-2"><input type="password" class="tt-text" name="loginPassword" value="" />
	            </div>
	            </div>
	            <div class="login-tr">
	            	<div class="login-td-1 ft-sz-12 ft-cl-n">验证码：</div>
	                <div class="login-td-2"><input type="text" class="tt-text-yz tt-text" name="validateCode"> 
	                <span>
<!--	                <img src="${BasePath}/images/ecsystem/yanz.gif" alt="" />-->
	                <img id="imgValidateCode" src="${BasePath}/servlet/imageValidate?dt=<%=new Date()%>" width="55" height="20" align="top" border="0" style="cursor:hand"/>
	                </span>
	                <a href="javascript:reloadCode();">看不清?</a></div>
	            </div>
<!-- 	            <div class="login-tr"> -->
<!-- 	            	<div class="login-td-1 ft-sz-12 ft-cl-n"></div> -->
<!-- 	                <div class="login-td-2"><input type="checkbox" name="cookieTime">&nbsp;&nbsp;一周内免登录&nbsp;&nbsp;<a href="#"><img src="${BasePath}/images/ecsystem/yewlloask.gif" alt="直接登录,不用输入密码" title="直接登录,不用输入密码" /></a></div> -->
<!-- 	            </div> -->
	            <div class="btn-login">
	            	 <input type="image"  src="${BasePath}/images/ecsystem/loginbg.gif" />
	            </div>
	        </form>
        </div>
	</div>
	<div class="divH8"></div>
 
</div>
<script type="text/javascript">
//swfobject.registerObject("FlashID");
</script>
</body>
</html>

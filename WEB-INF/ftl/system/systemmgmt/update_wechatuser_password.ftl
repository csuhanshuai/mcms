<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#assign spring=JspTaglibs["/WEB-INF/tlds/spring.tld"]/>
<#include "../system-include.ftl">

<title>网络营销系统-微信管理-密码修改</title>

<script type="text/javascript">
  	
	/**
  	 * 提交表单
  	 */
  	function submitForm(){
  		$("#newPasswordTip").empty();
  		var newPassword  = $("#newPassword").val();
  		if(newPassword == null || newPassword == ""){
  			$("#newPasswordTip").append("密码不能为空");
  			$("#newPasswordTip").attr("class","onerror");
  			return false;
  		}
  		
		
		if(validatorPassword()){
			document.systemUserForm.target="content";
			document.systemUserForm.submit();
			window.top.TB_remove();
		}
  	}
  	
  	
  	function validatorPassword(){
  		emptyPassBox();
  		var loginPassword = $("#newPassword").val();
  		var checkloginPassword = $("#checknewPassword").val();
  		
  		if(loginPassword != checkloginPassword){
  			$("#newPasswordTip").append("2次密码输入不一致");
  			$("#newPasswordTip").attr("class","onerror");
  			return false;
  		}
  		
  		return true;
  	}
  	
  	function emptyPassBox(){
  		$("#newPasswordTip").empty();
  		$("#newPasswordTip").attr("class","");
  	}
</script>

</head>

<body>


<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>微信管理 &gt; 密码修改
    </div>
            
  	<div class="content">
            
	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a href="#"  class="btn-onselc">密码修改</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>
     
     	<div class="blank20"></div>
   		<form action="updatepassword.kq" method="post"  name="systemUserForm" id="systemUserForm" style="margin:0px;padding:0p;">
   			<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getThickBoxUrl()+"'/>");</script>
   		 <#if warnMessagekey?? >
            <div class="warning-show warn-case ft-cl-n ft-sz-12" style="text-align:left;padding-left:5px;">
            	<img src="${BasePath}/images/ecsystem/war-stop.gif" alt="" />
            	<@spring.message code="${warnMessagekey}" />
            </div>
        <#else>
        	<div class="warning-show"></div>
           </#if>  
	     <ul class="ytweb-form">
	     	<input type="hidden" name="id" value="${id?default('')}" />
<!--        		<li> -->
<!--        			 -->
<!--        			<label for="username">原密码：<font class="ft-cl-r">*</font>&nbsp;</label> -->
<!--        			  <input name="oldPassrod" type="password" id="oldPassrod" size="30"  maxLength="40"/>&nbsp;&nbsp; -->
<!--        		</li> -->
       		<li>
       			<label for="newPassword">新密码：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="newPassword" type="password" id="newPassword"   size="30"  maxLength="50" onfocus="emptyPassBox();"/>&nbsp;&nbsp;
       			  <span id="newPasswordTip"></span>
       		</li>
       		<li>
       			<label for="checknewPassword">确认密码：&nbsp;</label>
       			  <input type="password" id="checknewPassword" size="30"  maxLength="50" onfocus="emptyPassBox();"/>&nbsp;&nbsp;
       		</li>
       	</ul>
       	
       	 <div class="ytweb-form-btn">
         	<label></label><input type="button" class="yt-form-btn-add" onclick="submitForm();" value="保存" />  
			<input type="button" class="yt-form-btn-back" value="取消" onclick="parent.TB_remove();"/>
         </div>
       	</form>
     </div>
</div>

</div>
</body>
</html>

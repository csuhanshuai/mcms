<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#include "../system-include.ftl">

<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemUser.js"></script>
<title>网络营销系统-系统管理-微信用户信息</title>

<script type="text/javascript">
  	var config={form:"wechatUserForm",submit:submitForm,
 	fields:[
		{name:'name',allownull:false,regExp:"name",defaultMsg:'请输入真实姓名',focusMsg:'请输入真实姓名',errorMsg:'真实姓名不正确',rightMsg:'',msgTip:'nameTip'}, 
		{name:'username',allownull:false,regExp:"name",defaultMsg:'请输登录用户名',focusMsg:'请输登录用户名',errorMsg:'登录用户名只能数字、26个英文字母或者下划线组成的字符串',rightMsg:'',msgTip:'usernameTip'},
		{name:'password',allownull:false,defaultMsg:'请输入登录密码',focusMsg:'请输入登录密码',errorMsg:'请输入登录密码',rightMsg:'',msgTip:'passwordTip'}, 
		{name:'email',allownull:true,regExp:"email",defaultMsg:null,focusMsg:'',errorMsg:'邮件地址输入错误',rightMsg:'',msgTip:'emailTip'},
		{name:'telephone',allownull:true,regExp:"mobile",defaultMsg:null,focusMsg:'',errorMsg:'手机号码输入错误',rightMsg:'',msgTip:'telephoneTip'}
	]}
  
  	Tool.onReady(function(){
		var f = new Fv(config);
		f.register();
	});
  	
  	/**
  	 * 提交表单
  	 */
  	function submitForm(){
  		return validatorPassword();
  	}
  	
  	
  	function validatorPassword(){
  		
  		var loginPassword = $("#password").val();
;
  		
  		if(loginPassword == null || loginPassword == ""){
  			return false;
  		}
  		
  		emptyPassBox();  		
  		return true;
  	}
  	
  	function emptyPassBox(){
  		$("#passwordTip").empty();
  		$("#passwordTip").attr("class","");
  	}
  
</script>

</head>

<body>

<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>微信管理 &gt;  添加微信用户基本信息
    </div>
            
  	<div class="content">
            
	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a  class="btn-onselc">微信用户基本信息</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>
     
     	<div class="blank20"></div>
   		<form action="addWechatUser.kq" method="post"  name="wechatUserForm" id="wechatUserForm" style="margin:0px;padding:0p;">
	     	<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getBackUrl()+"'/>");</script>
	     <ul class="ytweb-form">
	     <li>
       			<label for="accounttype">接入类型：&nbsp;</label>
     			 <input type="radio"  name="accounttype" value="0" checked/>WEB
					&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"  name="accounttype" value="1"/>WAP
       		</li>
	     <li>
       			<label for="conname">接入码：&nbsp;</label>
       			  <input name="conname" type="text" id="conname" size="30" value="1"  maxLength="15"/>&nbsp;&nbsp;
       			   <span id="connameTip"> </span>
       		</li>
       		<li>
       			<label for="name">真实姓名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="name" type="text" id="name" size="30"  maxLength="40"/>&nbsp;&nbsp;
       			  <span id="nameTip"></span>
       		</li>
       		<li>
       			<label for="username">登录用户名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="username"  id="username"   type="text"size="30"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="usernameTip"></span>
       		</li>
       		
       		<li>
       			<label for="password">登录密码：&nbsp;</label>
       			  <input name="password" type="password" id="password" size="30" onfocus="javascript:emptyPassBox();"  maxLength="50"/>
       			   <span id="passwordTip"></span>
       		</li>
       		
       		
       		<li>
       			<label for="type">用户类型：&nbsp;</label>
       			<select id="type" name="type" style="width:195px;">
       			
       				<option value="1">--免费用户--</option>
       				<option value="2">--试用期用户--</option>
				<option value="3">--收费用户--</option>
       			</select>
       		</li>
       		<li >
       			<label for="city">城市：&nbsp;</label>
       			  <input name="city" type="text" id="city" size="30" readonly="readonly" />
				  <input type="butotn" onClick="toSelectcity();" value="选择" id="addUserOrganiz"  class="yt-btn-add-normal" />
       			  <input name="organizName" type="hidden" id="organizNo" />
       		</li>
       		<li>
       			<label for="address">地址：&nbsp;</label>
     			 <input name="address" type="text" id="address" size="30"  maxLength="11"/>&nbsp;&nbsp;
       			  <span id="addressTip"></span>
       		</li>
       		<li>
       			<label for="telephone">手机：&nbsp;</label>
       			  <input name="telephone" type="text" id="telephone" size="30"  maxLength="11"/>&nbsp;&nbsp;
       			  <span id="telephoneTip"></span>
       		</li>
       
       		<li>
       			<label for="email">E-mail：&nbsp;</label>
       			  <input name="email" type="text" id="email" size="30"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="emailTip"></span>
       		</li>
       		
       		<li>
       			<label for="gzaccount">微信接入用户名：&nbsp;</label>
       			  <input name="gzaccount" type="text" id="gzaccount" size="30"  maxLength="12"/>&nbsp;&nbsp;
       			  <span id="gzaccountTip"></span>
       		</li>
       		<li>
       			<label for="gzpassword">微信接入密码：&nbsp;</label>
       			  <input name="gzpassword" type="text" id="gzpassword" size="30"  maxLength="30"/>&nbsp;&nbsp;
       			  <span id="gzpasswordTip"></span>
       		</li>
       		<li>
       			<label for="description">备注：&nbsp;</label>
       			  <input  type="text" id="description" name="description" size="30"  maxLength="200"/>&nbsp;&nbsp;
       		</li>
       	</ul>
       	
       	 <div class="ytweb-form-btn">
         	<label></label><input type="submit" class="yt-form-btn-add" value="新增" />  
			<input type="button" class="yt-form-btn-back" value="取消" onclick="goBack();"/>
         </div>
       	</form>
     </div>
</div>

</body>
</html>

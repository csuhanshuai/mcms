<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#include "../system-include.ftl">

<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemUser.js"></script>

<title>网络营销系统-系统管理-系统用户基本信息</title>

<script type="text/javascript">

	var config={form:"systemUserForm",submit:submitForm,
 	fields:[
		{name:'username',allownull:false,regExp:"name",defaultMsg:'请输入真实姓名',focusMsg:'请输入真实姓名',errorMsg:'真实姓名不正确',rightMsg:'',msgTip:'usernameTip'}, 
		{name:'loginName',allownull:false,regExp:"name",defaultMsg:'请输登录用户名',focusMsg:'请输登录用户名',errorMsg:'登录用户名不能包含特殊字符',rightMsg:'',msgTip:'loginNameTip'},
		{name:'email',allownull:true,regExp:"email",defaultMsg:null,focusMsg:'',errorMsg:'邮件地址输入错误',rightMsg:'',msgTip:'emailTip'},
		{name:'telPhone',allownull:true,regExp:"mobile",defaultMsg:null,focusMsg:'',errorMsg:'手机号码输入错误',rightMsg:'',msgTip:'telPhoneTip'},
		{name:'mobilePhone',allownull:true,regExp:"tel",defaultMsg:null,focusMsg:'',errorMsg:'电话号码输入错误',rightMsg:'',msgTip:'mobilePhoneTip'},
		{name:'qqNum',allownull:true,regExp:"qq",defaultMsg:null,focusMsg:'',errorMsg:'QQ号码输入错误',rightMsg:'',msgTip:'qqNumTip'},
		{name:'msnNum',allownull:true,regExp:"email",defaultMsg:null,focusMsg:'',errorMsg:'MSN号码输入错误',rightMsg:'',msgTip:'msnNumTip'}
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
  		emptyPassBox();
  		var loginPassword = $("#loginPassword").val();
  		var checkloginPassword = $("#checkloginPassword").val();
  		
  		if(loginPassword != checkloginPassword){
  			$("#loginPasswordTip").append("2次密码输入不一致");
  			$("#loginPasswordTip").attr("class","onerror");
  			return false;
  		}
  		
  		return true;
  	}
  	
  	function emptyPassBox(){
  		$("#loginPasswordTip").empty();
  		$("#loginPasswordTip").attr("class","");
  	}
</script>

</head>

<body>


<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>系统管理 &gt; 修改系统用户基本信息
    </div>
            
  	<div class="content">
            
	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a  class="btn-onselc">系统用户基本信息</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>
     	<div class="blank20"></div>
   		<form action="u_updateSystemUser.kq" method="post"  name="systemUserForm" id="systemUserForm" style="margin:0px;padding:0p;">
   			<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getBackUrl("${fromIfr?default('')}")+"'/>");</script>
	     <ul class="ytweb-form">
       		<li>
       			<input type="hidden" name="id" value="${user.id?default('')}" />
       			<label for="username">真实姓名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="username" type="text" id="username" value="${user.username?default('')}" size="30"  maxLength="40"/>&nbsp;&nbsp;
       			  <span id="usernameTip"></span>
       		</li>
       		<li>
       			<label for="loginName">登录用户名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="loginName" type="text" id="loginName" readonly="readonly"  style="border:0px;" value="${user.loginName?default('')}" size="30"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="loginNameTip"></span>
       		</li>
       		<li>
       			<label for="loginPassword">登录密码：&nbsp;</label>
       			  <input type="password" value="111111" size="31"  readonly="readonly" maxLength="50"/>
       			   <input type="butotn" onClick="toUpdatePassword('${user.id}');" value="修改"  class="yt-btn-add-normal" />
       		</li>
       		<!--<#if user.supplierCode?? && (user.supplierCode != "") >
	       		<li>
	       			<label for="supplierCode">供应商名称：&nbsp;&nbsp;&nbsp;</label>
	       			<input type="text" size="50" style="border:0px;" value="<#if supplier??><#if supplier.supplier??>${supplier.supplier}</#if></#if>" readonly="readonly"  />
	       			<input type="hidden" value="${user.supplierCode}" />
	       		</li>
	       		<#else>
	       		<li>
	       			<label for="organizName">部门：&nbsp;&nbsp;&nbsp;</label>
	       			  <input name="organizName" type="text" id="organizName" value="${user.organizName?default('')}"  size="30" readonly="readonly" />
					  <input type="butotn" onClick="toSelectUserOrganiz();" value="选择" id="addUserOrganiz"  class="yt-btn-add-normal" />
	       			  <input name="organizNo" type="hidden" id="organizNo" value="${user.organizNo?default('')}"  />
	       		</li>
       		</#if>-->
		
		<input name="organizNo" type="hidden" id="organizNo" value=""/>
		<input type="hidden"  name="sex" value="0"/>
       		<!--<li>
       			<label for="sex">性别：&nbsp;&nbsp;&nbsp;</label>
       				<#if (user.sex == "0")>
						<input type="radio"  name="sex" value="0" checked/> 男
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio"  name="sex" value="1"/> 女
					<#elseif (user.sex == "1") >
						<input type="radio"  name="sex" value="0"/> 男
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio"  name="sex" value="1" checked/> 女
					</#if>
       		</li>-->
       		<li>
       			<label for="telPhone">手机：&nbsp;&nbsp;&nbsp;</label>
       			  <input name="telPhone" type="text" id="telPhone" size="30"  value="${user.telPhone?default('')}"  maxLength="50"/>&nbsp;&nbsp;
       			<span id="telPhoneTip"></span>
       		</li>
       		<li>
       			<label for="mobilePhone">电话：&nbsp;&nbsp;&nbsp;</label>
       			 <input name="mobilePhone" type="text" id="mobilePhone" size="30" value="${user.mobilePhone?default('')}"  maxLength="50"/>&nbsp;&nbsp;
       			<span id="mobilePhoneTip"></span>
       		</li>
       		
       		<li>
       			<label for="email">E-mail：&nbsp;&nbsp;&nbsp;</label>
       			  <input name="email" type="text" id="email" size="30"  value="${user.email?default('')}"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="emailTip"></span>
       		</li>
       		
       		<li>
       			<label for="qqNum">QQ：&nbsp;&nbsp;&nbsp;</label>
       			  <input name="qqNum" type="text" id="qqNum" size="30" value="${user.qqNum?default('')}"  maxLength="15"/>&nbsp;&nbsp;
       			  <span id="qqNumTip"></span>
       		</li>
       		
       	</ul>
       	
       	 <div class="ytweb-form-btn">
         	<label></label><input type="submit" class="yt-form-btn-add" value="保存" />  
			<input type="button" class="yt-form-btn-back" value="取消" onclick=goBack("${fromIfr?default('')}"); />
         </div>
       	</form>
     </div>
</div>
</div>
</body>
</html>

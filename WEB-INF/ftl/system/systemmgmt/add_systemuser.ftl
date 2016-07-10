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
		{name:'loginName',allownull:false,regExp:"name",defaultMsg:'请输登录用户名',focusMsg:'请输登录用户名',errorMsg:'登录用户名只能数字、26个英文字母或者下划线组成的字符串',rightMsg:'',msgTip:'loginNameTip'},
		{name:'loginPassword',allownull:false,defaultMsg:'请输入登录密码',focusMsg:'请输入登录密码',errorMsg:'请输入登录密码',rightMsg:'',msgTip:'loginPasswordTip'}, 
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
  		
  		var loginPassword = $("#loginPassword").val();
  		var checkloginPassword = $("#checkloginPassword").val();
  		
  		if(loginPassword == null || loginPassword == ""){
  			return false;
  		}
  		
  		emptyPassBox();
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
  	
  	$(function(){
		$("input[name='isSupplier']").click(function(){
			if(this.value=="0"){
				$("#supplier").show();
				$("#department").hide();
				$("#organizName").val("");
			}else{
				$("#supplier").hide();
				document.getElementById("supplierCode").selectedIndex=0;
				$("#department").show();
			}
		});
	});
	/*验证*/
	$(document).ready(function () {
        $("#bt1").click(function () {
        var username = $('#username').val();
		var loginName = $('#loginName').val();
		var loginPassword = $('#loginPassword').val();
		var checkloginPassword = $('#checkloginPassword').val();
		var telPhone = $('#mobilePhone').val().trim();
		var mobilePhone = $('#telPhone').val().trim();
		var email = $('#email').val().trim();
		var qqNum = $('#qqNum').val().trim();
		var ismobel=/^1\d{10}$/;
		var istel=/^\d{7,8}$/;
		var ismail=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        flag = true;
        if(username=="" || loginName=="" || loginPassword=="" || checkloginPassword==""){
        	alert('用户名或密码不能为空');
        }
        else{
        	if(mobilePhone!=""){
	        	if(!ismobel.test(mobilePhone)){
	        		alert('手机号码错误');
	        		flag = false;
	        	}
        	}
        	if(telPhone!=""){
	        	if(!istel.test(telPhone)){
	        		alert('电话号码错误');
	        		flag = false;
	        	}
        	}
        	if(email!=""){
				if(!ismail.test(email)){
	        		alert('邮箱错误');
	        		flag = false;
	        	}
        	}
        	if(flag){
        	//systemUserForm.submit();
            var options = {
                url: 'c_addSystemUser.kq',
                type: 'post',
                dataType: 'text',
                data: $("#systemUserForm").serialize(),
                success: function (data) {
                   window.location.href='querySystemUserList.kq';
                }
            };
            $.ajax(options);
            return false;
           }
           }
        });
    });
</script>

</head>

<body>

<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>系统管理 &gt;  添加系统用户基本信息
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
   		<form action="c_addSystemUser.kq" method="post"  name="systemUserForm" id="systemUserForm" style="margin:0px;padding:0p;">
	     	<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getBackUrl()+"'/>");</script>
	     <ul class="ytweb-form">
       		<li>
       			<label for="username">真实姓名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="username" type="text" id="username" size="30"  maxLength="40"/>&nbsp;&nbsp;
       			  <span id="usernameTip"></span>
       		</li>
       		<li>
       			<label for="loginName">登录用户名：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="loginName"  id="loginName"   type="text"size="30"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="loginNameTip"></span>
       		</li>
       		
       		<li>
       			<label for="loginPassword">登录密码：&nbsp;</label>
       			  <input name="loginPassword" type="password" id="loginPassword" size="31" onfocus="javascript:emptyPassBox();"  maxLength="50"/>&nbsp;&nbsp;
       			   <span id="loginPasswordTip"></span>
       		</li>
       		<li>
       			<label for="checkloginPassword">确认密码：&nbsp;</label>
       			  <input  type="password" id="checkloginPassword" size="31" onfocus="javascript:emptyPassBox();"  maxLength="50"/>&nbsp;&nbsp;
       		</li>
       		
       			
       			<input type="hidden"  name="isSupplier" value="0" />
				
       		
       		<li id="supplier" style="display:none">
       			<label for="supplierCode">供应商选择：&nbsp;</label>
       			<select id="supplierCode" name="supplierCode" style="width:195px;">
       				<#if supplierSpList??>
       					<option value="-1">--请选择供应商--</option>
       					<#list supplierSpList as item>
       						<option value="<#if item.supplierCode??>${item.supplierCode}</#if>"><#if item.supplier??>${item.supplier}</#if></option>
       					</#list>
     				<#else>
      					<option value="-1">--供应商不存在--</option>
       				</#if>
       			</select>
       		</li>
       		<!--<li id="department">
       			<label for="organizName">部门：&nbsp;</label> -->
       			  <input name="organizName" type="hidden" id="organizName" size="30" readonly="readonly" />
		<!--	  <input type="butotn" onClick="toSelectUserOrganiz();" value="选择" id="addUserOrganiz"  class="yt-btn-add-normal" />-->
       			  <input name="organizNo" type="hidden" id="organizNo" />
       		<!--</li>-->
       		<!--<li>
       			<label for="sex">性别：&nbsp;</label>
     			 <input type="radio"  name="sex" value="0" checked/>男
					&nbsp;&nbsp;&nbsp;&nbsp;-->
				<input type="hidden"  name="sex" value="1"/>
				<!--女
       		</li>-->
       		<li>
       			<label for="telPhone">手机：&nbsp;</label>
       			  <input name="telPhone" type="text" id="telPhone" size="30"  maxLength="11"/>&nbsp;&nbsp;
       			  <span id="telPhoneTip"></span>
       		</li>
       		<li>
       			<label for="mobilePhone">电话：&nbsp;</label>
       			  <input name="mobilePhone" type="text" id="mobilePhone" size="30"  maxLength="15"/>&nbsp;&nbsp;
       			   <span id="mobilePhoneTip"></span>
       		</li>
       		
       		<li>
       			<label for="email">E-mail：&nbsp;</label>
       			  <input name="email" type="text" id="email" size="30"  maxLength="50"/>&nbsp;&nbsp;
       			  <span id="emailTip"></span>
       		</li>
       		
       		<li>
       			<label for="qqNum">QQ：&nbsp;</label>
       			  <input name="qqNum" type="text" id="qqNum" size="30"  maxLength="12"/>&nbsp;&nbsp;
       			  <span id="qqNumTip"></span>
       		</li>
       		<!--<li>
       			<label for="msnNum">MSN：&nbsp;</label>-->
       			  <input name="msnNum" type="hidden" id="msnNum" size="30"  maxLength="30"/>&nbsp;&nbsp;
       			<!--  <span id="msnNumTip"></span>
       		</li>-->
       		
       	</ul>
       	 <div class="ytweb-form-btn">
         	<label></label><input type="button" id="bt1" class="yt-form-btn-add" value="新增" />  
			<input type="button" class="yt-form-btn-back" value="取消" onclick="goBack();"/>
         </div>
       	
       	</form>
     </div>
</div>

</body>
</html>

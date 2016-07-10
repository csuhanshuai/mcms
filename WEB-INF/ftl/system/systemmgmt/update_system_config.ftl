<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#include "../../system/system-include.ftl">

<title>网络营销系统-系统管理-系统配置基本信息</title>

<script type="text/javascript">
  	var config={form:"systemConfigForm",submit:submitForm,
 	fields:[
		{name:'configName',allownull:false,regExp:/^\s*(\S+)\s*$/,defaultMsg:'请输入配置名称',focusMsg:'请输入配置名称',errorMsg:'配置名称不正确',rightMsg:'',msgTip:'configNameTip'}
	]}

  	Tool.onReady(function(){
		var f = new Fv(config);
		f.register();
	});

  		/**
  	 * 提交表单
  	 */
  	function submitForm(result){
  		if(result){
  			if(!checkLength()) return false;

	  		window.top.TB_remove();
	  		return true;
  		}
  		return false;
  	}

	function checkLength(){
  		var obj = $("#remark").val();
  		if(obj.length> 100){
  			alert( '备注最多100字！ ');
  			return false;
  		}
  		return true;
  	}

</script>

</head>

<body>

<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>系统管理 &gt;  添加系统配置
    </div>

  	<div class="content">

	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a  class="btn-onselc">系统配置基本信息</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>

     	<div class="blank20"></div>
   		<form action="u_updateSystemConfig.kq" method="post" target="content"  name="systemConfigForm" id="systemConfigForm" style="margin:0px;padding:0p;">
	    	<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getThickBoxUrl()+"'/>");</script>
	     <ul class="ytweb-form">
       		<li>
       			<label for="configName">配置名称：<font class="ft-cl-r">*</font>&nbsp;</label>
       			<input type="hidden" name="id" value="${config.id?default('')}" />
       			  <input name="configName" type="text" id="configName" size="30" value="${config.configName?default('')}"  maxLength="40"/>&nbsp;&nbsp;
       			  <span id="configNameTip"></span>
       		</li>
       		<li>
       			<label for="key">配置键：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  <input name="key" type="text" id="key" size="80" value="${config.key?default('')}"  maxLength="150"/>&nbsp;&nbsp;
       		</li>

       		<li>
       			<label for="value">配置值：<font class="ft-cl-r">*</font>&nbsp;</label>
       			<textarea id="value"  name="value" style="width:430px;height:120px;"  >${config.value?default('')}</textarea>
       		</li>

       		<li>
       			<label for="remark">备注：</label>
       			<textarea id="remark" name="remark" style="width:430px;height:120px;"  >${config.remark?default('')}</textarea>
       		</li>

       	</ul>

       	 <div class="ytweb-form-btn">
         	<label></label><input type="submit" class="yt-form-btn-add" value="保存" />
			<input type="button" class="yt-form-btn-back" value="取消" onclick="javascript:window.top.TB_remove();"/>
         </div>
       	</form>
     </div>
</div>

</body>
<script>
	$("#configName").focus();
</script>
</html>

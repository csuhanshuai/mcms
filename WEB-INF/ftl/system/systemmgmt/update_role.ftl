<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "../system-include.ftl">

<title>网络营销系统-系统管理-角色修改</title>
<script type="text/javascript"  src="${BasePath}/js/system/system/systemmgmt/role.js"></script>

<script type="text/javascript">
  	var config={form:"roleForm",submit:submitForm,
 	fields:[
		{name:'roleName',allownull:false,regExp:"name",defaultMsg:'角色名称不能为空',focusMsg:'角色名称不能为空',errorMsg:'角色名称格式不正确',rightMsg:'',msgTip:'roleNameTip'}
	]}
  
  	Tool.onReady(function(){
		var f = new Fw(config);
		f.register();
	});
  	
  	/**
  	 * 提交表单
  	 */
  	function submitForm(result){
  		return result;
  	}
</script>

</head>
<body>

<div class="contentMain">
	<div class="ytback-tt-1 ytback-tt">
    <span>您当前的位置：</span>系统管理 &gt; 角色修改
    </div>
            
  	<div class="content">
            
	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a href="#"  class="btn-onselc">角色基本信息</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>
     
     	<div class="blank20"></div>
     	
   		<form action="u_updateRole.kq" method="post"  name="roleForm" id=roleForm style="margin:0px;padding:0p;">
   			<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getThickBoxUrl()+"'/>");</script>
		     <ul class="ytweb-form">
	       		<li>
	       			<input type="hidden" name="id" value="${role.id}" />
	       			<label for="roleName">角色名称：<font class="ft-cl-r">*</font>&nbsp;</label>
       			  	<input name="roleName" id="roleName" value="${role.roleName}" style="length:50;" maxLength="20"/>&nbsp;&nbsp;
       			  	 <span id="roleNameTip"></span>
	       		</li>
	       		<li>
	       			<label for="remark">备注：</label>
	       			<input type="text"  name="remark" value="${role.remark}" style="length:50;" maxLength="100"/>
	       		</li>
	       	</ul>
	       	
	       	 <div class="ytweb-form-btn">
	         	<label></label><input type="submit" class="yt-form-btn-add" value="保存" />  
				<input type="button" class="yt-form-btn-back" value="取消" onclick="parent.TB_remove();"/>
	         </div>
       	</form>
     </div>
</div>

</div>
</body>
</html>


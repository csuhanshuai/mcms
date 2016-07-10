<#include "../system-include.ftl">
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/role.js"></script>
<br/><br/>

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

<div class="contentMain">
	<div class="divH12"></div>
      <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a  class="btn-onselc">角色基本信息</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
      </div>
    <form action="c_addRole.kq" name="roleForm" method="post" style="margin:0;padding:0;" >
    	<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getThickBoxUrl()+"'/>");</script>
	    <ul class="ytweb-form">
	   		<li>
	   			<label for="roleName">角色名称：<font class="ft-cl-r">*</font>&nbsp;</label>
	   			<input name="roleName" type="text" id="roleName" size="30"  maxLength="20"/>&nbsp;&nbsp;
	   			<span id="roleNameTip"></span>
	   		</li>
	       <li>
	       		<label for="t2">备注：</label>
	       		<textarea rows="8" cols="27" style="length:80;" maxLength="100" name="remark"></textarea>
	       	</li>
	     </ul>
     
		 <div class="ytweb-form-btn">
	       	<label></label>
	
			<input type="submit" class="yt-form-btn-add" value="新增" />  
			<input type="button" class="yt-form-btn-back" value="取消" onclick="javascript:parent.TB_remove();"/>
	     </div>
      </form>
</div>

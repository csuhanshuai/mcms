<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#include "../system-include.ftl">

<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/icon.css" />
<script type="text/javascript" src="${BasePath}/js/common/tree/js/jquery.easyui.min.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/tree.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/resources.js"></script>

<title></title>

<script type="text/javascript">
  	var config={form:"resourceMgtForm",submit:submitForm,
 	fields:[
		{name:'menuName',allownull:false,regExp:"notempty",defaultMsg:'请输入资源名称',focusMsg:'请输入资源名称',errorMsg:'资源名称格式不正确',rightMsg:'',msgTip:'menuNameTip'},
		{name:'sort',allownull:false,regExp:"num4",
			defaultMsg:'请输入排序位置',focusMsg:'请输入排序位置',errorMsg:'排序只能为数字',rightMsg:'',msgTip:'sortTip'}
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
  			addMenuNode();
  		}
  		return false;
  	}
</script>
</head>

<body>
<div class="contentMain">
<div class="cont-nav ft-sz-12"><span><a href="#">系统管理</a> &gt; 权限管理 </span></div>
<table>
<tr>
	<td style="vertical-align: top;" align="left" width="250px;" height="100%">
		<ul id="resourceTree"><script>onloadResourceTree('loadResourceDate.kq',false);</script></ul>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td style="padding: 15px;vertical-align: top;">
	
	<form action="" name="resourceMgtForm" method="post">
		<table>
			<tr height="50px;">
				<td>
					<input type="hidden" name="id" id="id"/>
					名称：<font class="ft-cl-r">*</font>
				</td>
				<td>
					<input type="text" name="menuName" id="menuName"  maxLength="14"/>
					<span id="menuNameTip"></span>
				</td>
			</tr>
			<tr height="50px;">
				<td>URL:</td>
				<td><input type="text" name="memuUrl" id="memuUrl" maxLength="150"/></td>
			</tr>
			<tr height="50px;">
				<td>类型 ：<font class="ft-cl-r">*</font></td>
				<td>
					<select name="type" id="type"  >
						<option value="0">菜单</option>
						<option value="1">功能点</option>
					 </select>
				</td>
			</tr>
			<tr height="50px;">
				<td>排序：</td>
				<td>
					<input type="text" name="sort" id="sort"  maxLength="5"/>
					<span id="sortTip"></span>
				</td>
			</tr>
			
			<tr height="50px;">
				<td>备注:</td>
				<td>
					<input type="text" name="remark" id="remark" maxLength="30"/>
				 </td>
			</tr>
		</table>
	
		 <div class="ytweb-form-btn">
			<input type="submit" value="增加" class="yt-form-btn-back"/>
			<input type="button" value="修改" class="yt-form-btn-back" onclick="updateMenuNode();"/>
			<input type="button" value="删除" class="yt-form-btn-back" onclick="removeMenuNode();"/>
			<input type="button" value="清空" class="yt-form-btn-back" onclick="clearInputValue();"/>
         </div>
	</form>
	</td>
</tr>
</table>

</div>
</body>
</html>

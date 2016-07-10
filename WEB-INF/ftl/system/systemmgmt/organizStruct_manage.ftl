<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />

<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/icon.css" />
<script type="text/javascript"  src="${BasePath}/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="${BasePath}/js/common/tree/js/jquery.easyui.min.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/tree.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/organizstruct.js"></script>

<title></title>
</head>

<body>

<div class="contentMain">
<table>
<tr>
	<td style="vertical-align: top;" align="left" height="100%">
		<ul  style="over-flow:auto;" id="resourceTree"><script>onloadResourceTree('loadOrganizStructDate.kq',false);</script></ul>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td style="padding: 15px;vertical-align: top;">
		<input type="hidden" name="id" id="id"/>
		 <ul class="ytweb-form">
       		<li>
       			<label for="name">名称：<font class="ft-cl-r">*</font>&nbsp;</label>
       			 <input type="text" name="name" id="name" maxLength="20"/>
       			 <span id="nameTip"></span>
       		</li>
       		<li>
       			<label for="ecInd">机构类型 ：</label>
       			<select name="ecInd" id="ecInd">
					<option value="1" selected="selected">基础组织架构</option>
					<option value="2">商家组织架构</option>
				</select>
       		</li>
       		<li>
       			<label for="remark">备注：</label>
       			 <textarea rows="10" cols="20" name="remark" id="remark" maxLength="300"></textarea>
       		</li>
       		 <div class="ytweb-form-btn">
			<input type="button" value="增加"  class="yt-form-btn-back" onclick="addOrganizStructNode();"/>
			<input type="button" value="修改"  class="yt-form-btn-back" onclick="updateOrganizStructNode();"/>
			<input type="button" value="删除"  class="yt-form-btn-back" onclick="removeOrganizStructNode();"/>
			<input type="button" value="清空"  class="yt-form-btn-back" onclick="clearInputValue();"/>
         </div>
       	</ul>
       	
	
		
	</td>
</tr>
</table>

</div>
</body>
</html>

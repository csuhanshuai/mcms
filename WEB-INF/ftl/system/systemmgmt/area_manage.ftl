<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/icon.css" />
<script type="text/javascript"  src="${BasePath}/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="${BasePath}/js/common/tree/js/jquery.easyui.min.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/tree.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/area.js"></script>

<title></title>
</head>

<body>
<table>
<tr>
	<td valign="top" align="left" width="250px;" height="100%">
		<div style="width:250px;height:550px;overflow:auto;">
		<ul  style="over-flow:auto;" id="resourceTree"><script>onloadResourceTree('loadAreaDate.kq',false);</script></ul>
		</div>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td valign="top" style="padding: 15px;">
			<input type="hidden" name="id" id="id"/>
			名称：<input type="text" name="name" id="name"/><br/><br/>
			排序：<input type="text" name="sort" id="sort"/><br/>
			
			 <div class="ytweb-form-btn">
				<input type="button" value="增加"  onclick="addAreaNode();" class="yt-form-btn-back"/>
				<input type="button" value="修改" class="yt-form-btn-back"  onclick="updateAreaNode();"/>
				<input type="button" value="删除" class="yt-form-btn-back" onclick="removeAreaNode();"/>
				<input type="button" value="清空" class="yt-form-btn-back" onclick="clearInputValue();"/>
	         </div>
	</td>
</tr>
</table>


</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />
<title>网络营销系统-系统管理-系统配置基本信息</title>
</head>

<body>

<div class="contentMain">
            
  	<div class="content">
            
	   <div class="mb-btn-fd-bd">
	     <div class="mb-btn-fd relative">
	       <span class="btn-extrange absolute">
	           <ul class="onselect">
	               <li class="pl-btn-lfbg"></li>
	               <li class="pl-btn-ctbg"><a  class="btn-onselc">系统配置详细值</a></li>
	               <li class="pl-btn-rtbg"></li>
	           </ul>
	       </span>
	     </div>
	    </div>
     
     	<div class="blank20"></div>
     	<font style="color:red;weight:12">说明：&nbsp;&nbsp;多项配置用英文号逗(,)号分隔</font>&nbsp;&nbsp;<img src="${BasePath}/images/ecsystem/yewlloask.gif" alt="" title="多项配置用英文号逗(,)号分隔" style="cursor: pointer;"/>
   		<form action="u_update.kq" method="post" target="content"  name="systemConfigForm" id="systemConfigForm" style="margin:0px;padding:0p;">
	    	<input type="hidden" name="id" value="${(config.id)?default('')}" />
	    	<input type="hidden" name="configName" value="${(config.configName)?default('')}" />
	    	<input type="hidden" name="key" value="${(config.key)?default('')}" />
	    	<input type="hidden" name="remark" value="${(config.remark)?default('')}" />
	    	
			<textarea id="value" name="value" style="width:700px;height:300px;"  >${(config.value)?default('')}</textarea>
			
	    	
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

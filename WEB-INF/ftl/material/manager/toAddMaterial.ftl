<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
	var BasePath="${BasePath}"; 
    var code = ${code?default('-1')}
</script>


<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/global.js'></script>
<link href='${BasePath}/js/plugin/operamasks/operamasks-ui.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/plugin/operamasks/operamasks-ui.min.js'></script>
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/wechat.js'></script>
<!--[if lte IE 9]><script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<link href='${BasePath}/css/app/zj/other/other.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/app/zjmall/mall.css' rel='stylesheet' type='text/css' />
<script src="${BasePath}/js/app/zjmall/qxmall.js"></script>


 <script>
        
        
jQuery.extend({


    createUploadIframe: function (id, uri) {
        //create frame
        var frameId = 'jUploadFrame' + id;
        var iframeHtml = '<iframe id="' + frameId + '" name="' + frameId + '" style="position:absolute; top:-9999px; left:-9999px"';
        if (window.ActiveXObject) {
            if (typeof uri == 'boolean') {
                iframeHtml += ' src="' + 'javascript:false' + '"';

            }
            else if (typeof uri == 'string') {
                iframeHtml += ' src="' + uri + '"';

            }
        }
        iframeHtml += ' />';
        jQuery(iframeHtml).appendTo(document.body);

        return jQuery('#' + frameId).get(0);
    },
    createUploadForm: function (id, fileElementId, data) {
        //create form	
        var formId = 'jUploadForm' + id;
        var fileId = 'jUploadFile' + id;
        var form = jQuery('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');
        if (data) {
            for (var i in data) {
                if (data[i].name != null && data[i].value != null) {
                    jQuery('<input type="hidden" name="' + data[i].name + '" value="' + data[i].value + '" />').appendTo(form);
                } else {
                    jQuery('<input type="hidden" name="' + i + '" value="' + data[i] + '" />').appendTo(form);
                }
            }
        }
        var oldElement = jQuery('#' + fileElementId);
        var newElement = jQuery(oldElement).clone();
        jQuery(oldElement).attr('id', fileId);
        jQuery(oldElement).before(newElement);
        jQuery(oldElement).appendTo(form);
        //set attributes
        jQuery(form).css('position', 'absolute');
        jQuery(form).css('top', '-1200px');
        jQuery(form).css('left', '-1200px');
        jQuery(form).appendTo('body');
        return form;
    },

    ajaxFileUpload: function (s) {
        // TODO introduce global settings, allowing the client to modify them for all requests, not only timeout		
        s = jQuery.extend({}, jQuery.ajaxSettings, s);
        var id = new Date().getTime()
        var form = jQuery.createUploadForm(id, s.fileElementId, (typeof (s.data) == 'undefined' ? false : s.data));
        var io = jQuery.createUploadIframe(id, s.secureuri);
        var frameId = 'jUploadFrame' + id;
        var formId = 'jUploadForm' + id;
        // Watch for a new set of requests
        if (s.global && !jQuery.active++) {
            jQuery.event.trigger("ajaxStart");
        }
        var requestDone = false;
        // Create the request object
        var xml = {}
        if (s.global)
            jQuery.event.trigger("ajaxSend", [xml, s]);
        // Wait for a response to come back
        var uploadCallback = function (isTimeout) {
            var io = document.getElementById(frameId);
            try {
                if (io.contentWindow) {
                    xml.responseText = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
                    xml.responseXML = io.contentWindow.document.XMLDocument ? io.contentWindow.document.XMLDocument : io.contentWindow.document;

                } else if (io.contentDocument) {
                    xml.responseText = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
                    xml.responseXML = io.contentDocument.document.XMLDocument ? io.contentDocument.document.XMLDocument : io.contentDocument.document;
                }
            } catch (e) {
                jQuery.handleError(s, xml, null, e);
            }
            if (xml || isTimeout == "timeout") {
                requestDone = true;
                var status;
                try {
                    status = isTimeout != "timeout" ? "success" : "error";
                    // Make sure that the request was successful or notmodified
                    if (status != "error") {
                        // process the data (runs the xml through httpData regardless of callback)
                        var data = jQuery.uploadHttpData(xml, s.dataType);
                        // If a local callback was specified, fire it and pass it the data
                        if (s.success)
                            s.success(data, status);

                        // Fire the global callback
                        if (s.global)
                            jQuery.event.trigger("ajaxSuccess", [xml, s]);
                    } else
                        jQuery.handleError(s, xml, status);
                } catch (e) {
                    status = "error";
                    jQuery.handleError(s, xml, status, e);
                }

                // The request was completed
                if (s.global)
                    jQuery.event.trigger("ajaxComplete", [xml, s]);

                // Handle the global AJAX counter
                if (s.global && ! --jQuery.active)
                    jQuery.event.trigger("ajaxStop");

                // Process result
                if (s.complete)
                    s.complete(xml, status);

                jQuery(io).unbind()

                setTimeout(function () {
                    try {
                        jQuery(io).remove();
                        jQuery(form).remove();

                    } catch (e) {
                        jQuery.handleError(s, xml, null, e);
                    }

                }, 100)

                xml = null

            }
        }
        // Timeout checker
        if (s.timeout > 0) {
            setTimeout(function () {
                // Check to see if the request is still happening
                if (!requestDone) uploadCallback("timeout");
            }, s.timeout);
        }
        try {

            var form = jQuery('#' + formId);
            jQuery(form).attr('action', s.url);
            jQuery(form).attr('method', 'POST');
            jQuery(form).attr('target', frameId);
            if (form.encoding) {
                jQuery(form).attr('encoding', 'multipart/form-data');
            }
            else {
                jQuery(form).attr('enctype', 'multipart/form-data');
            }
            jQuery(form).submit();

        } catch (e) {
            jQuery.handleError(s, xml, null, e);
        }

        jQuery('#' + frameId).load(uploadCallback);
        return { abort: function () { } };

    },

    uploadHttpData: function (r, type) {
        var data = !type;
        if (!type)
            data = r.responseText;
        if (type == "xml")
            data = r.responseXML;
        //data = type == "xml" || data ? r.responseXML : r.responseText;
        // If the type is "script", eval it in global context
        if (type == "script")
            jQuery.globalEval(data);
        // Get the JavaScript object, if JSON is used.
        if (type == "json") {
            ////////////Fix the issue that it always throws the error "unexpected token '<'"///////////////  
            data = r.responseText;
            var start = data.indexOf(">");
            if (start != -1) {
                var end = data.indexOf("<", start + 1);
                if (end != -1) {
                    data = data.substring(start + 1, end);
                }
            }
            ///////////////////////////////////////////////////////////////////////////////////////////////  
            eval("data = " + data);
        }
        // evaluate scripts within html
        if (type == "html")
            jQuery("<div>").html(data).evalScripts();

        return data;
    },

    handleError: function (s, xhr, status, e) {
        // If a local callback was specified, fire it
        if (s.error) {
            s.error.call(s.context || s, xhr, status, e);
        }

        // Fire the global callback
        if (s.global) {
            (s.context ? jQuery(s.context) : jQuery.event).trigger("ajaxError", [xhr, s, e]);
        }
    	}
	})

			function uploadFile(){
        		 var file_id = this.id;
        		 $.ajaxFileUpload({
					 url: BasePath+'/uploadImageFile.kq',
					 secureuri: false,
					 fileElementId: file_id,
					 data:{
					 	bid:bid,
					 	do_action:'msgFileUpload',
					 },
					 type:'POST',
					 dataType:'json',
					 success: function (data, status) {
					 	var id = this.fileElementId;
					 	var index = id.substring(id.length-1);
					 	$("#item-img-"+index).attr("src",BasePath+"/"+data.imgpath);
					 	$("#item-img-value-"+index).attr("value",data.imgpath);
					 	$("#"+id).change(uploadFile);
					 	$("#cnt-wrapper-"+index).show();
					 }
				 });
        	}

        	$(function(){
        		if(code==0){
        			alert("操作成功!");
        		}
        		if(code==1){
        			alert("操作失败!");
        		}
        		$("input[name=FileUpload]").change(uploadFile);
        	});
        </script>



<script>

function checkinput(){
   var form = document.getElementById("question_form");
   var title = form.title;
	if(title.value.length==0){
		var titleClear = document.getElementById("titleClear");
		title.focus();
		titleClear.innerHTML="请输入标题";
		return;
	}
	
	var rightTitle = form.rightTitle;
	if(rightTitle.value.length==0){
		var rightTitleClear = document.getElementById("rightTitleClear");
		rightTitle.focus();
		rightTitleClear.innerHTML="请输入正确答案";
		return;
	}
	
	
    var type = /^[0-9]*[1-9][0-9]*$/;
    var re = new RegExp(type);
	
	var maxSubmitTime = form.maxSubmitTime;
	if(maxSubmitTime.value.length==0){
		var maxSubmitTimeClear = document.getElementById("maxSubmitTimeClear");
		maxSubmitTime.focus();
		maxSubmitTimeClear.innerHTML="请输入最长答题时间";
		return;
	}
	if(!maxSubmitTime.value.match(re)){
		var maxSubmitTimeClear = document.getElementById("maxSubmitTimeClear");
		maxSubmitTime.focus();
		maxSubmitTimeClear.innerHTML="请输入两位正整数";
		return;
	}
	
	var topicScore = form.topicScore;
	var topicScoreClear = document.getElementById("topicScoreClear");
	
	if(topicScore.value.length==0){
		topicScore.focus();
		topicScoreClear.innerHTML="请输入题目分数";
		return;
	}
	if(!topicScore.value.match(re)){
		topicScore.focus();
		topicScoreClear.innerHTML="请输入两位正整数";
		return;
	}
   form.submit();
}
        
</script>
</head>
<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}

.itemTableTr{
   height:30px;
}

.form_input{
   height:25px;
   margin-left:5px;
}

.itemTableLabel{
   align:right;
   margin-right:15px;
}

</style>

<div id="reply_keyword" class="r_con_wrap">
     <script language="javascript">$(document).ready(wechat_obj.reply_keyword_init);</script>
        
<form id="question_form"  name="question_form" enctype="multipart/form-data"   action=""  method="post">
    <#if materialItem?? && type?? && type=='mod'>
    <input name="id" type="hidden" value="${materialItem.id}"/>
    <input name="type" type="hidden" name="operation" value="mod"/>
    </#if>
    
    
    <table id="itemTable" style="width:100%;">
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>编码:</span> <span class="fc_red">*</span></td>
    		<td><input name="code" value="<#if materialItem??>${materialItem.code?default("")}</#if>" type="text" placeholder="编码" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull></td>
    		
    		<td class="itemTableLabel" align="right"><span>索引:</span> <span class="fc_red">*</span></td>
    		<td><input name="index" value="<#if materialItem??>${materialItem.index?default("")}</#if>" type="text" placeholder="索引" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull></td>
    	</tr>
    
    	<tr style="height:8px;">
    	</tr>
    
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>名称:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="itemName" value="<#if materialItem??>${materialItem.itemName?default("")}</#if>" type="text" placeholder="名称" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>生产日期:</span> <span class="fc_red">*</span></td>
    		<td><input name="itemName" value="<#if materialItem??>${materialItem.itemName?default("")}</#if>" type="text" placeholder="名称" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>采购员:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="cegBuyer" value="<#if materialItem??>${materialItem.cegBuyer?default("")}</#if>" type="text" placeholder="采购员" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>供应商编码:</span> <span class="fc_red">*</span></td>
    		<td><input name="itemName" value="<#if materialItem??>${materialItem.supplierCode?default("")}</#if>" type="text" placeholder="供应商编码" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>供应商名称:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="supplierName" value="<#if materialItem??>${materialItem.supplierName?default("")}</#if>" type="text" placeholder="供应商名称" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>创建日期:</span> <span class="fc_red">*</span></td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" placeholder="创建日期" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>合同编码:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="contractCode" value="<#if materialItem??>${materialItem.contractCode?default("")}</#if>" type="text" placeholder="合同编码" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>计划员:</span> <span class="fc_red">*</span></td>
    		<td><input name="planner" value="<#if materialItem??>${materialItem.planner?default("")}</#if>" type="text" placeholder="计划员" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>大类编码:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="classCode" value="<#if materialItem??>${materialItem.classCode?default("")}</#if>" type="text" placeholder="大类编码" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>项目编码:</span> <span class="fc_red">*</span></td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" placeholder="项目编码" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>项目描述:</span><span class="fc_red">*</span></td>
    		<td>
    			<input name="itemDescription" value="<#if materialItem??>${materialItem.itemDescription?default("")}</#if>" type="text" placeholder="项目描述" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>Line Num:</span> </td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>出货数:</span></td>
    		<td>
    			<input name="supplierName" value="<#if materialItem??>${materialItem.supplierName?default("")}</#if>" type="text" placeholder="出货数" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>Quantity PO:</span> </td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="left"><span>QuantityUnreceived:</span></td>
    		<td>
    			<input name="supplierName" value="<#if materialItem??>${materialItem.supplierName?default("")}</#if>" type="text"  class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>半成品:</span> </td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr class="itemTableTr">
    		<td class="itemTableLabel" align="right"><span>成品:</span></td>
    		<td>
    			<input name="supplierName" value="<#if materialItem??>${materialItem.supplierName?default("")}</#if>" type="text"  class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
	        </td>
    		
    		<td class="itemTableLabel" align="right"><span>产出时间:</span> </td>
    		<td><input name="createrTime" value="<#if materialItem??>${materialItem.createrTime?default("")}</#if>" type="text" class="form_input" size="32" maxlength="80" onKeyUp="javascript:clearError();" notnull>
        	</td>
    	</tr>
    	
    	<tr style="height:8px;"></tr>
    	<tr>
    		<td class="itemTableLabel" align="right"><span>备注:</span></td>
    		<td colspan="3">
    		  <textarea style="width:98%;height:80px;"> </textarea>
	        </td>
    	</tr>
    	
    	 <tr>       
		    <td ></td>
			<td colspan="2" align="center"><a href="javascript:getTopDetail()" >保存</a></td>
			<td></td>
	     </tr>
    	
    	
    </table>
    
    
    
   </form>
       		
<div>
</body>
</html>
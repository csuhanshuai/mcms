<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var BasePath="${BasePath}";
</script>

<title>微信公众平台管理系统</title>

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/jquery.resizableColumns.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/Store.js'></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
.table tr:hover{background:#E4F1FC;}
.demo{width:1500px;margin:40px auto;}
.demo h2{font-size:18px;height:52px;color:#3366cc;text-align:center;}
.listext th{padding:0px 15px; border:1px solid #ddd; background:#D4ECF8;height:30px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext td{padding:3px 20px 3px 20px; border:1px solid #ddd; text-align:center; empty-cells:show;height:25px; font-size:13px; white-space:nowrap;overflow:hidden;word-break:keep-all;}

.rc-handle-container{position:relative;}
.rc-handle{position:absolute;width:7px;cursor:ew-resize;*cursor:pointer;margin-left:-3px;}
</style>


</head>

<body style="height:200px" >


<div id="iframe_page" style="overflow:hidden;">
    <div class="iframe_content" style="overflow:hidden;">
	    <div class="iframe_content">
	        <div class="r_nav">
		    <ul>
			<li class="cur"> <a href="${BasePath}/material/log/gotoLogList.kq">操作日志查询</a></li>
		   </ul>
	   </div>
	   <div id="url" class="r_con_wrap">
				<form action="${BasePath}/material/log/gotoLogList.kq" name="qcust" id="qcust" method="get">
				   <table border="0" cellpadding="0" cellspacing="0">  
					       <tr>
					       		<td> 操作人：<input type="text" name="user_name" value="${user_name?default("")}"> &nbsp;&nbsp;</td>
					       		<td>Item Code：<input type="text" name="itemCode" value="${item_code?default("")}"></td>
					        	<td> <#assign optype="${op_type}"> 
						         &nbsp;&nbsp;    操作类型:&nbsp;&nbsp;<select name="op_type"  id="operateType">
						                        <option value="0" <#if  optype??&&optype=="0"> selected="selected" </#if> >请选择类型</option>
						                        <option value="1" <#if  optype??&&optype=="1"> selected="selected" </#if> >新增</option>
												<option value="2" <#if  optype??&&optype=="2"> selected="selected" </#if> >修改</option>
												<option value="3" <#if  optype??&&optype=="3"> selected="selected" </#if> >删除</option>
												<option value="4" <#if  optype??&&optype=="4"> selected="selected" </#if> >导入</option>
						          			</select>
								</td>
					    		<td style="float: left;margin-left: 10px;margin-right: 0px;"><input type="submit" value="查询" class="btn_green btn_w_120" style="width:80px;" onClick="tijiao()" >
					    		</td>
						  </tr>
				    </table>
				</form>
				<div style="height:10px"></div>
				<div id="cloneDIV" style="position:relative;">
				<div id="tableDIV" style="overflow:auto;">
					    <table id="itemTable" border="0" cellpadding="0" cellspacing="0" class="table listext">
					     <thead>
					            <tr id="theadTr">
					                <th  nowrap="nowrap"><div style="text-align:center;">序号</div></th>
					                <th  nowrap="nowrap"><div style="text-align:center;">操作人</div></th>
					                <th  nowrap="nowrap"><div style="text-align:center;">Item Code</div></th>  
							        <th  nowrap="nowrap"><div style="text-align:center;">操作类型</div></th>
							        <th  nowrap="nowrap"><div style="text-align:center;">操作时间</div></th> 
							        <th  nowrap="nowrap"><div style="text-align:center;">操作列名称</div></th> 
							        <th  nowrap="nowrap"><div style="text-align:center;">操作前值</div></th> 
							        <th  nowrap="nowrap"><div style="text-align:center;">操作后值</div></th> 
					            </tr>
					        </thead>
					        <tbody>
					       <#if pageFinder?? && (pageFinder.data)?? >
						      		<#list pageFinder.result as item>		
								 <tr id='Tr${item.id}' >
								 				 <input type="hidden" >
												 <td>${item_index+1}</td>
												 <td>${item.user_name?default("")}</td>
												  <td>${item.itemCode?default("")}</td>
												 <td>
												 <#if item.op_type==1>
												   新增
												    <#elseif  item.op_type==2>
					                                                                          修改
					                              <#elseif  item.op_type==3>
					                                                                          刪除
					                               <#else>
					  	                                                                导入     
												 </#if>
												 </td>
												 <td>${item.create_time?default("")}</td>
												 <td>${item.op_column_name?default("")}</td>
												 <td>
												      <#if item.op_column_name??&&item.op_column_name=="是否可消耗">
												         <#if item.op_before_value??&&item.op_before_value=="1">
												                                   可全部消耗 
												         <#elseif item.op_before_value??&&item.op_before_value=="2">     
												                                    可部分消耗  
												         <#elseif item.op_before_value??&&item.op_before_value=="3">     
												                                   不可消耗
												         <#else>     
												                                   初始状态
												         </#if>
												      <#elseif item.op_column_name??&&item.op_column_name=="评审处理意见">
												          <#if item.op_before_value??&&item.op_before_value=="1">
												                                  改制消耗  
												         <#elseif item.op_before_value??&&item.op_before_value=="2">     
												                                    其他项目原配制消耗
												         <#elseif item.op_before_value??&&item.op_before_value=="3">     
												                                  报废/取消部他
												         <#elseif item.op_before_value??&&item.op_before_value=="4">     
												                                   推动原项目消耗           
												         <#else>     
												                                
												         </#if>
												       <#elseif item.op_column_name??&&item.op_column_name=="货龄">
												          <#if item.op_before_value??&&item.op_before_value=="1">
												                                 1-3个月
												         <#elseif item.op_before_value??&&item.op_before_value=="2">     
												                                 4-6个月
												         <#elseif item.op_before_value??&&item.op_before_value=="3">     
												                                  7-9个月
												         <#elseif item.op_before_value??&&item.op_before_value=="4">     
												                                 10-12个月
												         <#elseif item.op_before_value??&&item.op_before_value=="5">     
												                                  13-24个月      
												         <#elseif item.op_before_value??&&item.op_before_value=="6">     
												                                  24个月以上                           
												         <#else>     
												                                
												         </#if>
												       
												      <#else>
												         ${item.op_before_value?default("")}
												      </#if>
												      
												 </td>
												 
												 <td>
												      <#if item.op_column_name??&&item.op_column_name=="是否可消耗">
												         <#if item.op_after_value??&&item.op_after_value=="1">
												                                      可全部消耗
												         <#elseif item.op_after_value??&&item.op_after_value=="2">     
												                                      可部分消耗                        
												         <#elseif item.op_after_value??&&item.op_after_value=="3">     
												                                     不可消耗                     
												         <#else>     
												                                    初始状态                     
												         </#if>
												       <#elseif item.op_column_name??&&item.op_column_name=="评审处理意见">
												          <#if item.op_after_value??&&item.op_after_value=="1">
												                                  改制消耗  
												         <#elseif item.op_after_value??&&item.op_after_value=="2">     
												                                    其他项目原配制消耗
												         <#elseif item.op_after_value??&&item.op_after_value=="3">     
												                                  报废/取消部他
												         <#elseif item.op_after_value??&&item.op_after_value=="4">     
												                                   推动原项目消耗           
												         <#else>     
												                                
												         </#if>
												       <#elseif item.op_column_name??&&item.op_column_name=="货龄">
												          <#if item.op_after_value??&&item.op_after_value=="1">
												                                 1-3个月
												         <#elseif item.op_after_value??&&item.op_after_value=="2">     
												                                 4-6个月
												         <#elseif item.op_after_value??&&item.op_after_value=="3">     
												                                 7-9个月
												         <#elseif item.op_after_value??&&item.op_after_value=="4">     
												                                 10-12个月
												         <#elseif item.op_after_value??&&item.op_after_value=="5">     
												                                 13-24个月 
												         <#elseif item.op_after_value??&&item.op_after_value=="6">     
												                                 24个月以上 
												         <#else>     
												                                
												         </#if>
												      <#else>
												         ${item.op_after_value?default("")}
												      </#if>
												</td>
												 
												
							                </tr>
							      		</#list>	
							      		
							      	<#else>
							     <tr><td colspan="8" width="13%"><div class="yt-tb-list-no">暂无内容</div></td></tr>
						    </#if>
						     </tbody>
					    </table>
				 </div>
				</div>
<div style="height:10px;"></div>

<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="qcust" />    

<script type='text/javascript' >
	$(document).ready(function() {
		var tableDIV=document.getElementById('tableDIV');
	   var turn_page=document.getElementById('turn_page');
	   tableDIV.style.height=(parent.document.documentElement.clientHeight-190)+"px";
	   tableDIV.style.width=(parent.document.documentElement.clientWidth-205)+"px";
	   turn_page.style.width=(parent.document.documentElement.clientWidth-195)+"px";
			
		
	   $(window).resize(function() {
		   tableDIV.style.height=(parent.document.documentElement.clientHeight-190)+"px";
		   tableDIV.style.width=(parent.document.documentElement.clientWidth-205)+"px";
		   turn_page.style.width=(parent.document.documentElement.clientWidth-195)+"px";
	   });
		
		
		var itemTable=document.getElementById('itemTable');
			
		$("#itemTable th div").each(function(){
			$(this).css("width",$(this).get(0).clientWidth);
		});
		
	});


     function tijiao(){
     
      var pageSize=$("#pageSizeInput").val();
	  var pageForm =document.getElementById("qcust");
	  var imgTip="<img id=\"tempImg\" src=\"${BasePath}/images/right.png\"></img>";   
	  var inputHidden="<input type='hidden' name=\"pageSizeInput\" value=\""+pageSize +"\">";
	  $(pageForm).append(inputHidden);
      pageForm.submit();
     
     }

      
	 function getLogDetail(id){
		showThickBox("日志信息明细",BasePath+"/material/log/gotoLogDetail/"+id+".kq?TB_iframe=true&height=550&width=750",false);
	}
</script>    
    
</body>
</html>

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
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>

<style type="text/css">
.table tr:hover{background:#E4F1FC;}
.listext th{padding:0px 15px; border:2px solid #ddd; background:#D4ECF8;height:30px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext td{padding:2px 5px 2px 5px; border:2px solid #ddd; text-align:center; empty-cells:show;height:25px; font-size:12px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.main_content{background:#fff; padding-top:12px; padding-bottom:5px;padding-right:5px;}
</style>




</head>

<body>

<input type="hidden" value="${size}" id="size"> 
<input type="hidden" value="${year?default("")}" id="nowyear">
<input type="hidden" value="${month?default("")}" id="nowmonth">
<div id="iframe_page" style="overflow:hidden;">
        <div class="r_nav" >
		    <ul>
			<li class="cur"> <a href="${BasePath}/lanterngame/listQuestion.kq">库存编辑</a>
			
			</li>
		   </ul>
		</div>

		<div class="main_content" >
			    <form action="${BasePath}/material/manager/queryList.kq" id="qcust">
					<table border="0" cellpadding="0" cellspacing="0" >
				        <tr>    
				        
				        	<td> <input style="padding-left:5px;width:80px;text-align:left;"  placeholder="时间" name="selectYearMonth" value="${selectYearMonth?default("")}" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM'})" >&nbsp;</td>   
							<td ><input type="text" style="width:150px;" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索引" name="index_" value="${index_?default("")}">&nbsp;</td>
							<td ><input type="text" name="item_code" value="${itemcode?default("")}"placeholder="Item Code" style="padding-left:5px;width:80px;">&nbsp;</td>
							<td ><input type="text" name="item_Name" value="${itemName?default("")}" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品" style="padding-left:5px;width:80px;"></td>
						    <td >&nbsp;<input type="text" name="contract_Code" value="${contractCode?default("")}" placeholder="&nbsp;&nbsp;Contract Code" style="padding-left:5px;width:110px;"></td>
						    <td >&nbsp;<input type="text" name="supplier_Name" value="${supplierName?default("")}" placeholder=" Supplier Name" style="padding-left:5px;width:110px;"></td>
						    
						    <td >
							    <select style="height:30px;margin-left:2px;margin-right:2px;"  name="stock_Age">
					    			<option value="" <#if !stock_Age??||stock_Age=="0">selected="selected"</#if>   >请选择货龄</option>
						    		<option value="1" <#if stock_Age??&&stock_Age=="1">selected="selected"</#if>   >1-3个月</option>
						    		<option value="2" <#if stock_Age??&&stock_Age=="2">selected="selected" </#if>    >4-6个月</option>
						    		<option value="3" <#if stock_Age??&&stock_Age=="3">selected="selected"  </#if>  >7-9个月</option>
						    		<option value="4" <#if stock_Age??&&stock_Age=="4">selected="selected"  </#if>   >10-12个月</option>
						    		<option value="5" <#if stock_Age??&&stock_Age=="5">selected="selected"  </#if>   >13-24个月</option>
						    		<option value="6" <#if stock_Age??&&stock_Age=="6">selected="selected"  </#if>   >24个月以上</option>
					    		</select>
						    </td>
						    
						    
						    
						    
						    <td >&nbsp;<a href="javascript:searchFun()" class="btn_green btn_w_120" style="width:90px;height:28px" >查询</a></td>
						    <td ><a href="javascript:getTopDetail()" class="btn_green btn_w_120" style="width:90px;height:28px;margin-left:-10px;">定制列</a></td>
				        </tr>
				    </table>
			    </form>
		    	<div style="height:10px;"> </div>
		    	<div id="cloneDIV" style="position:relative;">
					<div id="tableDIV" style="overflow:auto;">
					    <table id="itemTable" cellpadding="0" cellspacing="0"  class="table listext"   style=" border-collapse:collapse;">
					        <thead>
					            <tr id="theadTr" >
					            	<#if columnList??>
					            		<th style="padding:3px" nowrap="nowrap" >序号</th>
										<#list columnList as columnItem>			
											<th  nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">${columnItem.columnName}</div></th>
										</#list>
								  	<#else>
								  		<div class="yt-tb-list-no">暂无内容</div>
									</#if>
					            </tr>
					        </thead>
					        <tbody>
						       <#if pageFinder?? && (pageFinder.data)?? >
							      	 <#list pageFinder.result as item>		
									 	   <tr id='${item.id}' style="cursor: pointer;">
												 <#if columnList??>
												 <td align="center" style="padding:0px">${item_index+1}</td>
													<#list columnList as columnItem>	
														 <#assign var="${columnItem.columnCode}">
														 
														 <#if var=="canConsumption"||var=="handlerOption"||var=="stockAge">
															 <td nowrap="nowrap" align="center"  style="background-color:#fdffd0"  >
														 <#elseif var=="notFinishedNum"||var=="finishedNum"||var=="lineNum"||var=="shipmentNum"||var=="quantityPo"||var=="quantityUnreceived"||var=="sumNum"||var="dullCycle"||var="currentStatus">
														 	 <td nowrap="nowrap" align="center"  style="background-color:#ccfecc" >
														 <#elseif var=="outputTime"||var=="poLineRemark"||var=="consumptionPlan"||var=="stockReason"||var=="dullProject"||var=="reasonRemark"||var=="handeOption"||var=="remark"||var=="handler"||var=="nextHandler">
														 	 <td nowrap="nowrap"  align="center"  style="background-color:#d7fff0" >
														 <#else>
														 	 <td nowrap="nowrap"  align="center" >
														 </#if>
														 
														    <#if var=="year"||var=="index_"||var=="itemName"||var=="cegBuyer"||var=="supplierCode"||var=="supplierName"||var=="poCreateDate"||var=="contractCode"||var=="planner"||var=="classCode"||var=="itemCode"||var=="itemDescription">
												 				<#if var=="poCreateDate">
												 					<span>
												 						<div title="${item['${columnItem.columnCode}']?default("")}" >
															    			${(item.poCreateDate?string("yyyy-MM-dd"))!''}
								 							    		</div>
															    	</span>
															    <#elseif var=="year">
															    	<span>
															    		<div title="${item['${columnItem.columnCode}']?default("")}" >
															    			${(item.createTime?string("yyyy-MM"))!''}
															    		</div>
															    	</span>
															    <#elseif var=="itemDescription">
															    	<span style="display:block;width:210px;">
													    				<div title="${item.itemDescription?default("")}	" style="max-width:200px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; ">
													    					${item.itemDescription?default("")}
													    				</div>
													    			</span>				
													    		<#else>
													    			<span>
													    				<div title="${item['${columnItem.columnCode}']?default("")}" >
													    					${item['${columnItem.columnCode}']?default("")}
													    				</div>
													    			</span>
															    </#if>
														    	
														    <#elseif var=="canConsumption">	
														    	<span class="canConsumptionSpan" id="canConsumptionSpan_${item_index+1}"   style="display:none"> 
														    		<select class="canConsumptionSpanSelect" name="${columnItem.columnCode}">
															    		<option value="0" <#if !item.canConsumption??||item.canConsumption==0>selected="selected"</#if>   >初始状态</option>
															    		<option value="1" <#if item.canConsumption??&&item.canConsumption==1>selected="selected" </#if>    >可全部消耗</option>
															    		<option value="2" <#if item.canConsumption??&&item.canConsumption==2>selected="selected"  </#if>  >可部分消耗</option>
															    		<option value="3" <#if item.canConsumption??&&item.canConsumption==3>selected="selected"  </#if>   >不可消耗</option>
														    		</select>
														    	</span> 
														    	
														    	<span style="display:block;width:115px;">
														    		<#if item.canConsumption??&&item.canConsumption==1>
														    			可全部消耗  
														    		<#elseif item.canConsumption??&&item.canConsumption==2>	
														    			可部分消耗  
														    		<#elseif item.canConsumption??&&item.canConsumption==3>
														    			不可消耗
														    		<#else>
														    			初始状态
														    		</#if>
														    	</span>
														    	
														    	
														    <#elseif var=="stockAge">	
														    	<span class="stockAge" id="stockAge${item_index+1}"   style="display:none"> 
														    		<select class="stockAgeSpanSelect" name="${columnItem.columnCode}">
														    			<option value="0" <#if !item.stockAge??||item.stockAge=="0">selected="selected"</#if>   ></option>
															    		<option value="1" <#if item.stockAge??&&item.stockAge=="1">selected="selected"</#if>   >1-3个月</option>
															    		<option value="2" <#if item.stockAge??&&item.stockAge=="2">selected="selected" </#if>    >4-6个月</option>
															    		<option value="3" <#if item.stockAge??&&item.stockAge=="3">selected="selected"  </#if>  >7-9个月</option>
															    		<option value="4" <#if item.stockAge??&&item.stockAge=="4">selected="selected"  </#if>   >10-12个月</option>
															    		<option value="5" <#if item.stockAge??&&item.stockAge=="5">selected="selected"  </#if>   >13-24个月</option>
															    		<option value="6" <#if item.stockAge??&&item.stockAge=="6">selected="selected"  </#if>   >24个月以上</option>
														    		</select>
														    	</span> 
														    	
														    	<span style="display:block;width:115px;">
														    		<#if !item.stockAge??||item.stockAge=="0">
														    		
														    		<#elseif item.stockAge??&&item.stockAge=="1">
														    			1-3个月 
														    		<#elseif item.stockAge??&&item.stockAge=="2">	
														    			4-6个月
														    		<#elseif item.stockAge??&&item.stockAge=="3">
														    			7-9个月
														    		<#elseif item.stockAge??&&item.stockAge=="4">
														    			10-12个月
														    		<#elseif item.stockAge??&&item.stockAge=="5">
														    			13-24个月
														    		<#elseif item.stockAge??&&item.stockAge=="6">
														    			24个月以上
														    		</#if>
														    	</span>	
														    	
															<#elseif var=="handlerOption">	
														    	<span class="handlerOption" id="handlerOption_${item_index+1}" style="display:none"> 
														    		<select class="handlerOptionSpanSelect" name="${columnItem.columnCode}">
														    		
														    			<option value="0"  <#if !item.handlerOption??>selected="selected"</#if> > </option>
															    		<option value="1" <#if item.handlerOption??&&item.handlerOption=="1">selected="selected"</#if>   >改制消耗</option>
															    		<option value="2" <#if item.handlerOption??&&item.handlerOption=="2">selected="selected" </#if>    >其他项目原配制消耗</option>
															    		<option value="3" <#if item.handlerOption??&&item.handlerOption=="3">selected="selected"  </#if>  >报废/取消</option>
															    		<option value="4" <#if item.handlerOption??&&item.handlerOption=="4">selected="selected"  </#if>   >推动原项目消耗</option>
														    		</select>
														    	</span> 
														    	
														    	<span style="display:block;width:165px;">
														    		<#if item.handlerOption??&&item.handlerOption=="1">
														    			改制消耗  
														    		<#elseif item.handlerOption??&&item.handlerOption=="2">	
														    			其他项目原配制消耗
														    		<#elseif item.handlerOption??&&item.handlerOption=="3">
														    			报废/取消
														    		<#elseif item.handlerOption??&&item.handlerOption=="4">
														    			推动原项目消耗
														    		<#else>
														    				
														    		</#if>
														    	</span>								   
														     <#else>
														    	 <#if var=="outputTime">  
														    	 	<span style="display:none;width:100px;" id='${item.id}_outputtime'>
															    		<input style="width:100%;height:20px;" readOnly="true"  type="text" name="${columnItem.columnCode}" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"    value="${(item.outputTime?string("yyyy-MM-dd"))!''}"   />
															    	</span>
															    	
															    	
															    	<span style="display:block;width:100px;margin:0px auto;">
															    		<div  style="max-width:100px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; ">
															    			${(item.outputTime?string("yyyy-MM-dd"))!''}
															    		</div>
															    	</span>
															    	
															     <#else>
															    	
															    	<#if var=="stockReason"||var=="remark"||var=="poLineRemark"||var=="consumptionPlan"> 
															    		<span style="display:none;width:220px;">
																    		<input style="width:100%;height:20px;"  type="text" name="${columnItem.columnCode}" value="${item['${columnItem.columnCode}']?default("")}" />
																    	</span>
															    		<span style="display:block;width:220px;">	
															    			<div title="${item['${columnItem.columnCode}']?default("")}" style="max-width:215px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;    ">
															    	
															    	<#else>
															    		<span style="display:none;width:100px;margin:0px auto;">
																    		<input style="width:100%;height:20px;"  type="text" name="${columnItem.columnCode}" value="${item['${columnItem.columnCode}']?default("")}" />
																    	</span>
															    		<span style="display:block;width:100px;margin:0px auto;">
															    			<div title="${item['${columnItem.columnCode}']?default("")}" style="max-width:200px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; ">
															    	</#if>
															    			${item['${columnItem.columnCode}']?default("")}
															    		</div>
															    	</span>
														   		 </#if>
														   
														    </#if>
														    
														 </td>
														 
													</#list>
											  	<#else>
											  		<tr><td colspan="${size+1}"><div class="yt-tb-list-no">没有记录</div></td></tr>
												</#if>
								           </tr>
								      </#list>	
								<#else>
								     <tr><td colspan="${size+1}"><div class="yt-tb-list-no">没有记录</div></td></tr>
							    </#if>
						   </tbody>
					    </table>
					 </div>
				</div>		
    	</div>
   
<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="qcust" />   

</div>



<script type='text/javascript' >
	




	$(document).ready(function() {
		
	   var tableDIV=document.getElementById('tableDIV');
	   
	   var turn_page=document.getElementById('turn_page');
	   tableDIV.style.height=(parent.document.documentElement.clientHeight-190)+"px";
	   tableDIV.style.width=(parent.document.documentElement.clientWidth-195)+"px";
	   turn_page.style.width=(parent.document.documentElement.clientWidth-195)+"px";
		
	   var itemcode = $("#itemcode");	
	   var codeval=itemcode.attr('value');
	   var contractCode = $("#contractCode");	
	   var contractCodeval=contractCode.attr('value');
	   var myReg = /^[\u4e00-\u9fa5]+$/;
	   if(myReg.test(codeval)||myReg.test(contractCodeval)){
	      alert("itemcode和contracCode不允许为中文");
	      return false;
	   }
		var itemTable=document.getElementById('itemTable');
		$("#itemTable th div").each(function(){
			$(this).css("width",$(this).get(0).clientWidth);
		});
		//表头固定
		var tableClone="<div id=\"cloneTableDIV\"><table id=\"cloneTable\" cellpadding='0' cellspacing='0' class='table listext'   style=' border-collapse:collapse;'><thead id='testCloneThead'></thead><tbody></tbody></table></div>";
    	$("#cloneDIV").append(tableClone);
    	var theadTr=document.getElementById("theadTr");
    	var theadItemClone=theadTr.cloneNode(true);
    	$("#testCloneThead").append($(theadItemClone));
    	//$("#cloneTable").css("width",itemTable.scrollWidth);
    	$("#cloneTableDIV").css("width",tableDIV.clientWidth);
    	$("#cloneTableDIV").css("position","absolute");
    	$("#cloneTableDIV").css("overflow","hidden");
    	$("#cloneTableDIV").css("z-index","2");
    	$("#cloneTableDIV").css("left","0px");
    	$("#cloneTableDIV").css("top","0px");
		var shangyiciScrollLeft=$("#tableDIV").scrollLeft();
		var width=$("#cloneTableDIV").css("width");
		var iwidth=parseInt(width);
		
		$("#tableDIV").scroll(function() {
		  	var scrollLeft=$("#tableDIV").scrollLeft();
		  	var rwidth=iwidth+scrollLeft+"px";
		  	$("#cloneTableDIV").css("width",rwidth);
		  	$("#cloneTableDIV").css("left",0-scrollLeft+"px");
		  	$("#cloneTableDIV").css("overflow","hidden");
    		$("#cloneTableDIV").css("top","0px");
    		$("#cloneTableDIV").css("z-index","2");
		});		
		
		
		
		$(window).resize(function() {
		   tableDIV.style.height=(parent.document.documentElement.clientHeight-190)+"px";
	   	   tableDIV.style.width=(parent.document.documentElement.clientWidth-195)+"px";
	   	   turn_page.style.width=(parent.document.documentElement.clientWidth-195)+"px";
		   $("#cloneTableDIV").remove();
		   tableClone="<div id=\"cloneTableDIV\"><table id=\"cloneTable\" cellpadding='0' cellspacing='0' class='table listext'   style=' border-collapse:collapse;'><thead id='testCloneThead'></thead><tbody></tbody></table></div>";
    	   $("#cloneDIV").append(tableClone);
    	   var theadTr=document.getElementById("theadTr");
    	   var theadItemClone=theadTr.cloneNode(true);
    	   $("#testCloneThead").append($(theadItemClone));
    	   
		   var shangyiciScrollLeft=$("#tableDIV").scrollLeft();
		   var width=tableDIV.clientWidth;
		   var iwidth=parseInt(width);
		   var scrollLeft1=$("#tableDIV").scrollLeft();
		   var rwidth1=iwidth+scrollLeft1+"px";
		   $("#cloneTableDIV").css("position","absolute");
    	   $("#cloneTableDIV").css("top","0px");
    	   $("#cloneTableDIV").css("left",0-scrollLeft1+"px");
    	   $("#cloneTableDIV").css("overflow","hidden");
    	   $("#cloneTableDIV").css("z-index","2");
    	   $("#cloneTableDIV").css("width",rwidth1);
		   
		   
		   
		   $("#tableDIV").scroll(function() {
			  	var scrollLeft=$("#tableDIV").scrollLeft();
			  	var rwidth=iwidth+scrollLeft+"px";
			  	$("#cloneTableDIV").css("width",rwidth);
			  	$("#cloneTableDIV").css("left",0-scrollLeft+"px");
			  	$("#cloneTableDIV").css("overflow","hidden");
	    		$("#cloneTableDIV").css("top","0px");
	    		$("#cloneTableDIV").css("z-index","2");
		   });		
		});
		
		
		var tempValue="";
		var lastSpan=null;
		
		$('#itemTable input').bind('keyup', function(event) {
	        if (event.keyCode == "13") {
	    			var itemID=$(this).parent().parent().parent().attr("id");
	    			if(tempValue==$(this).val()){
	    				$(this).parent().css("display","none");
				    	$(this).parent().next().css("display","block");
	    			}else{
	    				if(checkInput($(this),$(this).attr('name'),$(this).val())){
		    				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
		    				if($(this).attr('name')=='stockReason'||$(this).attr('name')=='remark'||$(this).attr('name')=='poLineRemark'||$(this).attr('name')=='consumptionPlan'){
		    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
		    					$(this).css("width","90%");
				        		$(this).parent().append(img);
				        		var T=$(this);
				        		setTimeout(function () {
				                    T.parent().css("display","none");
					    			T.parent().next().css("display","block");
					    			T.parent().next().find("div:first").text(T.val());
					    			T.parent().next().find("div:first").attr("title",T.val());
					    			$("#tempImg").remove();
					    			T.css("width","100%");
				                }, 500);
		    				}else if($(this).attr('name')=='dullProject'){
		    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
		    					$(this).css("width","85%");
				        		$(this).parent().append(img);
				        		var T=$(this);
				        		setTimeout(function () {
				                    T.parent().css("display","none");
					    			T.parent().next().css("display","block");
					    			T.parent().next().find("div:first").text(T.val());
					    			T.parent().next().find("div:first").attr("title",T.val());
					    			$("#tempImg").remove();
					    			T.css("width","100%");
				                }, 500);
		    				}else{
		    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:4px;vertical-align:middle;\">";
		    					$(this).parent().css("display","none");
					    		$(this).parent().next().css("display","block");
					    		$(this).parent().next().find("div:first").text($(this).val());
					    		$(this).parent().next().find("div:first").attr("title",$(this).val());
				        		$(this).parent().next().find("div:first").append(img);
				        		setTimeout(function () {
					    			$("#tempImg").remove();
				                }, 500);
		    				}
		    			}else{
		    				var t=$(this);
		    				setTimeout(function(){t.focus().select();}, 0);
		    				return;
		    			}
		    	}
		        
		     }
	    });
		
		
		
		
		
		$("#itemTable input").each(function(){
			if($(this).attr("name")=="outputTime" ){
			}else{
	    		$(this).blur(function(){
		    			var itemID=$(this).parent().parent().parent().attr("id");
		    			if(tempValue==$(this).val()){
		    				$(this).parent().css("display","none");
					    	$(this).parent().next().css("display","block");
		    			}else{
		    				if(checkInput($(this),$(this).attr('name'),$(this).val())){
			    				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
			    				if($(this).attr('name')=='stockReason'||$(this).attr('name')=='remark'||$(this).attr('name')=='poLineRemark'||$(this).attr('name')=='consumptionPlan'){
			    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
			    					$(this).css("width","90%");
					        		$(this).parent().append(img);
					        		var T=$(this);
					        		setTimeout(function () {
					                    T.parent().css("display","none");
						    			T.parent().next().css("display","block");
						    			T.parent().next().find("div:first").text(T.val());
						    			T.parent().next().find("div:first").attr("title",T.val());
						    			$("#tempImg").remove();
						    			T.css("width","100%");
					                }, 500);
			    				}else if($(this).attr('name')=='dullProject'){
			    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
			    					$(this).css("width","85%");
					        		$(this).parent().append(img);
					        		var T=$(this);
					        		setTimeout(function () {
					                    T.parent().css("display","none");
						    			T.parent().next().css("display","block");
						    			T.parent().next().find("div:first").text(T.val());
						    			T.parent().next().find("div:first").attr("title",T.val());
						    			$("#tempImg").remove();
						    			T.css("width","100%");
					                }, 500);
			    				}else{
			    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:4px;vertical-align:middle;\">";
			    					$(this).parent().css("display","none");
						    		$(this).parent().next().css("display","block");
						    		$(this).parent().next().find("div:first").text($(this).val());
						    		$(this).parent().next().find("div:first").attr("title",$(this).val());
					        		$(this).parent().next().find("div:first").append(img);
					        		setTimeout(function () {
						    			$("#tempImg").remove();
					                }, 500);
			    				}
			    			}else{
			    				var t=$(this);
			    				setTimeout(function(){t.focus().select();}, 0);
			    				return;
			    			}
		    			}
	    		});
	    	}
    	})
    	
	    	
    	$("#itemTable td").each(function(){
    		$(this).click(function(){
    			var tdSpan1=$(this).find('span:first');
    			var tdSpan2=tdSpan1.next();
    			if(lastSpan&&lastSpan.attr("id")!=tdSpan1.attr("id")){
    				if(lastSpan.attr("id")&&lastSpan.attr("id").indexOf("outputtime")){
						var lastSpanInput= lastSpan.find('input:first');    	
						var tdSpan1Input=tdSpan1.find('input:first');  
    					if(lastSpanInput.val()!=""){
    						var itemID=lastSpan.parent().parent().attr("id");   				
	    					ajaxRowEditSaveFun(itemID,lastSpanInput.attr('name'),lastSpanInput.val());
	    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
	    					lastSpanInput.css("width","80%");
			        		lastSpan.append(img);
			        		var T=lastSpan;
			        		setTimeout(function () {
			                    T.css("display","none");
				    			T.next().css("display","block");
				    			T.next().find("div:first").text(lastSpanInput.val());
				    			T.next().find("div:first").attr("title",lastSpanInput.val());
				    			$("#tempImg").remove();
				    			lastSpanInput.css("width","100%");
			                }, 500);
    					}else{
    						lastSpan.css("display","none");
	    					lastSpan.next().css("display","block");
    					}
	    				
    				}else{
    					lastSpan.css("display","none");
	    				lastSpan.next().css("display","block");
    				}
    			}
    			if(tdSpan1&&tdSpan2){
    				if(tdSpan1.css("display")=="none" ){
    				    tdSpan1.css("display","block");
    				    tdSpan2.css("display","none");
    				    tdSpan1.find('input:first').focus();
    				    //tdSpan1.find('input:first').click();
    				    tempValue=tdSpan1.find('input:first').val();
    				    lastSpan=tdSpan1;
    				}
    			}
    		})
    	})
    	
    	
    	
    	
    	
    	$(".canConsumptionSpanSelect").each(function(){
    		$(this).change(function(){
	        	var itemID=$(this).parent().parent().parent().attr("id");
				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
				var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:0px;vertical-align:middle;\">";
	    		$(this).parent().append(img);
	    		var T=$(this);
	    		setTimeout(function () {
	                T.parent().css("display","none");
	    			T.parent().next().css("display","");
	    			T.parent().next().text(T.find("option:selected").text());
	    			$("#tempImg").remove();
	            }, 500);
	    	});
    	});
    	
    	
    	
    	$(".handlerOptionSpanSelect").each(function(){
    		$(this).change(function(){
	        	var itemID=$(this).parent().parent().parent().attr("id");
				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
				var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:0px;vertical-align:middle;\">";
	    		$(this).parent().append(img);
	    		var T=$(this);
	    		setTimeout(function () {
	                T.parent().css("display","none");
	    			T.parent().next().css("display","");
	    			T.parent().next().text(T.find("option:selected").text());
	    			$("#tempImg").remove();
	            }, 500);
	    	});
	    	    	
    	});
    	
    	$(".stockAgeSpanSelect").each(function(){
    		$(this).change(function(){
	        	var itemID=$(this).parent().parent().parent().attr("id");
				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
				var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:0px;vertical-align:middle;\">";
	    		$(this).parent().append(img);
	    		var T=$(this);
	    		setTimeout(function () {
	                T.parent().css("display","none");
	    			T.parent().next().css("display","");
	    			T.parent().next().text(T.find("option:selected").text());
	    			$("#tempImg").remove();
	            }, 500);
	    	});
    	});
	});
	
	function selectDateTime(){
		var itemID=$("#selectOutputTime").parent().parent().parent().attr("id");
		if(tempValue==$(this).val()){
			$("#selectOutputTime").parent().css("display","none");
	    	$("#selectOutputTime").parent().next().css("display","");
	    	$("#selectOutputTime").parent().next().text($("#selectOutputTime").val());
		}else{
			if(checkInput($("#selectOutputTime"),$("#selectOutputTime").attr('name'),$("#selectOutputTime").val())){
				ajaxRowEditSaveFun(itemID,$("#selectOutputTime").attr('name'),$("#selectOutputTime").val());
				var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
        		$("#selectOutputTime").parent().append(img);
        		var T=$(this);
        		setTimeout(function () {
                    T.parent().css("display","none");
	    			T.parent().next().css("display","");
	    			T.parent().next().text(T.val());
	    			$("#tempImg").remove();
                }, 500);
			}else{
				$("#selectOutputTime").focus();
				return;
			}
		}
	}
	
	function changeDisplay(obj){
	    obj.parentNode.display="none";
		
		//jqObj.parent().css("display","none");
		//obj.parent().next().css("display","");
	    //obj.parent().next().text(obj.val());
	}
	
	
	function checkInput(obj,name,value){
		if(name=="lineNum"||name=="shipmentNum"||name=="quantityPo"||name=="quantityUnreceived"||name=="notFinishedNum"||name=="finishedNum"||name=="sumNum"||name=="dullCycle"){
			var type = /^[0-9]*[1-9][0-9]*$/;
    		var re = new RegExp(type);
			if(value==0){
				return true;	
			}
			if(value.length>=10){
				alert("请输入10位以内正整数");
				return false;
			}
			if(!value.match(re)){
				alert("请输入0或正整数");
				return false;
			}
			return true;
		}else if(name=="outputTime"){
			var a = /^(\d{4})-(\d{2})-(\d{2})$/;
			if (!a.test(value)) { 
				alert("请按照''yyyy-MM-dd'格式输入日期!") ;
				return false;
			}
			return true;
		}else if(name=="handler"){
			if(value.length>=10){
				alert("不能超过10个字符");
				return false;
			}
			
		}else if(name=="nextHandler"){
			if(value.length>=10){
				alert("不能超过10个字符");
				return false;
			}
		}
		
		
		return true;
	}


	function ajaxRowEditSaveFun(itemID,itemName,itemValue){ 
		 $.ajax({ 
		        type: 'POST', 
		        url: 'ajaxRowEdit.kq?itemID='+itemID+'&itemName='+itemName+'&itemValue='+itemValue,
		        dataType: 'json', 
		        cache: false, 
		        error: function(data){ 
		            document.getElementById("tip").style.display="block";	 
		            return false; 
		        }, 
		        success:function(json){ 
		        	
		      	}    
		 });
	}
	
	function getTopDetail()
	{	
		var id=1;
		showThickBox("定制列",BasePath+"/material/definecolumn/showCustom/"+id+".kq?TB_iframe=true&height=300&width=800",false);
	}



	function searchFun()
	{	
		  var pageSize=$("#pageSizeInput").val();
	  var pageForm =document.getElementById("qcust");
	  var imgTip="<img id=\"tempImg\" src=\"${BasePath}/images/right.png\"></img>";   
	  var inputHidden="<input type='hidden' name=\"pageSizeInput\" value=\""+pageSize +"\">";
	  $(pageForm).append(inputHidden);
      pageForm.submit();
	}
	
</script> 
    
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<meta http-equiv="X-UA-Compatible" content="IE=9" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<script type="text/javascript">
	var BasePath="${BasePath}";
</script>

<title>微信公众平台管理系统</title>

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->

<style type="text/css">
.table tr:hover{background:#E4F1FC;}
.listext th{padding:0px 15px; border:2px solid #ddd; background:#D4ECF8;height:30px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext td{padding:2px 5px 2px 5px; border:2px solid #ddd; text-align:center; empty-cells:show;height:25px; font-size:12px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.main_content{background:#fff; padding-top:12px; padding-bottom:5px;padding-right:5px;z-index:9999}



</style>


</head>

<body>


 <input type="hidden" value="${size}" id="size"> 
   <input type="hidden" value="${year?default("")}" id="nowyear">
    <input type="hidden" value="${month?default("")}" id="nowmonth">
<div id="iframe_page" style="overflow:hidden;">
        <div class="r_nav">
		    <ul>
			<li class="cur"> <a href="${BasePath}/lanterngame/listQuestion.kq">库存查询</a>
			
			</li>
		   </ul>
		</div>

		<div class="main_content" >
		   <form action="${BasePath}/material/stock/queryStockList.kq" id="qcust">
				<table border="0" cellpadding="0" cellspacing="0" >
			        <tr>    
			        	<td> <input style="padding-left:5px;width:80px;text-align:left;"  placeholder="时间" name="selectYearMonth" value="${selectYearMonth?default("")}" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM'})" >&nbsp;</td>   
						<td ><input type="text" style="width:150px;" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索引" name="index_" value="${index_?default("")}">&nbsp;</td>
						<td ><input type="text" name="item_code" value="${itemcode?default("")}"placeholder="Item Code" style="padding-left:5px;width:80px;">&nbsp;</td>
						<td >&nbsp;<input type="text" name="item_Name" value="${itemName?default("")}" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品" style="padding-left:5px;width:80px;"></td>
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
			    <table id="itemTable" cellpadding="0" cellspacing="0" class="table listext"   style=" border-collapse:collapse;">
			        <thead>
			            <tr id="theadTr" >
			            	<#if columnList??>
			            		<th style="padding:3px" nowrap="nowrap">序号</th>
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
										 <td  style="padding:0px">${item_index+1}</td>
											<#list columnList as columnItem>	
												 <#assign var="${columnItem.columnCode}">
												 
												 <#if var=="canConsumption"||var=="handlerOption">
													 <td nowrap="nowrap" >
												 <#elseif var=="notFinishedNum"||var=="finishedNum"||var=="lineNum"||var=="shipmentNum"||var=="quantityPo"||var=="quantityUnreceived"||var=="sumNum"||var="dullCycle"||var="currentStatus">
												 	 <td nowrap="nowrap"  >
												 <#elseif var=="outputTime"||var=="stockAge"||var=="consumptionPlan"||var=="stockReason"||var=="dullProject"||var=="reasonRemark"||var=="handeOption"||var=="remark"||var=="handler"||var=="nextHandler">
												 	 <td nowrap="nowrap" >
												 <#else>
												 	 <td nowrap="nowrap"  >
												 </#if>
												 
												    <#if var=="year"||var=="index_"||var=="itemName"||var=="cegBuyer"||var=="supplierCode"||var=="supplierName"||var=="poCreateDate"||var=="contractCode"||var=="planner"||var=="classCode"||var=="itemCode"||var=="itemCode"||var=="itemDescription">
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
												    	
												    	<span style="display:block;width:110px;">
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
													    		<option value="3" <#if item.handlerOption??&&item.handlerOption=="3">selected="selected"  </#if>  >报废/取消部他</option>
													    		<option value="4" <#if item.handlerOption??&&item.handlerOption=="4">selected="selected"  </#if>   >推动原项目消耗</option>
												    		</select>
												    	</span> 
												    	
												    	<span style="display:block;width:160px;">
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
												    	 	<span style="display:none;width:100px;">
													    		<input style="width:100%;height:20px;" type="text" name="${columnItem.columnCode}" value="${(item.outputTime?string("yyyy-MM-dd"))!''}" />
													    	</span>
													    	
													    	
													    	<span style="display:block;width:100px;margin:0px auto;">
													    		<div  style="max-width:100px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; ">
													    			${(item.outputTime?string("yyyy-MM-dd"))!''}
													    		</div>
													    	</span>
													    	
													     <#else>
													     
													    	
													    	
													    	<#if var=="stockReason"||var=="remark"||var=="poLineRemark"||var=="consumptionPlan"> 
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
    	$("#cloneTable").css("width",itemTable.scrollWidth);
    	$("#cloneTableDIV").css("width",tableDIV.clientWidth);
    	$("#cloneTableDIV").css("position","absolute");
    	$("#cloneTableDIV").css("overflow","hidden");
    	$("#cloneTableDIV").css("z-index","2");
    	$("#cloneTableDIV").css("left","0px");
    	$("#cloneTableDIV").css("top","0px");
    	
    	
    	//$("#cloneTableDIV").css("display","none");
    	
		var shangyiciScrollLeft=$("#tableDIV").scrollLeft();
		var width=$("#cloneTableDIV").css("width");
		var iwidth=parseInt(width);
		$("#tableDIV").scroll(function() {
		  	var scrollLeft=$("#tableDIV").scrollLeft();
		  	var rwidth=iwidth+scrollLeft+"px";
		  	$("#cloneTableDIV").css("width",rwidth);
		  	$("#cloneTableDIV").css("left",0-scrollLeft+"px");
		  	$("#cloneTableDIV").css("overflow","hidden");
		  	$("#cloneTableDIV").css("z-index","2");
    		$("#cloneTableDIV").css("top","0px");
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
		$("#itemTable input").each(function(){
    		$(this).blur(function(){
    			var itemID=$(this).parent().parent().parent().attr("id");
    			if(tempValue==$(this).val()){
    				$(this).parent().css("display","none");
			    	$(this).parent().next().css("display","block");
    			}else{
    				if(checkInput($(this),$(this).attr('name'),$(this).val())){
	    				ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
	    				
	    				
	    				if($(this).attr('name')=='stockReason'||$(this).attr('name')=='consumptionPlan'||$(this).attr('name')=='remark'  ){
	    					var img="<img  id=\"tempImg\" src=\"${BasePath}/images/right.png\" style=\"margin-left:2px;vertical-align:middle;\">";
	    					$(this).css("width","95%");
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
	    				$(this).focus();
	    				return;
	    			}
    			}
	    		
    		});
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
	

	function getTopDetail()
	{	
		var id=2;
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

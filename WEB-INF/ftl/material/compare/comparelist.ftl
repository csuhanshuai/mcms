<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var BasePath="${BasePath}";
</script>

<title>物料呆滞管理系统</title>

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/jquery.resizableColumns.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/Store.js'></script>
<script type='text/javascript' src='${BasePath}/js/jquery.freezeheader.js'></script>   
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

<style type="text/css">
.table tr:hover{background:#E4F1FC;}
.listext th{padding:0px 15px; border:2px solid #ddd; background:#D4ECF8;height:30px; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext td{padding:2px 5px 2px 5px; border:2px solid #ddd; text-align:center; empty-cells:show;height:25px; font-size:12px; white-space:nowrap;overflow:hidden;word-break:keep-all;}

</style>
</head>

<body>
 <input type="hidden" value="" id="size"> 
   <input type="hidden" value="" id="nowyear">
    <input type="hidden" value="" id="nowmonth">
<div id="iframe_page" style="overflow:hidden;">
    <div class="iframe_content" style="overflow:hidden;">
        <div class="r_nav">
		    <ul>
			<li class="<#if type=='noChart'>cur</#if>"> <a href="${BasePath}/material/compare/showCompareList.kq">库存对比</a></li>
			<li class="<#if type=='chart'>cur</#if>"> <a href="${BasePath}/material/manager/testHighChart.kq">物料月份对比</a></li>
		   </ul>
		</div>

		<div id="url" class="r_con_wrap">
		    <div style="height:10px;"></div>
		   <form action="${BasePath}/material/compare/findCompareList.kq" id="searchForm">
				<table border="0" cellpadding="0" cellspacing="0">
			        <tr>       
					    <td style="float: left;margin-left: 0px;">
							年月：<input name="otherDate" style="padding-left:5px;width:80px;text-align:left;"  placeholder="时间" value="${year?default("")}${month?default("")}" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyyMM'})" >
						</td>
					    <td style="float: left;margin-left: 0px;">
							年月：<input name="date" style="padding-left:5px;width:80px;text-align:left;"  placeholder="时间" value="${otherYear?default("")}${otherMonth?default("")}" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyyMM'})" >&nbsp;&nbsp;
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<input type="text" name="index_" value="${index_?default("")}" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索引" style="padding-left:5px;width:150px;">
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<input type="text" name="itemCode" value="${itemCode?default("")}" placeholder="&nbsp;&nbsp;Item Code" style="padding-left:5px;width:80px;">
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<input type="text" name="itemName" value="${itemName?default("")}" placeholder="&nbsp;&nbsp;产品" style="padding-left:5px;width:50px;">
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<input type="text" name="contractCode" value="${contractCode?default("")}" placeholder="&nbsp;&nbsp;Contact Code" style="padding-left:5px;width:100px;">
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<input type="text" name="supplierName" value="${supplierName?default("")}" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;Supplier Name" style="padding-left:5px;width:123px;">
						</td>
						</td>
						<td style="float: left;margin-left: 10px;margin-right: 0px;">
							<a href="javascript:searchFun()" class="btn_green btn_w_120" style="padding-left:5px;width:80px;height:28px">搜索</a>  
						</td>
			        </tr>
			    </table>
		    </form>
		    <div style="height:10px;"> </div>
    
    		<div id="cloneDIV" style="position:relative;">
			<div id="tableDIV" style="overflow:scroll;position:relative;">
			<form action="" name="qcust" id="qcust" method="post">
			    <table id="itemTable" cellpadding="5" cellspacing="0" class="table listext"  style=" border-collapse:collapse;">
			        <thead >
			            <tr id="theadTr">
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">序号</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">索引</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">Item Code</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;"><div style="text-align:center;">产品</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">Contact Code</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">Supplier Name(Supplier Code)</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;"><div style="text-align:center;">${year}年${month}月库存</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;" ><div style="text-align:center;">${otherYear}年${otherMonth}月库存</div></td>
							<th nowrap="nowrap" style="word-wrap:break-word;"><div style="text-align:center;">环比增长</div></td>
			            </tr>
			        </thead>
			        <tbody>
				       <#if otherMaterialInventorys?? && (otherMaterialInventorys.data)?? >
							<#list otherMaterialInventorys.result as item >
							 	<tr id='${item.id}'>
							 	<td >${item_index+1}</td>
							 	<td nowrap="nowrap" >
								 	${item.index_?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.itemCode?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.itemName?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.contractCode?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.supplierName?default("")}
								 	<#if (item.supplierCode?? && item.supplierCode!="") >
								 		(${item.supplierCode?default("")})
								 	</#if>
								 </td>
								 <td nowrap="nowrap" >
								 <#if pageFinder?? && (pageFinder.data)?? >
									 <#if item.otherLineNum??>
										 <#if item.otherLineNum==-100>
										 	暂无数据
										 <#else>
									 		${item.otherLineNum?default("")}
									 	 </#if>
									 	<#else>
									 	暂无数据
									 </#if>
								 <#else>
								 	暂无数据
								 </#if>
								 </td>
								 <td nowrap="nowrap" >
								 	${item.lineNum?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 <#if (item.change??&&item.change>0)>
									<image src="${BasePath}/images/material/zhang.png" />
									<font color="red">${(item.change*100)?string("#.##")?default("")}%</font>
								 <#elseif item.change<0>
									<image src="${BasePath}/images/material/jian.png" />
								 	<font color="green">${(item.change*(-100))?string("#.##")?default("")}%</font>
								 <#else>
								 	${item.change?default("")}%
								</#if>
								</td>
						      	</tr>
						      </#list>	
						<#elseif pageFinder?? && (pageFinder.data)?? >
					      	 <#list pageFinder.result as item >
							 	<tr id='${item.id}'>
							 	<td >${item_index+1}</td>
								 <td nowrap="nowrap" >
								 	${item.index_?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.itemCode?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.itemName?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.contractCode?default("")}
								 </td>
								 <td nowrap="nowrap" >
								 	${item.supplierName?default("")}
								 	<#if (item.supplierCode?? && item.supplierCode!="") >
								 		(${item.supplierCode?default("")})
								 	</#if>
								 </td>
								 <td nowrap="nowrap" >
								 	${item.lineNum?default("")}
								 </td>
								 <td nowrap="nowrap" >
									 	暂无数据
								 </td>
								 <td nowrap="nowrap" >
								 <#if (item.change??&&item.change>0)>
									<image src="${BasePath}/images/material/zhang.png" />
									<font color="red">${(item.change*100)?string("#.##")?default("")}%</font>
								 <#elseif item.change<0>
									<image src="${BasePath}/images/material/jian.png" />
								 	<font color="green">${(item.change*(-100))?string("#.##")?default("")}%</font>
								 <#else>
								 	${item.change?default("")}%
								</#if>
								</td>
						      	</tr>
						      </#list>	
						      <#else>
						     	<tr><td colspan="9"><div class="yt-tb-list-no">没有记录</div></td></tr>
					    </#if>
					    
				   </tbody>
			    </table>
			</form> 
			</div>
    		</div>
<div style="height:10px;"></div>
<#if otherMaterialInventorys?? && (otherMaterialInventorys.data)?? >
	<!-- 翻页标签 -->
	<#import "../compareother-common.ftl"  as page>
	<@page.queryForm formId="qcust" />  
<#elseif pageFinder?? && (pageFinder.data)?? >
	<!-- 翻页标签 -->
	<#import "../app-common.ftl"  as page>
	<@page.queryForm formId="qcust" />  
</#if>

<script type='text/javascript' >
	$(document).ready(function() {
	    var iframe_page=document.getElementById('iframe_page');
		iframe_page.style.height=(parent.document.documentElement.clientHeight-60)+"px";
		
		var tableDIV=document.getElementById('tableDIV');
		tableDIV.style.height=(document.body.clientHeight-145)+"px";
		
		var minwidth=iframe_page.clientWidth-10;
		//$("#itemTable").css("min-width",minwidth);
		
		
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
    	
    	
    	
    	
    	
	});
	
	function changeDisplay(obj){
	    obj.parentNode.display="none";
	}
	
	function searchFun()
	{	
      searchForm.submit();
	}
	
</script> 

<script type="text/javascript">
	//$(function(){
		//$("table").resizableColumns({});
	//});
</script>

</body>
</html>

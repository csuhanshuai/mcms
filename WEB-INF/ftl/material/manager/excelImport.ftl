<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var BasePath="${BasePath}";
</script>

<title>物料消耗管理系统</title>

<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/jquery.resizableColumns.min.js'></script>
<script type='text/javascript' src='${BasePath}/js/Store.js'></script>
<script type='text/javascript' src='${BasePath}/js/plugin/operamasks/operamasks-ui.min.js'></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/jquery.freezeheader.js"></script>
<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/myupload.js"></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />



<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
table{eborder-collapse:collapse; width:300%;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
.table tr:hover{background:#E4F1FC;}
.demo{width:1500px;margin:40px auto;}
.demo h2{font-size:18px;height:52px;color:#3366cc;text-align:center;}
.listext th{background:#eee; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext th,.listext td{padding:10px 5px; border:1px solid #ddd; text-align:center; empty-cells:show; font-size:14px; white-space:nowrap;overflow:hidden;word-break:keep-all;}

.rc-handle-container{position:relative;}
.rc-handle{position:absolute;width:7px;cursor:ew-resize;*cursor:pointer;margin-left:-3px;}
#hdScrolltable1{
	width:617px;
}
</style>

<script>
			var year = new Date().getFullYear();
			var month = new Date().getMonth()+1;
			$(function(){
				if(month<10){
					month=0+""+month;
				}
				$("#selectMonth").val(year+""+month)
				$("#selectMonthTimeExport").val(year+""+month)
				
				
				
			})
			
			function checkFile(){
				var name = $("#upload").val();
				var ldot = name.lastIndexOf(".");
				var type = name.substring(ldot + 1).toLowerCase();
				if(type!="xls"&&type!="xlsx"&&name!=""){
				alert("请选择xls或xlsx格式的文件！");
				return false;
				}
				return true;
			}
			
			function changeDate(){
				
			var fileName = $("#upload").val();
			
			if(fileName==""){
				alert("请先选择文件后再上传！");
				return;
			}
			if(!checkFile()){
			return;
			}
			
			
			
			$("#ajaxButton").attr("disabled","disabled");
			
			var year =  $("#selectMonth").val().substr(0,4);
			var month = $("#selectMonth").val().substr(4,5);
			var type = $("#filePath").val();
			$("#infoSpan").text("正在导入文件");
			$.ajaxFileUpload({
			url : '${BasePath}/material/manager/excelImport.kq?year='+year+'&month='+month+'&type='+type, //用于文件上传的服务器端请求地址
			secureuri : false, //一般设置为false
			fileElementId : 'upload', //文件上传空间的id属性  <input type="file" id="file" name="file" />
			type : 'post',
			dataType : 'json', //返回值类型 一般设置为json
			success : function(data) //服务器成功响应处理函数
			{
			
			if(data.success){
				$("#infoSpan").text("");
				//$("#textfield").val("");
				alert("本次导入数据有效条数："+data.data[1]+"，成功条数："+data.data[2]+"，失败条数："+data.data[3]+"。");
				//$("#pageFresh").click();
				document.getElementById("pageFresh").click();
				$('#ajaxButton').attr("disabled",false);
				
			}else{
				$("#infoSpan").text("导入文件失败");
				$("errorInfo").text(data.info);
				//$("#textfield").val("");
				$('#ajaxButton').attr("disabled",false);
			}
			
			 
			},
			error : function(data)//服务器响应失败处理函数
			{	
			 	$("#infoSpan").text("导入表格格式有误，请选择正确的表格");
				$("errorInfo").text(data.info);
				//$("#textfield").val("");
				$('#ajaxButton').attr("disabled",false);
			}
			});
			
			//var fileName = $("#fileName").val("");
			
				}
				
				/**
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
			*/	
			function imagesSelected(myFiles,inputName) {
				//alert($(myFiles).val());
				document.getElementById('textfield').value=this.value;
				if(isFirefox=navigator.userAgent.indexOf("Firefox")>0&&$(myFiles).val()!=""){  
        			var file_name = $(myFiles).val().replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  
   				}
				else if($(myFiles).val()!=""){
				var file_name = $(myFiles).val().replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1")+"."+$(myFiles).val().replace(/.+\./,"");
				}else{
				var file_name="";
				}
				//alert($(myFiles).val());
				$("input[name='"+inputName+"']").val(file_name);
				var name = $(myFiles).val();
				//alert(name);
				$("#fileName").val(name);
				//alert(myFiles);
				var ldot = name.lastIndexOf(".");
  				var type = name.substring(ldot + 1).toLowerCase();
  				//alert(type);
				$("#filePath").val(type);
				//alert(type);
				//alert(type=="xlsx");
				if(type!="xls"&&type!="xlsx"&&name!=""){
				alert("请选择xls或xlsx格式的文件！");
				return false;
				}
				return true;
			}
			function fileCheck(myFiles){
				if(isFirefox=navigator.userAgent.indexOf("Firefox")>0&&$(myFiles).val()!=""){  
        			var file_name = $(myFiles).val().replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  
   				}
				else if($(myFiles).val()!=""){
				var file_name = $(myFiles).val().replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1")+"."+$(myFiles).val().replace(/.+\./,"");
				}else{
				var file_name="";
				}
				//alert(file_name);
				var name = $(myFiles).val();
				var ldot = name.lastIndexOf(".");
  				var type = name.substring(ldot + 1).toLowerCase();
  				$("#filePath").val(type);
  				if(type!="xls"&&type!="xlsx"&&name!=""){
				alert("请选择xls或xlsx格式的文件！");
				return false;
				}
				return true;
			}
			function excelExport(){
			$("#dataCheck").val("Data");
			$("#yearText").val( $("#selectMonthTimeExport").val().substr(0,4));
			$("#monthText").val($("#selectMonthTimeExport").val().substr(4,5));
				var year = $("#yearText").val();
				var month = $("#monthText").val();
				$.ajax({
					type: "post",
					url: "${BasePath}/material/manager/checkMonthData.kq?year="+year+"&month="+month,					
					dataType: "json",
					success: function(data) {						
						
						if (data.success) {
							
							$("#dataCheck").val("noData");
							
						}else{
							$("#dataCheck").val("Data");
							}
							
							submitExport();
						
					},
					error: function() {
						alert("error");
					}
				});
				
			}
			
			function submitExport(){
				$("#yearText").val( $("#selectMonthTimeExport").val().substr(0,4));
				$("#monthText").val($("#selectMonthTimeExport").val().substr(4,5));
				
				if($("#dataCheck").val()==""||$("#dataCheck").val()=="Data"){
					$("#exportForm").submit();
					return;
				}
				if($("#dataCheck").val()=="noData"){
					alert("本月无数据");
					return;
				}
				
			}
			
			function addFile(){
			$("#upload").click();
			}
		
			$(document).ready(function () {
    			$("#table1").freezeHeader({ 'height': '600px' });
				})
		</script>
</head>

<body>



<div id="iframe_page" style="overflow:hidden;">
    <div class="iframe_content" style="overflow:hidden;">
        <div class="r_nav">
    <ul>
	<li class="cur"> <a id="pageFresh" href="${BasePath}/material/manager/toImport.kq">Excel导入导出</a></li>
   </ul>
</div>


<div id="url" style="min-height:0px;padding-bottom: 0px;" class="r_con_wrap" >
	
	<table border="0" cellpadding="5" cellspacing="0" id="topTable">
        <tr>       
	        
			<td style="float: left;margin-left: 0px;">
			选择导入数据年月：<input style="width: 75px;" id="selectMonth" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({isShowClear:false,lang:'zh-cn',dateFmt:'yyyyMM'})" >
			</td>
			
			
			
   

	<td style="float: left;margin-left: 20px;margin-right: 0px;">
	<!--
			<input type='text' readonly="readonly" name='textfield' id='textfield' class='txt' placeholder="请选择Excel文件" id="txarea"  />  
	</td>
	
	<td style="float: left;margin-left: 0px;padding-left: 2px;">
 			<input style="float: left;margin-left: 0px;margin-right: 0px;" type='button' class='btn_green btn_w_120' value='浏览...' onclick="addFile()"  />
 			<input style="position:absolute;left:0;top:0;width:0px;height:0px;z-index:999;opacity:0;" onchange="imagesSelected(this,'textfield');" type="file" name="upload"  id="upload" />
 			-->
 			
 			<input  onchange="fileCheck(this)" type="file" name="upload"  id="upload" style="width:165px;height: 28px;" >
 			</td>
 			<td style="float: left;margin-left: 10px;">
 			<button id="ajaxButton" class="btn_green btn_w_120" style="float:left;" onclick="changeDate()">导入Excel</button>
 			<span id="infoSpan"></span>
 	</td>
 				 
			
            <input type="hidden" name="filePath" id="filePath">
            <input type="hidden" id="fileName">
            <span id="errorInfo"></span>
			</td>
			
			
			
			
			
			</tr>
			<tr height="10"></tr>
			<tr>
			
			<td style="float: left;margin-left: 0px;" >
			<form id="exportForm" action="${BasePath}/material/manager/excelExport.kq">
			选择导出数据年月：<input style="width: 75px;"  id="selectMonthTimeExport" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({isShowClear:false,lang:'zh-cn',dateFmt:'yyyyMM'})" ></td>
			<input type="hidden" id="yearText" name="year"/>
			<input type="hidden" id="monthText" name="month"/>
			<input type="hidden" id="dataCheck">
			<td style="float: left;margin-left: 20px;">			
			<button id="exportButton" type="button"  class="btn_green btn_w_120" onclick="excelExport()">导出Excel</button>
			<!--<input type="button" value="导出Excel" onclick="excelExport()">-->
			</form>
			</td>	
			<td style="float: left;margin-left: 20px;width: 145px;">
			<form method="get" action="${BasePath}/material/manager/downloadExcel.kq">
			<input type="submit" value="Excel模板下载" id="download" class="btn_green btn_w_120" >
			</form>
			</td>	
        </tr> 
            
    </table>
    
    </div>
    
    <div id="url" class="r_con_wrap" >
	<form action="${BasePath}/material/manager/toImport.kq" name="qcust" id="qcust" method="post">
	    
    </form>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table" style=" table-layout:fixed;width: 600px;" id="table1">
    	<thead>
    	<tr>
    	<td width="100%" nowrap="nowrap" colspan="4" style="font-size:20px;">已导入数据月份</td>
    	</tr>
    	
            <tr>
                <td width="5%" nowrap="nowrap" >序号</td>
                <td width="10%" nowrap="nowrap">年份</td>
                <td width="10%" nowrap="nowrap">月份</td>
		        <td width="10%" nowrap="nowrap">当月数据条数</td>
		             
            </tr>
        </thead>
        <tbody>
                    
    <#if pageFinder??  >
	      		<#list pageFinder as item>		
	      		<tr id=''>
					 <td>${item_index+1}</td>
					 <td>${item.year?default("")}</td>
		             <td>${item.month?default("")}</td>
		             
					 <td>${item.datas?default("")}</td> 
					                               
                </tr>
	      		</#list>	
	      	<#else>
	      		<tr><td colspan="9"><div class="yt-tb-list-no">暂无内容</div></td></tr>
		</#if>
		
                   
                </tbody>
    </table>
    
    
    
</html>

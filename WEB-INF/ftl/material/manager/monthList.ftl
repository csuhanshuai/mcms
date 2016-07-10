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
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />


<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
table{empty-cells:show;border-collapse:collapse;border-spacing:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

.demo{width:900px;margin:40px auto;}
.demo h2{font-size:18px;height:52px;color:#3366cc;text-align:center;}
.listext th{background:#eee;color:#3366cc;}
.listext th,.listext td{border:solid 1px #ddd;text-align:left;padding:10px;font-size:14px; }

.rc-handle-container{position:relative;}
.rc-handle{position:absolute;width:7px;cursor:ew-resize;*cursor:pointer;margin-left:-3px;}
</style>

</head>
<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>


<div id="iframe_page">
    <div class="iframe_content">
        <div class="r_nav">
    <ul>
	<li class="cur"> <a href="${BasePath}/lanterngame/listQuestion.kq">库存管理</a></li>
   </ul>
</div>
<br>
 <a href="javascript:addFun()" class="btn_green btn_w_120" >新增</a>
 <wbr>
<div class="demo">
   
    <table  width="100%" class="table listext" data-resizable-columns-id="demo-table">
        <thead>
            <tr>
                <th width="5%" nowrap="nowrap">序号</td>
                <th width="10%" nowrap="nowrap">年份</td>
		        <th width="10%" nowrap="nowrap">月份</td>
		        <th width="10%" nowrap="nowrap">操作</td> 
            </tr>
        </thead>
        <tbody>
       <#if pageFinder?? && (pageFinder.data)?? >
	      	<#list pageFinder.result as item>		
		 		<tr id='${item.id}'>
					 <td >${item_index+1}</td>
					 <td><span style="display:none"><input type="text" name="year" value="${item.year?default("")}" /></span><span >${item.year?default("")}</span> </td>
					 <td><span style="display:none"><input type="text" name="month" value="${item.month?default("")}" /></span><span >${item.month?default("")}</span>  月</td>
					 <td nowrap="nowrap" class="left last">
						<a href="${BasePath}/material/manager/openEditList.kq?id=${item.id}">详情</a>&nbsp;&nbsp;
					</td>  
	            </tr>
		     </#list>	
	   <#else>
		     <tr><td colspan="8"><div class="yt-tb-list-no">暂无内容</div></td></tr>
	    </#if>
	     </tbody>
    </table>
    
    <table id="itemTableClone" border="0" cellpadding="5" cellspacing="0" class="r_con_table" style="display:none;">
        <tr>
        	 <td id="1234">abc</td>
			 <td ><span><input type="text" name="year" value="" /></span><span ></span></td>
			 <td ><span><input type="text" name="month" value="" /></span><span ></span></td>
			 <td name="详情" nowrap="nowrap" class="left last">
			</td>  
        </tr>
    </table>
    
    
    
    <div class="blank20"></div>
<!-- 翻页标签 -->
<#import "../app-common.ftl"  as page>
<@page.queryForm formId="qcust" />    

<script type='text/javascript' >
	 $(document).ready(function() {
		$("#itemTable input").each(function(){
    		$(this).blur(function(){
    			var itemID=$(this).parent().parent().parent().attr("id");
    			ajaxRowEditSaveFun(itemID,$(this).attr('name'),$(this).val());
    			$(this).parent().css("display","none");
    			$(this).parent().next().css("display","");
    			$(this).parent().next().text($(this).val());
    		})
    	})
    	
    	$("#itemTable td").each(function(){
    		$(this).dblclick(function(){
    			var tdSpan1=$(this).find('span:first');
    			var tdSpan2=tdSpan1.next();
    			if(tdSpan1&&tdSpan2){
    				if(tdSpan1.css("display")=="none" ){
    				    tdSpan1.css("display","");
    				    tdSpan2.css("display","none");
    				    tdSpan1.find('input:first').focus();
    				}
    			}
    		})
    	})
	});


	function getTopDetail(questionId){	
		showThickBox("库存管理",BasePath+"/material/manager/openEditList/"+questionId+".kq?TB_iframe=true&height=600&width=850",true);
	}
    
    
	function ajaxRowEditSaveFun(itemID,itemName,itemValue){ 
		 $.ajax({ 
		        type: 'POST', 
		        url: 'ajaxRowEditSave.kq?itemID='+itemID+'&itemName='+itemName+'&itemValue='+itemValue,
		        dataType: 'json', 
		        cache: false, 
		        error: function(data){ 
		            document.getElementById("tip").style.display="block";	 
		            return false; 
		        }, 
		        success:function(json){ 
		        	if(json[0].saveOK!=undefined){
			              alert("修改成功");
			        }
		      	}    
		 });
	}
	
</script>    
    <script type="text/javascript">
$(function(){
	$("table").resizableColumns({});
});
</script>
    
</body>
</html>
    


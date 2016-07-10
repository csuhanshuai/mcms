<!-- 自定义翻页标签宏 -->
<#macro queryForm formId>

<script>

	var formId = "${formId}"; 
	var totalRows = '${otherMaterialInventorys.rowCount}';
	var pageSize = ${otherMaterialInventorys.pageSize};

	/**
	*检查是否含有财务千分位分隔符
	*当totalRows>1000时默认格式会加财务千分位逗号
	*例如11,628，在js当做字符串处理
	*/
	function ck(txt){
	 if(txt.indexOf(',')>-1){
	  return true;
	 }
	 return false;
	}

	/**
	*以逗号进行字符串分割
	*返回去掉逗号的字符串
	*例如11,628->11628
	*/
	function split(datastr){
	  var arr= new Array();
	  var str = "";
	  arr=datastr.split(",");
	    for (i=0;i<arr.length ;i++ )
	    {
	        str+=arr[i];
	    }
	    return str;
	}
	/**
	*如果totalRows>=1000,则去除财务分隔符逗号
	*否则转换为数字类型
	*/
	if(ck(totalRows)){
		totalRows = split(totalRows);
	}else{
		totalRows = Number(totalRows);
	}

	function queryPage(pageNo){
		if(isNaN(pageSize)){
				alert('每页条数只能为数字');
				return;
			}

			var totalPage=Math.ceil(totalRows/pageSize);
			var toPage=pageNo;
			if(pageNo==0){
				toPage=document.getElementById("query.page").value;
				if(isNaN(toPage) || toPage<=0){
					alert("请输入大于0的整数.");
					return;
				}

				if(toPage>totalPage){
					alert("没有当前页数");
					return;
				}
			}

			//校验是跳转页是否在记录有效范围内
			//取大于等于总页数的值
			if(toPage>totalPage){
				alert("已经到最后一页");
				return;
			}


			var pageForm = (formId&&formId!="")?document.getElementById(formId):document.forms[0];

			var arr = pageForm.elements;
			var flag = false;
			for(var i=0,j=arr.length;i<j;i++){
				if(arr[i].getAttribute("name")=="query.page"){
					flag = true;
					break;
				}
			}
			if(!flag){
				var artionUrl = pageForm.getAttribute("action");
// 				if(artionUrl.indexOf("?")>0){
// 					artionUrl = artionUrl + "&page="+toPage;
// 				}else{
// 					artionUrl = artionUrl + "?page="+toPage;
// 				}
// 				pageForm.setAttribute("action",artionUrl);

 				var pageInput =	document.createElement("input");
 				pageInput.setAttribute("type", "hidden");
 				pageInput.setAttribute("name", "page");
 				pageInput.setAttribute("value", toPage);
				pageForm.appendChild(pageInput);

			}
			var inputHidden="<input type='hidden' name=\"pageSizeInput\" value=\""+pageSize +"\">";
			$(pageForm).append(inputHidden);
			pageForm.submit();
	}

//触发enter键执行
	function changePageSizeEnter(evt){
	
	  var evt=evt?evt:(window.event?window.event:null);//兼容IE和FF
	  var pageSize=$("#pageSizeInput").val();
	  var re= /^[0-9]*[1-9][0-9]*$/;
	  
	  
      if (evt.keyCode==13){
           
         if(re.test(pageSize)&&pageSize<1000){
	        var pageForm = (formId&&formId!="")?document.getElementById(formId):document.forms[0];
		    var imgTip="<img id=\"tempImg\" src=\"${BasePath}/images/right.png\"></img>";   
		    var inputHidden="<input type='hidden' name=\"pageSizeInput\" value=\""+pageSize +"\">";
		    $(pageForm).append(inputHidden);
		    pageForm.submit();
	       }else{
	          alert("请输入1000以内的正整数！");
	          }
         
        }
		
	}
	
    function changePageSize(){
	
		var pageSize=$("#pageSizeInput").val();
		var re= /^[0-9]*[1-9][0-9]*$/;
		if(re.test(pageSize)&&pageSize<1000){
		   var pageForm = (formId&&formId!="")?document.getElementById(formId):document.forms[0];
		   var imgTip="<img id=\"tempImg\" src=\"${BasePath}/images/right.png\"></img>";   
		   var inputHidden="<input type='hidden' name=\"pageSizeInput\" value=\""+pageSize +"\">";
		   $(pageForm).append(inputHidden);
		   pageForm.submit();
		}else{
		   alert("请输入1000以内的正整数！");
		}
		
		
	
	
		
	}  



</script>
<#setting number_format="0">
<#if otherMaterialInventorys?? && otherMaterialInventorys.data?? && (otherMaterialInventorys.rowCount > 0)>
<!--
	<#if otherMaterialInventorys ?? && otherMaterialInventorys.rowCount ??>
		<div class="">总记录数：<font color ="red">${otherMaterialInventorys.rowCount}</font></div>
	</#if>
	-->
	<div id="turn_page">
		<!--<ul class="pagination" contenteditable="true">-->
		<#if (otherMaterialInventorys.pageCount > 1) >
		    <#if (otherMaterialInventorys.hasPrevious == false) >
				
			<#else>
		    <font class="page_noclick"><a href="#" onClick="queryPage(${otherMaterialInventorys.pageNo-1})"  title="上一页"><span>上一页</span></a></font>
		    <font class="page_noclick"><a href="#" onClick="queryPage(1)"  title="上一页"><span>首页</span></a></font>
			</#if>

			<#if (otherMaterialInventorys.pageCount < 10) >
				<#list 1..(otherMaterialInventorys.pageCount) as row>

					<#if otherMaterialInventorys.pageNo == row >
						<!-- 选中时的样式 -->
						<font class="page_item_current">${row}</font>
					<#else>
					    <a href="#" onClick="queryPage(${row});" class="page_item">${row}</a>
					</#if>
				</#list>

			<#elseif ((otherMaterialInventorys.pageCount - otherMaterialInventorys.pageNo) < 5) >
				<#list 1..9 as row>
					<#if ((otherMaterialInventorys.pageCount - otherMaterialInventorys.pageNo) == (9- row)) >
						<!-- 选中时的样式 -->
						<font class="page_item_current">${otherMaterialInventorys.pageCount  - 9 + row}</font>
					<#else>
						<a href="#" onClick="queryPage(${otherMaterialInventorys.pageCount - 9 + row})" class="page_item"> ${otherMaterialInventorys.pageCount  - 9 + row}</a>
						<!-- 默认的样式 -->
					</#if>
				</#list>

			<#else>
				<#list 1..10 as row>
					<#if (row == 8) >
					<a>	...</a>
					<#elseif (row == 9) >
					<font class="page_item_current"><a href="#" onClick="queryPage(${otherMaterialInventorys.pageCount -1 })"  > ${otherMaterialInventorys.pageCount -1}</a></font>
					<#elseif (row == 10) >
					<font class="page_item_current"><a href="#" onClick="queryPage(${otherMaterialInventorys.pageCount})" > ${otherMaterialInventorys.pageCount}</a></font>
					<#else>

						<#if (otherMaterialInventorys.pageNo < 5) >

							<#if (otherMaterialInventorys.pageNo == row) >
								<!-- 选中时的样式 -->
								<font class="page_item_current">${row}</font>
							<#else>
								<a  href="#" onClick="queryPage(${row});" class="page_item"> ${row}</a>
								<!-- 默认的样式 -->
							</#if>

						<#else>

							<#if (row == 4) >
								<!-- 选中时的样式 -->
								<font class="page_item_current">${otherMaterialInventorys.pageNo-4+row}</font>
							<#else>
								<!-- 默认的样式 -->
								<a href="#" onClick="queryPage(${otherMaterialInventorys.pageNo-4+row})" class="page_item"> ${otherMaterialInventorys.pageNo-4+row}</a>
							</#if>

						</#if>
					</#if>
				</#list>
			</#if>

			<#if (otherMaterialInventorys.pageNo == otherMaterialInventorys.pageCount) >
				<!-- 选中时的样式 -->
			<#else>
				<!-- 默认的样式 -->
			</#if>

			<#if (otherMaterialInventorys.hasNext == false) >
				<span class="page-next-no"></span>
			<#else>
			    <a href="#" onClick="queryPage(${otherMaterialInventorys.pageCount})"   title="下一页"  class="page_item">尾页</a>
				<a href="#" onClick="queryPage(${otherMaterialInventorys.pageNo+1})"   title="下一页"  class="page_item">下一页</a>
			</#if>
			
			<!--
			<span class="jum-page">
				到第
				<input style="width:40px" id="query.page" size="5" name="query.page" type="text" maxlength="5" value="${otherMaterialInventorys.pageNo}"  onkeyup="value=value.replace(/[^\d]/g,'')"/>
				页
			</span>
			<a class="submit-page ft-sz-12" href="#"  onClick="queryPage(0);">跳转</a>
			-->
				<span>每页显示行数:<input  type="text" name="pageSize" id="pageSizeInput"  size="5" value="${otherMaterialInventorys.pageSize?default("")}" onkeydown="changePageSizeEnter(event)" />&nbsp;<input type="button" onclick="changePageSize()" value="Go"></span>
		<#else>
			<div>每页显示行数:<input  type="text" name="pageSize" id="pageSizeInput"  size="5" value="${otherMaterialInventorys.pageSize?default("")}" onkeydown="changePageSizeEnter(event)" />&nbsp;<input type="button" onclick="changePageSize()" value="Go"></div>
		</#if>
		
		<!--</ul>-->
	</div>
</#if>
</#macro>
<!-- fckeditor编辑器标签  name:标签名称 value:控件值 height:高度 width:宽度   	no：商品编号-->
<#macro fckeditor name value="" no="" height="200px" width="100%">
	<#if !height?ends_with("px") >
		<#assign height = height +"px" />
	</#if>
	<script type="text/javascript"  src="${BasePath}/js/common/kindeditor/kindeditor.js"></script>
	<script>
      KE.show({id:'${name}', allowFileManager :false});
	  KE.configServer('','${name}','${no?default("")}');
  	</script>
	<textarea id="${name}" name="${name}" style="width:${width};height:${height};visibility:hidden;">${value?replace("&","&amp;")?replace("<","&lt;")?replace(">","&gt;")?replace("\"","&quot;")}</textarea>
</#macro>

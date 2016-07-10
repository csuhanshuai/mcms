<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信公众平台管理系统</title>
<link href='${BasePath}/css/global.css?t=2013122302' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css?t=2013122302' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js?t=2013122302'></script>
<script type="text/javascript" src="${BasePath}/js/calendar/WdatePicker.js"></script>
<script type="text/javascript">
	var BasePath="${BasePath}";
</script>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js?t=2013122302'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />
</head>

<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>


<div id="wechat_shenhe" class="r_con_wrap">
<script language="javascript">$(document).ready(wechat_obj.auth_init);</script>
    <table border="0" cellpadding="5" cellspacing="0" class="r_con_table">
<#if materialLog??>
		
		<tr>
			<td>
				<div width=50%>
	        	用戶id：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.user_id?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div width=50%>
	        	用戶姓名：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.user_name?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	操作类型：
	    		</div>
			</td>
			<td>
				<div width=50%>
				<#if materialLog.op_type==1>
							   新增
							    <#elseif  materialLog.op_type==2>
                                                                          修改
                              <#elseif  materialLog.op_type==3>
                                                                          刪除
                               <#else>
  	                                                                导入     
				   </#if>
				
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	物料库存id：
	    		</div>
			</td>
			<td>
				<div width=50%>
				${materialLog.material_stock_id?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50% overflow-y:scroll;>
	        	操作列名称：
	    		</div>
			</td>
			<td>
				<div width=50%>
				${materialLog.op_column_name?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	操作列编码：
	    		</div>
			</td>
			<td>
				<div width=50%>
				${materialLog.op_column_code?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	操作前值：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.op_before_value?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	操作后值：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.op_after_value?default("")}
	    		</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div  width=50%>
	        	备注：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.remark?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td>
				<div  width=50%>
	        	操作时间：
	    		</div>
			</td>
			<td>
				<div width=50%>
	        	${materialLog.create_time?default("")}
	    		</div>
			</td>
		</tr>
		
		
		<tr>
			<td colspan="2">
				<div  width=50%>
	        	操作前对象字符串：
	    		</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div width=50%>
	        	${materialLog.op_before_obj_str?default("")}
	    		</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div  width=50%>
	        	操作后对象字符串：
	    		</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div width=50%>
	        	${materialLog.op_after_obj_str?default("")}
	    		</div>
			</td>
		</tr>
		
		
<#else>
<tr><td colspan="2"><div class="yt-tb-list-no">暂无内容</div></td></tr>
</#if>
</table>
    

</div>

</body>


<script>
  function shenhe(id,status){
    if(status==1){
    	alert('已经审核过的')
    }else{
    	$.ajax({
	    		    url: BasePath+"/vote/approveWxmaterialLog.kq?id="+id,
	    		    type: "POST",
	    		    date:"",
	    		    datetype: "json",
	    		    async: false,
	    		    timeout: 1000,
	    		    success: function(result){
	    		    	var state=result.status;
	    		    	var str="";
	    		    	if(state==2){
	    		    		str="不通过";
	    		    		//$("table tbody tr td:eq(4)").html(str);
	    		    		window.location.reload();
	    		    		parent.document.getElementById(id).innerHTML=str;
	    		    	}else if(state==0){
	    		    		str="未审核"; 
	    		    		window.location.reload();
	    		    		parent.document.getElementById(id).innerHTML=str;
	    		    	}else{
	    		    		str="已通过";
	    		    		window.location.reload();
	    		    		parent.document.getElementById(id).innerHTML=str;
	    		    	}
	    		    },
	    		    error: function(){
	    		    	alert('操作失败!');
	    		    }
	    });
	  } 
    }
  function notshenhe(id,status){
  if(status==0){
    	$.ajax({
	    		    url: BasePath+"/vote/approveWxmaterialLog1.kq?id="+id,
	    		    type: "POST",
	    		    date:"",
	    		    datetype: "json",
	    		    async: false,
	    		    timeout: 1000,
	    		    success: function(result){
	    		    	var a=result.status;
	    		    	if(a==1){
	    		    	 	var str="已通过";
	    		    	 	window.location.reload();
	    		    	 	parent.document.getElementById(id).innerHTML=str;
	    		    	}else if(a==0){
	    		    		var str="未审核";
	    		    		window.location.reload();
	    		    		parent.document.getElementById(id).innerHTML=str;
	    		    	}else{
	    		    		var str="未通过";
	    		    	 	window.location.reload();
	    		    	 	parent.document.getElementById(id).innerHTML=str;
	    		    	}
	    		    },
	    		    error: function(){
	    		    	alert('操作失败!');
	    		    }
	    });
	  } else if(status==2){
	  	alert('已未通过审核');
	  } else{
	  	alert('已审核，不可更改');
	  }
    }
</script>
</html>
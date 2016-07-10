<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信公众平台管理系统</title>
<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>
<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

</head>
<script type="text/javascript">
	var BasePath="${BasePath}"; 	
</script>
<body>

<style type="text/css">body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}</style>
<div id="iframe_page">
    <div class="iframe_content">
        <div class="r_nav">
    <ul>
	<li><a href="${BasePath}/cardManage/queryConfigList.kq">刮刮卡</a></li>
	<li class="cur"><a href="${BasePath}/cardManage/queryPrizeConfigList.kq">奖项管理</a></li>
	<li><a href="${BasePath}/zj/getActivities.kq?type=3">兑奖管理</a></li>
	
	
   </ul>
</div>


<div id="url" class="r_con_wrap">
	<form action="${BasePath}/cardManage/updatePrizeConfig.kq" name="qcust" id="qcust" enctype="multipart/form-data" method="post">
	
	<#if prizeConfig??>
	<input type="hidden" name="id"  value="${prizeConfig.id}">
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
                <td>奖项名称 </td>
            	<td><input type="text" name="name" value="${prizeConfig.name}"/></td>
            </tr>
           <tr>
                <td>中奖机率 </td>
            	<td><input type="text" name="v" value="${prizeConfig.v}"  onkeyup="value=value.replace(/\D/g,'')" /></td>
            </tr>
            <tr>
                <td>是否是奖品 </td>
            	<td><select name="isprize" id="isprize" onChange="javascript:changegift();">
					<option value="1" <#if prizeConfig.isprize==1>selected</#if>>是</option>
					<option value="2" <#if prizeConfig.isprize==2>selected</#if>>否</option>
					</select>
				</td>
            </tr>
            
            <tr>
                <td>对应奖品 </td>
            	<td><select name="giftid" id="giftid">
					<#if prizeConfig.isprize==1>
		             			<#if giftlist?? && (giftlist?size>0) >
		             				<option value="">请选择奖品</option>
	      						<#list giftlist as gift>
	      							<option value="${gift.id?default('')}" <#if prizeConfig.giftid?? && prizeConfig.giftid==gift.id>selected</#if>>${gift.name?default("")}</option>
	      						</#list>
	      						<#else>
	      							<option value="">暂无奖品</option>
	      						</#if>
		             		<#else>
		             			<option value="">非奖品</option>
		             		</#if>
					</select>
				</td>
            </tr>
            
            <tr>
                <td>数量 </td>
            	<td><input type="text" name="number" id="number" value="${prizeConfig.number?default(0)}"  onkeyup="javascript:getGiftnumber();" /></td>
            </tr>
            
            <tr>
                <td>图片 </td>
            	<td>
					<img src="${BasePath}/${prizeConfig.path}"/>
				</td>
            </tr>
            
            
            <tr>
             <td>上传</td>
             <td>
					<input name="file"  id="imgbut" type="file"/>
	          </td>  
	        </tr>
	        <tr>
		        <td></td>
	            <td>
		            <input type="button" class="btn_green" value="提交" name="submit_btn"  id="submit_btn"/>
		        </td>  
	        </tr>
        </table>
	<#else>
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
                <td>奖项名称 </td>
            	<td><input type="text" name="name" value=""/></td>
            </tr>
           <tr>
                <td>中奖机率 </td>
            	<td><input type="text" name="v" value=""  onkeyup="value=value.replace(/\D/g,'')" /></td>
            </tr>
             <tr>
                <td>是否是奖品 </td>
            	<td><select name="isprize" id="isprize" onChange="javascript:changegift();">
					<option value="1">是</option>
					<option value="2">否</option>
					</select>
				</td>
            </tr>
             <tr>
                <td>对应奖品 </td>
            	<td>
            		<select name="giftid" id="giftid">
		             			<#if giftlist?? && (giftlist?size>0) >
		             				<option value="">请选择奖品</option>
	      						<#list giftlist as gift>
	      							<option value="${gift.id?default('')}">${gift.name?default("")}</option>
	      						</#list>
	      						<#else>
	      							<option value="">暂无奖品</option>
	      						</#if>
					</select>
				</td>
            </tr>
            
            <tr>
                <td>数量 </td>
            	<td><input type="text" name="number" id="number" value="0"  onkeyup="javascript:getGiftnumber();" /></td>
            </tr>
            <tr>
             <td>图片</td>
             <td>
					<input name="file"  id="imgbut" type="file"/>
	          </td>  
	        </tr>
	        <tr>
		        <td></td>
	            <td>
		            <input type="button" class="btn_green" value="提交" name="submit_btn"  id="submit_btn"/>
		        </td>  
	        </tr>
        </table>
        
        </#if>
    </form>
   
</body>
</html>
<script type="text/javascript" >

$(document).ready(function() {

	$("#submit_btn").click(function(){	 		
	document.getElementById("qcust").submit();	 			 
	});

});


function changegift()
	{
		var prize = $("#isprize").val();
		
		$("#giftid").empty();
			
		if(prize == '1')
		{
			
			
			//根据不同的类型获取不同类型的活动列表
			$.ajax({
				url: BasePath+"/zj/getGiftListBybid.kq",
	    		    type: "POST",
	    		    date: "",
	    		    datetype: "json",
	    		    async: false,
	    		    timeout: 1000,
				success: function(result){
	    		    var response = eval("(" +result+")" );
	    		    if(response.result == 'success'){
	    		    	
	    		    	var t = response.t;
	    		    	if(t)
	    		    	{
	    		    		$("#giftid").append("<option value=''>请选择奖品</option>");
	    		    		for(var i in t)
	    		    		{
	    		    			
	    		    			$("#giftid").append("<option value='"+t[i].id+"'>"+t[i].name+"</option>");
	    		    		}
	    		    	}
	    		    	else
	    		    	{
	    		    		$("#giftid").append("<option value=''>暂无奖品</option>");
	    		    		
	    		    	}
					}
	    		    else
	    		    {
	    		    	$("#giftid").append("<option value=''>暂无奖品</option>");
	    		    }	
	    		    	
	    		    },
	    		    error: function(){
	    		    	alert('操作失败!');
	    		    }
			});
		}
		else
		{
			$("#giftid").append("<option value=''>非奖品</option>");
		}
	}
	
	function checkNum(num)
	{
	   var number = /^\d+$/;
	   return number.test(num);
	}
	
	function getGiftnumber()
	{
		var num = $("#number").val();
		
		var prize = $("#isprize").val();
		var giftid = $("#giftid :selected").val();
		
		if(prize == 1)
		{
		
			if(!giftid)
			{
				$("#number").val('0');
				alert("请选择对应的奖品");
				return ;
			}
			if(!checkNum(num))
			{
				$("#number").val(num.replace(/[^\d]/g,''));
			}
			else
			{
				//根据不同的类型获取不同类型的活动列表
				$.ajax({
					url: BasePath+"/zj/getGiftByid.kq?id="+giftid,
		    		    type: "POST",
		    		    date: "",
		    		    datetype: "json",
		    		    async: false,
		    		    timeout: 1000,
					success: function(result){
		    		    var response = eval("(" +result+")" );
		    		    if(response.result == 'success'){
		    		    	
		    		    	var t = response.t;
		    		    	if(t)
		    		    	{
		    		    		if(t.number < num)
		    		    		{
		    		    			//截取长度
		    		    			if(num.length > 1)
		    		    			{
		    		    				$("#number").val(num.substring(0,num.length-1));
		    		    			}
		    		    			else
		    		    			{
		    		    				$("#number").val('0');
		    		    			}
		    		    			alert("该奖品总数为："+t.number+"，请重新输入！");
		    		    		}
		    		    		
		    		    		
		    		    	}
		    		    	else
		    		    	{
								$("#number").val('0');
		    		    		alert("请重新选择奖品");
								return ;
		    		    		
		    		    	}
						}
		    		    else
		    		    {
							$("#number").val('0');
		    		    	alert("请重新选择奖品");
							return ;
		    		    }	
		    		    	
		    		    },
		    		    error: function(){
		    		    	alert('操作失败!');
		    		    }
				});
			}
		
		}
		else
		{
			$("#number").val('0');
			alert("非奖品，数量为0");
		}
	}
	

</script>
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
<script type="text/javascript" src="${BasePath}/js/Highcharts/js/highcharts.js"></script>
<!--[if lte IE 9]>
<script type='text/javascript' src='${BasePath}/js/jquery.watermark-1.3.js'></script>



<![endif]-->
<link href='${BasePath}/css/wechat.css' rel='stylesheet' type='text/css' />

<style type="text/css">
.table tr:hover{background:#E4F1FC;}
.listext th{background:#eee; white-space:nowrap;overflow:hidden;word-break:keep-all;}
.listext th,.listext td{padding:10px 5px; border:1px solid #ddd; text-align:center; empty-cells:show; font-size:14px; white-space:nowrap;overflow:hidden;word-break:keep-all;}

</style>

<script type='text/javascript' >

$(document).ready(function() {

$(function () {
    $('#container').highcharts({
        chart: {
            zoomType: 'xy',
            width: '640',
            margin: [50,50,37,60],
        },
        title: {
            text: '${title}'
        },
        xAxis: { categories: ${xAxis1} },
   		yAxis: { 
   		 		title: { 
   		 			   text: '库 存 数 量 (单位：吨)' }, 
   		 			   plotLines: [{ value: 0, width: 1, color: '#808080' }]
   		 		 },
        tooltip: {
            shared: true
        },
        legend:{
        	enabled:false
        },
        credits: {
             text: '',
        },
        
        series: [{
            name: 'Rainfall',
            color: '#46C6F0',
            type: 'column',
            pointWidth:30,
            data: ${dataJosn1},
            tooltip: {
                valueSuffix: ' '
            },
            dataLabels: {
                enabled: true,
                distance:10,
                formatter: function() {  
					return  this.y+"";  
				},
                style: {
                	fontFamily:'Microsoft yahei',
                    fontSize:'12px',
                    fontWeight:'normal'
	            }
            }

        }, {
            color: 'red',
            type: 'line',
            tooltip: {
                 valueSuffix: ''
            }
        }
        
        ]
    });
});
		
	
	
$(function () {
    $('#container2').highcharts({
          chart: {
            type: 'column',
            width: '600',
            margin: [50,150,37,50],
            options3d: { enabled: true, alpha: 15, beta: 15, depth: 50, viewDistance: 25 }
        },
        title: {
            text: '${title2}'
        },
        credits: {
             text: '',
        },
        xAxis: {
             categories: ${xAxis},
        },
        yAxis: {
            min: 0,
            
            title: {
                text: ''
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray',
                    padding: '2px',
                    margin: '2px'
                }
            }
        },
        legend: {
            width:135,
            x: 220,
            verticalAlign: 'bottom',
            y: -120,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.x +'</b><br/>'+
                    this.series.name +': '+ this.y +'<br/>'+
                    'Total: '+ this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                depth: 10,
                pointWidth:30,
                groupPadding:0,
                dataLabels: {
                    enabled: false,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                }
            }
        },
        series: [{
            name: '推动原项目消耗',
            color:'#593779',
            data: ${dataJosn_one}
        }, {
            name: '报废/取消',
            color:'#179626',
            data: ${dataJosn_two}
        }, {
            name: '其他项目原配置消耗',
             color:'#C02716',
            data: ${dataJosn_three}
        },{
            name: '改制消耗',
             color:'#46C6F0',
            data: ${dataJosn_four}
        }
        ]
    });
    
    
});	
	
	
	
});	


function searchFun(){
	var form=document.getElementById("searchForm");
	
	
	if(form.index_.value==""||form.fromDate.value==""||form.toDate.value==""){
    	alert("开始时间,结束时间,item Code为必填项");
        return;
    }
	
	
	var fromDate=form.fromDate.value+"-01";
	var toDate=form.toDate.value+"-01";
	
	
    var start=new Date(fromDate.replace("-", "/").replace("-", "/"));  
    var end=new Date(toDate.replace("-", "/").replace("-", "/"));  
    
    if(end<=start){  
    	alert("error:开始日期必须小于结束日期,请重新选择");
        return;  
    }  
    form.submit();
}	


</script>

</head>

<body>

<div id="iframe_page" style="overflow:hidden;">
    <div class="iframe_content" style="overflow:hidden;">
    	 <div class="r_nav">
		    <ul>
			<li class="<#if type=='noChart'>cur</#if>"> <a href="${BasePath}/material/compare/showCompareList.kq">库存对比</a></li>
			<li class="<#if type=='chart'>cur</#if>"> <a href="${BasePath}/material/manager/testHighChart.kq">物料月份对比</a></li>
		   </ul>
		</div>
	<div style="padding:20px 20px 40px 40px;">
		<form action="${BasePath}/material/manager/testHighChart.kq" id="searchForm">
				<table border="0" cellpadding="0" cellspacing="0">
			        <tr>   
			        	<td><span style="color:red">*</span>
			        		开始日期：<input  style="width:100px;" value="${fromDate?default("")}" class="Wdate" name="fromDate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM'})" >
			        	</td>	
			        	<td >&nbsp;&nbsp;<span style="color:red">*</span>
			        		结束日期：<input  style="width:100px;" value="${toDate?default("")}"   class="Wdate" name="toDate"  type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM'})" >
			        	</td>
					    <td >&nbsp;&nbsp;<span style="color:red">*</span>&nbsp;索引:&nbsp;<input type="text" style="width:150px;" name="index_" value="${index_?default("")}">&nbsp;&nbsp;&nbsp;</td>
			        	 <td ><a href="javascript:searchFun()" class="btn_green btn_w_120" style="width:90px;height:28px" >查询</a></td>
			        	
			        </tr>
			    </table>
		</form>
	</div>
	</div>
</div>
	
	<div style="margin-left:100px;text-align: center;">
		<div id="container" style="float:left;">
		</div>
		
		<div id="container2" style="float:left;">
		</div>
		
		
    </div>
</body>
</html>

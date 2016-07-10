<!DOCTYPE html>
	<head>
		<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/WdatePicker.js"></script>
		<script type='text/javascript' src='${BasePath}/js/jquery-1.7.2.min.js'></script>
		<script type='text/javascript' src='${BasePath}/js/global.js'></script>
		<script type='text/javascript' src='${BasePath}/js/plugin/operamasks/operamasks-ui.min.js'></script>
		<script type='text/javascript' src='${BasePath}/js/wechat.js'></script>
		<script type='text/javascript' src='${BasePath}/js/wechat.js'></script>
		<script language="javascript" type="text/javascript" src="${BasePath}/js/My97DatePicker/up.js"></script>
		<link href='${BasePath}/css/global.css' rel='stylesheet' type='text/css' />
		<link href='${BasePath}/css/main.css' rel='stylesheet' type='text/css' />
		<meta charset="utf-8" />
		<script>
			var year = new Date().getFullYear();
			var month = new Date().getMonth()+1;
			$(function(){
				if(month<10){
					month=0+""+month;
				}
				$("#selectMonthTimeExport").val(year+""+month)
				
				
			})
			
			function excelExport(){
				$("#yearText").val( $("#selectMonthTimeExport").val().substr(0,4));
				$("#monthText").val($("#selectMonthTimeExport").val().substr(4,5));
				$("#exportForm").submit();
			}
				
					
		</script>
	</head>
	<body>
		<form id="exportForm" action="${BasePath}/material/manager/excelExport.kq">
		<input id="selectMonthTimeExport" class="Wdate" type="text" readonly="readonly" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyyMM'})" ><br> 
	     
		
		<input type="hidden" id="yearText" name="year"/><br>
		<input type="hidden" id="monthText" name="month"/><br>
		<button id="exportButton" onclick="excelExport()">导出Excel</button>
		</form>
	</body>
</html>










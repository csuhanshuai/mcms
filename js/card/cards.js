//显示灰色JS遮罩层  
function showBg(rid,ct, content) {
	//
	
	var bH = $("body").height();
	var bW = $("body").width() + 16;
	var objWH = getObjWh(ct);
	$("#fullbg").css({
		width : bW,
		height : bH,
		display : "block"
	});
	var tbT = objWH.split("|")[0] + "px";
	var tbL = objWH.split("|")[1] + "px";
	$("#" + ct).css({
		top : tbT,
		left : tbL,
		display : "block"
	});
	
	var bid=$("#bid").val();
	var id = $("#id").val();
	var ridv = $("#rid").val();
	var sendagainurl="/cards/"+bid+"/toCardsDetail.kq?id="+id+"&editrid="+ridv;
	var toindex="/cards/"+bid+"/index.kq?editrid="+ridv;
	$("#" + content)
			.html(
					"<div class='sendtip'><img style='width:300px;height:300px;' src='/images/cards/sendtip.png'/><br><button class='btn' value='取消'  onclick='window.location.href=\""+sendagainurl+"\";'>再发一条</button><button value='取消' class='btn' onclick='window.location.href=\""+toindex+"\";'>选择贺卡</button><button value='取消' class='btn' onclick='closeBg();'>取消</button></div>");
	$(window).scroll(function() {
		resetBg()
	});
	$(window).resize(function() {
		resetBg()
	});
}

function getObjWh(obj) {
	var st = document.documentElement.scrollTop;// 滚动条距顶部的距离
	var sl = document.documentElement.scrollLeft;// 滚动条距左边的距离
	var ch = document.documentElement.clientHeight;// 屏幕的高度
	var cw = document.documentElement.clientWidth;// 屏幕的宽度
	var objH = $("#" + obj).height();// 浮动对象的高度
	var objW = $("#" + obj).width();// 浮动对象的宽度
	var objT = Number(st) + (Number(ch) - Number(objH)) / 2;
	var objL = Number(sl) + (Number(cw) - Number(objW)) / 2;
	return objT + "|" + objL;
}
function resetBg() {
	var fullbg = $("#fullbg").css("display");
	if (fullbg == "block") {
		var bH2 = $("body").height();
		var bW2 = $("body").width() + 16;
		$("#fullbg").css({
			width : bW2,
			height : bH2
		});
		var objV = getObjWh("dialog");
		var tbT = objV.split("|")[0] + "px";
		var tbL = objV.split("|")[1] + "px";
		$("#dialog").css({
			top : tbT,
			left : tbL
		});
	}
}

// 关闭灰色JS遮罩层和操作窗口
function closeBg() {
	$("#fullbg").css("display", "none");
	$("#dialog").css("display", "none");
}

/**
 * 保存贺卡信息
 */
function saveMessage(rid) {
	
	var bid=$("#bid").val();
	var id = $("#id").val();
	var to = $("#to").val();
	var content = $("#content").val();
	var from = $("#from").val();
	var ridv = $("#rid").val();
	
	
	var url;
	var data;
	 url = "/cards/send.kq";
	 data = {
			 	"id":id,
			 	"bid":bid,
			 	"rid":ridv,
				"to" : to,
				"content" : content,
				"from" : from
			};


	ajaxRequest(url, data, function(result) {
		if (!result)
			return;
		result = result.replace(/(^\s*)|(\s*$)/g, '');
		if (result == "success") {
			
			rid.href="/cards/"+bid+"/toCardsDetail.kq?id="+id+"&rid="+ridv;
			$("#rid").val(ridv);
//			$("#question").val("");
//			$("#answer").val("");
//			$("#id").val("");
//			$("#tips").css("display", "block");
//			
//			$("#tipcontent").text("保存成功");
//			$('#myModal').modal({
//				  keyboard: false
//			});
//			$('#myModal').on('hidden.bs.modal', function (e) {
			//alert("发送成功!");
				//window.location.reload();
//			});
				
			return;
		} else {
//			$("#tips").css("display", "block");
//			$("#tips").text(result);
		}
	});

}


function sendagain(){
	
	
}

//发达ajax请求
function ajaxRequest(url, reqParam, callback) {
	$.ajax({
		type : 'POST',
		url : url,
		data : reqParam,
		cache : true,
		async:false,
		success : callback
	});
}


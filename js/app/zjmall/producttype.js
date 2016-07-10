
/**
 * 去修改
 */
function toUpdateProductType(id,typename) {
	$("#typename").val(typename);
	$("#id").val(id);
}


/**
 * 删除
 */
function removeProductType(id) {

	$('#okbtn').on('click', function(e) {
		window.location.href = "removeProductType.kq?id=" + id;
	});
	$('#deleteModal').modal({
		keyboard : true
	});

}

/**
 * 添加与修改
 */
function saveProductType() {
	var id = $("#id").val();
	var typename = $("#typename").val();

	var url;
	var data;
	if (id != null && id != "") {
		url = "updateProductType.kq";
		data = {
			"id" : id,
			"typename" : typename

		};
	} else {
		url = "addProductType.kq";
		data = {
			"typename" : typename
		};
	}

	ajaxRequest(url, data, function(result) {
		if (!result)
			return;
		result = result.replace(/(^\s*)|(\s*$)/g, '');
		if (result == "success") {

			$("#typename").val("");

			$("#tips").css("display", "block");

			$("#tipcontent").text("保存成功");
			$('#myModal').modal({
				keyboard : false
			});
			$('#myModal').on('hidden.bs.modal', function(e) {
				window.location.reload();
			});

			return;
		} else {
			$("#tips").css("display", "block");
			$("#tips").text(result);
		}
	});

}

/**
 * 提交表单
 */
function submitForm() {

	var form = document.forms[0];
	form.target = "mbdif"; // 表单提交后在父页面显示结果
	form.submit();
	window.top.TB_remove();
}

// 发达ajax请求
function ajaxRequest(url, reqParam, callback) {
	$.ajax({
		type : 'POST',
		url : url,
		data : reqParam,
		cache : true,
		success : callback
	});
}

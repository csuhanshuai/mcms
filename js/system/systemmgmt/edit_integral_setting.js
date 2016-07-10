var basePath;
$(document).ready(function(){
	basePath = $("#basePath").val();
});

/**
 * 返回到列表界面
 * @return
 */
function backToList(){
	window.location=basePath+"/ecsystem/systemmgmt/systemintegral/toIntegralList.sc";
}

/*验证框架*/
var config={form:"integralForm",submit:submitForm,
	fields:[
		{name:'integralNo',allownull:false,regExp:"",defaultMsg:'请输入序号',focusMsg:'请输入序号',errorMsg:'请输入序号',rightMsg:'',msgTip:'integralNoMsg'}, 
		{name:'integralName',allownull:false,regExp:"",defaultMsg:'请输入积分规则名称',focusMsg:'请输入积分规则名称',errorMsg:'积分规则名称不能为空!',rightMsg:'',msgTip:'integralNameMsg'},
		{name:'integral',allownull:false,regExp:"intege",defaultMsg:'请输入积分',focusMsg:'请输入积分',errorMsg:'积分输入不正确!',rightMsg:'',msgTip:'integralMsg'}
	]};

Tool.onReady(function(){
	var f = new Fw(config);
	f.register();
});

function submitForm(){
	return checkName();
}

/**
 * 验证名称是否重复
 * @return
 */
function checkName(){
	var results = false;
	var hidNames = $.trim($("#hidNames").val());
	var integralName = $.trim($("#integralName").val());
	if(hidNames==integralName){
		return true;
	}
	var url =basePath + "/ecsystem/systemmgmt/systemintegral/checkNameIsExist.sc";
	var data={integralName:integralName};
	$.ajax({
		url:url,
		data:data,
		async:false,
		dataType:'JSON',
		type:'POST',
		success:function(d){
			var obj = eval("("+d+")");
			if(obj.result=="1"){
				results=true;
			}else{
				document.getElementById("integralNameMsg").className="onerror";
				$("#integralNameMsg").html("该名称已存在");
				results=false;
			}
		}
	});
	return results;
}
var basePath;
$(document).ready(function(){
	basePath = $("#basePath").val();
});

/**
 * 删除 对象 的方法
 * @param current
 * @param integralId
 * @return
 */
function deleteIntegralById(current,integralId){
	var url =basePath + "/ecsystem/systemmgmt/systemintegral/d_deleteSystemmgtIntegral.sc";
	var data={integralId:integralId};
	if(confirm("确定要删除该项?")){
		$.ajax({
			url:url,
			data:data,
			async:false,
			dataType:'JSON',
			type:'POST',
			success:function(d){
				alert("删除成功!");
				$(current).parent().parent().remove();
			}
		});
	}
}

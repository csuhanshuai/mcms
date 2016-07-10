
/**
 * 删除系统用户
 */
function removeSystemEmail(id){
	if(confirm("确定要删除该系统短信")){
		
		var url = "d_remove.sc";
		var data={
			"id":id
		};
		
		ajaxRequest(url,data,function(result){
			if(!result) return ;
			result = result.replace(/(^\s*)|(\s*$)/g,'');
			if(result == "success"){
				alert("删除成功");
				$("#Tr"+id).remove(); 
			}else{
				alert("删除失败");
			}
		});
	}
}

/**
* 选择用户组织机构
*/
function toShowDetail(id){
	var param = "id="+id;
	showThickBox("短信明细","../../systemmgmt/systemsms/querySystemSMSById.sc?TB_iframe=true&height=550&width=750",false,param);
}


//发达ajax请求
function ajaxRequest(url,reqParam,callback){
	$.ajax({
		  type: 'POST',
		  url: url,
		  data: reqParam,
		  cache: true,
		  success: callback
	});
}
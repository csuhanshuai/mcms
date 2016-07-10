//修改节点数据
function updateOrganizStructNode(){
	
	
	
	if(!confirm("确认修改?"))return 
	
	if($("#id").val() == null || $("#id").val() == ""){
		alert('资源不存在! 请先增加');
		return ;
	}
	
	
	var newNodeText = $('#name').val();
	if(newNodeText == null || newNodeText == ""){
		alert("组织机构名称不能为空！");
		clearInputValue();
		return false;
	}
	
	var reg = /^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/;
	
	if(!reg.test(newNodeText)){
		alert("组织机构名称不能包含特殊字符！");
		return false;
	}
	
	var data={
		"id":$("#id").val(),
		"orgName":$("#name").val(),
		"ecInd":$("#ecInd").val(),
		"remark":$("#remark").val()
	};
	
	var url="u_updateOrganizStructNode.kq";
	
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result.length == ""){
			alert("修改失败");
			return ;
			
		}
		var selectNode = $('#resourceTree').tree('getSelected');
		var resultNode = eval("("+result+")");
		selectNode.text= resultNode.text;
	    $("#resourceTree").tree("update",selectNode);
		
		alert("修改成功");
	});
}

//增加节点
function addOrganizStructNode(){
	
	var node = $('#resourceTree').tree('getSelected');
	if(!node){
		alert('请选择一个节点！');
		return false;
	}
	
	var newNodeText = $('#name').val();
	if(newNodeText == null || newNodeText == ""){
		alert("组织机构名称不能为空！");
		clearInputValue();
		return false;
	}
	
	var reg = /^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/;
	
	if(!reg.test(newNodeText)){
		alert("组织机构名称不能包含特殊字符！");
		return false;
	}
	
	if(newNodeText == node.text){
		alert('子机构名称不能与上级相同！');
		clearInputValue();
		return false;
	}
	
	
	var url="c_addOrganizStructNode.kq";
	var data={
		"orgName":newNodeText,
		"ecInd":$("#ecInd").val(),
		"remark":$("#remark").val(),
		"parentid":node.id
	};

	
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result.length == ""){
			alert("增加失败");
			return ;
		}

		var node = eval("("+result+")");
		if(node.id){
			var nodeData = [{
				id:node.id,
				text:node.text
			}];
			
			append(nodeData);
			clearInputValue();
		}
	});
}

function loadNodeData(nodeid){
	var url = "queryOrganizStructById.kq";
	var data={
		"id":nodeid
	};
	
	ajaxRequest(url,data,function(result){
		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		//如果获取数据为空  则清空数据
		if(result.length == ""){
			clearInputValue();
			return ;
		}
		var node = eval("("+result+")");
		$("#id").attr("value",node.id);
		$("#name").attr("value",node.text);
		
		$("#ecInd").attr("value",node.attributes.ecInd);
		$("#remark").attr("value",node.attributes.remark);
		
	});
	
}

function removeOrganizStructNode(){
	
	var node = $('#resourceTree').tree('getSelected');
	if(!node){
		alert('请选择要删除的节点');
		return ;
	}
	
	if(!confirm("确认删除?"))return 
	
	
	if(node.attributes != null && node.attributes.struc != null && node.attributes.struc == "root"){
		alert("根目录不能删除");
		return false;
	}
	
	var url = "d_removeOrganizStructNode.kq";
	var data={
		"organizStructid":node.id
	};
	
	ajaxRequest(url,data,function(result){
		if(!result) return ;
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result == "success"){
			clearInputValue();
			remove();
			return ;
		}
	});
}

function clearInputValue(){
	$("#id").attr("value","");
	$("#name").attr("value","");
	$("#remark").attr("value","");
	$("#ecInd").attr("value","1");
	
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

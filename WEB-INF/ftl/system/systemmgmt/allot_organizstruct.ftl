<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/js/common/tree/css/icon.css" />
<script type="text/javascript"  src="${BasePath}/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="${BasePath}/js/common/tree/js/jquery.easyui.min.js"></script>

<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/tree.js"></script>

<script>
	function getCheckedStruc(){
		var node = $('#resourceTree').tree('getSelected');
		
		if(node == null){
			alert('请选择一个节点');
			return false;
		}
		
		var organizNo = "";
		var organizName = "";
		
		try{
			organizNo = node.attributes.no;
		}catch(e){
			organizNo ="";
		}
		organizName =node.text ;
		window.top.TB_remove();
		window.top.frames["content"].initOrganizStruct(organizNo,organizName);
	}
	
	function loadNodeData(){};
</script>
<input type="button" onclick="getCheckedStruc()" value="确定"/>
<ul id="resourceTree"><script>onloadResourceTree('loadOrganizStructDate.kq',false);</script></ul>

﻿function updateMenuNode(){$("#menuName").val();if(confirm("\u786e\u8ba4\u4fee\u6539?"))if(null==$("#id").val()||""==$("#id").val())alert("\u8d44\u6e90\u4e0d\u5b58\u5728! \u8bf7\u5148\u589e\u52a0");else{var b={menuName:$("#menuName").val(),memuUrl:$("#memuUrl").val(),type:$("#type").val(),remark:$("#remark").val(),sort:$("#sort").val(),id:$("#id").val()};ajaxRequest("u_updateResourcesNode.kq",b,function(a){if(a)if(a=a.replace(/(^\s*)|(\s*$)/g,""),""==a.length)alert("\u4fee\u6539\u5931\u8d25");else{var b=
$("#resourceTree").tree("getSelected");a=eval("("+a+")");b.text=a.text;$("#resourceTree").tree("update",b);alert("\u4fee\u6539\u6210\u529f")}})}}
function addMenuNode(){var b=$("#resourceTree").tree("getSelected");if(!b)return alert("\u8bf7\u9009\u62e9\u4e00\u4e2a\u8282\u70b9\uff01"),!1;if($("#menuName").val()==b.text)return alert("\u5b50\u76ee\u5f55\u540d\u79f0\u4e0d\u80fd\u4e0e\u7236\u7ea7\u76f8\u540c\uff01"),!1;b={menuName:$("#menuName").val(),memuUrl:$("#memuUrl").val(),type:$("#type").val(),remark:$("#remark").val(),sort:$("#sort").val(),parentid:b.id};ajaxRequest("c_addResourcesNode.kq",b,function(a){a&&(a=a.replace(/(^\s*)|(\s*$)/g,
""),""==a.length?alert("\u589e\u52a0\u5931\u8d25"):(a=eval("("+a+")"),a.id&&(append([{id:a.id,text:a.text}]),clearInputValue())))})}
function loadNodeData(b){ajaxRequest("queryResourceById.kq",{id:b},function(a){a=a.replace(/(^\s*)|(\s*$)/g,"");""==a.length?clearInputValue():(a=eval("("+a+")"),$("#id").attr("value",a.id),$("#menuName").attr("value",a.text),$("#menuName").blur(),$("#memuUrl").attr("value",a.url),$("#type").attr("value",a.type),$("#remark").attr("value",a.remark),$("#sort").attr("value",a.order),$("#sort").blur())})}
function removeMenuNode(){var b=$("#resourceTree").tree("getSelected");if(!b)alert("\u8bf7\u9009\u62e9\u8981\u5220\u9664\u7684\u8282\u70b9");else if(confirm("\u786e\u8ba4\u5220\u9664?")){if(null!=b.attributes&&null!=b.attributes.struc&&"root"==b.attributes.struc)return alert("\u6839\u76ee\u5f55\u4e0d\u80fd\u5220\u9664"),!1;ajaxRequest("d_removeResourcesNode.kq",{resourceid:b.id},function(a){a&&(a=a.replace(/(^\s*)|(\s*$)/g,""),"success"==a?(clearInputValue(),remove()):alert("\u5220\u9664\u5931\u8d25,\u88ab\u4f7f\u7528\u7684\u8d44\u6e90\u4e0d\u5141\u8bb8\u5220\u9664"))})}}
function clearInputValue(){$("#id").attr("value","");$("#menuName").attr("value","");$("#menuName").blur();$("#memuUrl").attr("value","");$("#type").attr("value","0");$("#remark").attr("value","");$("#sort").attr("value","");$("#sort").blur()}function ajaxRequest(b,a,c){$.ajax({type:"POST",url:b,data:a,cache:!0,success:c})}function submitSelectOrgForm(){$("#allCheckResources").attr("value",getCheckedNodes());var b=document.forms[0];b.target="content";b.submit();window.top.TB_remove()};

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="物料消耗管理系统系统">
<meta name="description" content="">
<meta name="keywords" content="">
<link href='${BasePath}/css/login_new.css' rel='stylesheet' type='text/css' />


<title>物料消耗管理系统</title>

<#include "base.ftl">
<style>
.demo1 {
margin-left: 0px;
margin-top: 10px;
padding: 0px 0px 0px;
border: 1px solid #DDDDDD;
border-radius: 4px;
position: relative;
word-wrap: break-word;
}
</style>



<script type='text/javascript' >

	$(document).ready(function() {
	
		var myContent=document.getElementById('myContent');
		myContent.style.height=(document.body.clientHeight-10)+"px";
		document.getElementById("content").style.height=(document.body.clientHeight-80)+"px";
	
	
	});

	
	
	
	
</script>

</head>

<body style="cursor: auto;overflow:hidden;" class="edit">
<div class="header">
  <div class="logo"> <img src="images/logo.jpg" /> </div>
  <div class="top-contents">
    <div class="fr out">
      <p class="fl">欢迎您！IBM</p>
      <a href="#" class="fl">退出</a> </div>
  </div>
</div>




<div id="myContent" class="container-fluid">
  <div class="row-fluid" style="overflow:hidden;height:100%;">
  <div class="">
  <div class="sidebar-nav">
    
  
  
  <#list login_system_user_resources as item>
      <#if item.isleaf=='0'&&item.id??&&item.id!="">
      <ul class="nav nav-list accordion-group">
          <li class="nav-header">
          <div class="pull-right popover-info"><i class="icon-question-sign "></i>
        </div>
          <i class="icon-plus icon-white"></i>${item.menuName}
          </li>
          <li style="display: none;" class="rows" id="estRows">
               <ul>
                  <#list login_system_user_resources as child>
                  <#if child.id??&&child.id!="">
        
                  <#if child.structure?substring(0,child.structure?last_index_of('-'))==item.structure>
                  <li><a href="${BasePath}${child.memuUrl}"  target="content">${child.menuName}</a></li>
                  </#if>   
                  </#if>
                  </#list>
              </ul>
          </li>
      </ul>   
      </#if>
  </#list>
  
   
    
  </div>
  
  
  
</div>
    <!--/span-->
    <iframe id="content" name="content" class="demo1 ui-sortable" style="width:100%;"></iframe>

 
    <!--/span-->
    
  </div>
  <!--/row--> 
</div>
<!--/.fluid-container--> 



<div class="modal hide fade" role="dialog" id="editorModal">
  <div class="modal-header"> <a class="close" data-dismiss="modal">×</a>
    <h3>编辑</h3>
  </div>
  <div class="modal-body">
    <p>
      <textarea id="contenteditor"></textarea>
    </p>
  </div>
  <div class="modal-footer"> <a id="savecontent" class="btn btn-primary" data-dismiss="modal">保存</a> <a class="btn" data-dismiss="modal">关闭</a> </div>
</div>
<div class="modal hide fade" role="dialog" id="downloadModal">
  <div class="modal-header"> <a class="close" data-dismiss="modal">×</a>
    <h3>下载</h3>
  </div>
  <div class="modal-body">
    <p>已在下面生成干净的HTML, 可以复制粘贴代码到你的项目.</p>
    <div class="btn-group">
      <button type="button" id="fluidPage" class="active btn btn-info"><i class="icon-fullscreen icon-white"></i> 自适应宽度</button>
      <button type="button" class="btn btn-info" id="fixedPage"><i class="icon-screenshot icon-white"></i> 固定宽度</button>
    </div>
    <br>
    <br>
    <p>
      <textarea></textarea>
    </p>
  </div>
  <div class="modal-footer"> <a class="btn" data-dismiss="modal">关闭</a> </div>
</div>
<div class="modal hide fade" role="dialog" id="shareModal">
  <div class="modal-header"> <a class="close" data-dismiss="modal">×</a>
    <h3>保存</h3>
  </div>
  <div class="modal-body">保存成功</div>
  <div class="modal-footer"> <a class="btn" data-dismiss="modal">Close</a> </div>
</div>



</body>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<#include "system-include.ftl" >

<script type="text/javascript" src="${BasePath}/js/common/tree/js/jquery.easyui.min.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/tree.js"></script>
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/resources.js"></script>

<style type="text/css">
*{margin:0px; padding:0px;}
body{font-size:12px;}
ul{list-style:none;}
ul li .tree-node{display:block;border-bottom:#e6e6e6 solid 1px;border-top:#e6e6e6 solid 1px; background:url(${BasePath}/images/ecsystem/barbg.gif) top repeat-x;margin:0 1px; line-height:28px;padding-left:15px;font-size:14px;font-weight:bold;color:#2b2b2b; width:134px; margin-bottom:3px;}
ul li ul li .tree-node{border:none; background:none; font-weight:normal; font-size:12px; height:22px; line-height:22px; color:#06F; margin-left:5px; text-align:left;}
ul li ul li .tree-node-selected{ background:url(${BasePath}/images/ecsystem/leftbarnavhover.gif) no-repeat; line-height:22px; width:130px; color:#fff; text-align:left;}
ul li ul li .tree-node-selected span{color:#fff;}
ul li ul li .tree-node-hover{background:url(${BasePath}/images/ecsystem/leftbarnavhover.gif) no-repeat; width:130px; height:22px; line-height:22px; color:#fff; font-size:12px; font-weight:normal; text-align:left;}
ul li ul li .tree-node-hover span{color:#fff;}
ul li ul li ul{padding-left:8px;}

#borderDiv{
	border:#e6e6e6 solid 1px; border-left:none;border-top:none; width:142px; height:500px;
}
</style>
</head>

<body>
	<div class="borderDiv">
		<ul id="resourceTree"><script>leftControllerMenu('loadResourceDate.kq?root_struc=${root_struc?default('')}');</script></ul>
	</div>
</body>
</html>

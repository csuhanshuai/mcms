<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "../system-include.ftl">
<script type="text/javascript"  src="${BasePath}/js/system/systemmgmt/systemUser.js"></script>
<title>无标题文档</title>
<style type="text/css">
	#select1,#select2{width:158px; margin:-4px;padding:5px;}
	.sel-div{border:1px solid #ccc;width:150px; overflow:hidden;}
	.a-up,.a-down{display: block;border: 1px solid #ccc;text-decoration:none;width:150px; background:#F2F2F2; text-align:center; height:25px; line-height:25px;cursor:pointer; letter-spacing:2px; zoom:1;}
	.a-up{border-bottom:none;}
	.a-down{border-top:none;}
	.a-right,.a-left{display:block; border:1px solid #ccc; width:100px; height:25px; line-height:25px; background:#F2F2F2;margin:15px; cursor:pointer;}
	.a-left{margin-top:20px;}
</style>
</head>

<body>
<div class="contentMain">
        	<div class="ytback-tt-1 ytback-tt">
           	<span>您当前的位置：</span>首页 &gt; 系统管理  &gt; 用户角色分配</div>
            
  <div class="content">    
      <div class="mb-btn-fd-bd">
      <div class="mb-btn-fd relative">
        <span class="btn-extrange absolute">
            <ul class="onselect">
                <li class="pl-btn-lfbg"></li>
                <li class="pl-btn-ctbg"><a  class="btn-onselc">用户角色分配</a></li>
                <li class="pl-btn-rtbg"></li>
            </ul>
        </span>
      </div>
      </div>
      <div class="blank15"></div>
      <div class="yt-c-div">
      	<form action="u_allotUserRole.kq" name="allotRoleForm" id="allotRoleForm" method="post" style="padding:0px;margin:0px;">
      		<script>document.write("<input type='hidden' name='parentSourcePage' value='"+getThickBoxUrl()+"'/>");</script>
      		<input  type="hidden" name="id" value="${id}" />
	        <table cellpadding="0" cellspacing="0" style="padding-left:30px;padding-top:15px;">
	            <tbody>
	            	<tr>
	            		<td align="center">所有角色</td>
	            		<td></td>
	            		<td align="center">已拥有角色</td>
	            	</tr>
	                <tr>
		                <td valign="top">
							<a id="right_up" class="a-up">上移</a>
		               		<div class="sel-div">
		                		<select multiple id="select2" size="10">
		                			<#if notAllotList??>
		                				<#list notAllotList as role>
		                					<option value="${role.id}">${role.roleName}</option>
		                				</#list>
		                			</#if>
		                		</select>
		                	</div>
		                	<a id="right_down" class="a-down">下移</a>
		                </td>
		                <td align="center" valign="middle">
		                	<a id="remove" class="a-left">增加角色&gt;&gt;</a>
		                	<a id="add" class="a-right">&lt;&lt; 删除角色</a>
		                </td>
		                <td>
		                	<a  id="left_up" class="a-up">上移</a>
		                	<div class="sel-div">
		               			<select  name="allowRoleValues" size="10" multiple id="select1" >
		                			<#if myRoleList??>
		                				<#list myRoleList as myRole>
		                					<option value="${myRole.id}">${myRole.roleName}</option>
		                				</#list>
		                			</#if>
		                		</select>
		               	 	</div>
		                	<a  id="left_down" class="a-down">下移</a>
		                </td>
	                </tr>	
	                <tr>
	                	<td colspan="3" align="center" height="80" valign="middle">
	                		<input  type="button" onclick="submitAllotRoleForm()" class="yt-form-btn-add" value="保存" />   
	                		<input type="button" onclick="parent.TB_remove();" class="yt-form-btn-back" value="取消" />
	                	</td>
	                </tr>
	            </tbody>
	        </table>
        </form>
        <div class="blank20"></div>
      </div>   	

</div>
</div>

</body>
</html>


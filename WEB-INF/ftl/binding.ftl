
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="无线建站系统">
<meta name="description" content="">
<meta name="keywords" content="">
<title>奇新无线建站系统</title>

<#include "../../base.ftl">

</head>

<body style="min-height: 660px; cursor: auto;" class="edit">
<div  class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<form  role="form" action="binding.kq" method="post">
				<fieldset>
					 <legend>微信公众账号绑定  </legend><span class="help-block">${errorMsg}</span>  
					 <label>微信公众账号：</label>
					 <input type="text" id="gzusername" name="gzusername" value="${gzusername?default('')}"/><span class="help-block"></span> 
					 
					 <label>微信公众密码：</label>
					 <input type="password" id="gzpassword" name="gzpassword" value="${gzpassword?default('')}"/><span class="help-block"></span> 
					 
					 <label class="checkbox"><input type="checkbox" /> 勾选同意公众账号绑定声明</label> 
					 <button type="submit" class="btn">提交</button>
				</fieldset>
			</form>
		</div>

    <!--/span-->
    
  </div>
  <!--/row--> 
</div>
<!--/.fluid-container--> 


</body>
</html>
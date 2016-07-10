<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物料消耗管理系统</title>

<link href='${BasePath}/css/login_new.css' rel='stylesheet' type='text/css' />


</head>
<body>
<div class="sign_bao">
  <div class="sign_top">
    <p><img src='${BasePath}/images/material/huewei_logo.png'/>&nbsp;&nbsp;物料消耗管理系统</p>
    <div class="sign_box">
		      <div class="sign_box_title">登录</div>
		      <form  role="form" action="${BasePath}/material/manager/login.kq" method="post">
		      
			      <div class="sign_box_body">
			      
				        <div class="denglv"> <i class="i-login-e"></i>
				          <input type="text" id="username" name="username"  placeholder="用户名" required autofocus><br>
				        </div>
				        <div class="mima"> <i class="i-login-e"></i>
				           <input type="password" id="password" name="password"  placeholder="密码" required>
				        </div>
				       <span style="color:red;float:left;margin-top: 2px;font: 12px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;">${loginInfo?default("")}</span> 
			      </div>
			      <div class="sign_clear">
				        <ul >
				          <li class="sign_fuxuan">
				            
				            <input type="checkbox" value="remember-me"> 
				            
				            <label >记住密码</label>
				            
				          </li>
				        </ul>
			      </div>
			      <button class="sign_button" type="submit">登录</button>
		      </form>
    </div>
  </div>
</div>
</body>
</html>

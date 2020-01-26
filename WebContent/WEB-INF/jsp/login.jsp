<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
<title>登陆页面</title>
</head>
<body>
<div style="float:left;margin-left:10px;padding-top:10px;height:15px; ">
<span style="font-size:45px">物料销售平台</span></div>
<div class="am-container header" style="margin-left:1000px;padding-top:25px;height:15px; ">

					<a href="index?username=${user.username}" target="_top" class="h">商城首页</a>
	</div>
	<div class="login-boxtitle"></div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/img/big.jpg" style="width:600px; height:470px; " />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form>
						<div class="user-name">
							<label for="user">帐号:</label> <input
								type="text" name="" id="username" placeholder="请输入帐号">
						</div>
						<div class="user-pass">
							<label for="password">密码:</i></label> <input
								type="password" name="" id="password" placeholder="请输入密码">
						</div>
						<div >
							是否管理员：
							<input style="width:20px;height:20px;margin-left:10px" name="isAdmin" type="radio" value="1" />是 
							<input style="width:20px;height:20px;margin-left:10px" name="isAdmin" type="radio" value="0" checked="checked"/>否 
						</div>
					</form>
				</div>
				<div>
					<span id="hintText" style="color:red"></span>
				</div>

				<div class="login-links">
					 <a href="forgetPassword" class="am-fr" >忘记密码？</a> <a
						href="register" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				<div class="am-cf">
					<input type="submit" name="" value="登 录" onclick="login()"
						class="am-btn am-btn-primary am-btn-sm"/>
				</div>
			</div>
		</div>
	</div>
	<div class="footer ">
		<div class="footer-hd ">
			<p >
				<a href="# ">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a
					href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p style="margin-left:250px">
				<a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>©
					2015-2025 Hengwang.com 版权所有. 
				</em>
			</p>
		</div>
	</div>
	<script type="text/javascript">
	function login() {
		if($('#username').val() == '' || $('#username').val() == null){
			$('#hintText').text("用户名不能为空！");
			return;
		}
		if($('#password').val() == '' || $('#password').val() == null ){
			$('#hintText').text("密码不能为空！");
			return;
		}
		$('#hintText').text("");
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/api/login',
			data : {
				username : $('#username').val(),
				password : $('#password').val(),
				isadmin : $("input[name='isAdmin']:checked").val()
			},
			dataType : 'json',
			success : function(result) {
				if (result.code == 0) {
					window.location.href='index?username='+result.data.username;
				} else {
					$('#hintText').text(result.msg);
				}
			}
		});
	}
	</script>
</body>
</html>
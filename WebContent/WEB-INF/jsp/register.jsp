<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<title>注册页面</title>
</head>
<body>
<div class="am-container header" style="margin-left:1000px;padding-top:25px;height:15px">
					<a href="index?username=${user.username}" target="_top" class="h">商城首页</a>
	</div>
	<div class="login-boxtitle"></div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/img/big.jpg" style="width:495px;"/>
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<h3 class="title">注册帐号</h3>

				<div class="clear"></div>
					<div class="am-tabs-bd">
						<form method="post">
							<div class="user-email">
								<label for="email" style="width: 50px"><span
									style="color: red">*</span><span style="font-size: 13px">帐号:</span></label>
								<input style="padding-left: 70px" type="text" name="" id="username"
									placeholder="请输入账号">
							</div>
							<div class="user-pass">
								<label for="password" style="width: 50px"><span
									style="color: red">*</span><span style="font-size: 13px">密码:
								</span></label><input type="password" name="" id="password" placeholder="设置密码"
									style="padding-left: 70px">
							</div>
							<div class="user-pass">
								<label for="passwordRepeat" style="width: 70px"><span
									style="color: red">*</span><span style="font-size: 13px">确认密码:</span></label>
								<input type="password" name="" id="passwordRepeat"
									style="padding-left: 70px" placeholder="确认密码">
							</div>
							<div class="user-pass">
								<label for="mobile" style="width: 50px"><span
									style="color: red">*</span><span style="font-size: 13px">电话:</span></label>
								<input type="text" name="" id="mobile"
									style="padding-left: 70px" maxlength=11 placeholder="请输入手机号">
							</div>
							<div class="user-pass">
								<label for="address" style="width: 50px"><span
									style="font-size: 13px">地址:</span></label> <input type="text" name=""
									id="address" style="padding-left: 70px" placeholder="请输入家庭住址">
							</div>
						</form>
						<div class="login-links">
							<label for="reader-me"> <input id="reader-me"
								type="checkbox"> 点击表示您同意商城《服务协议》
							</label>
						</div>
						<div style="height:3px">
							<span id="hintText" style="color:red;font-size:10px"></span>
						</div>
						<div class="am-cf">
							<input type="submit" name="" value="注册" onclick="submit()"
								class="am-btn am-btn-primary am-btn-sm am-fl">
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="footer ">
			<div class="footer-hd ">
				<p>
					<a href="# ">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a
						href="# ">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p style="margin-left: 250px">
					<a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>©
						2015-2025 Hengwang.com 版权所有. 
					</em>
				</p>
			</div>
		</div>
		<script>
			function submit() {
				if ($('#username').val() == '' || $('#username').val() == null) {
					$('#hintText').text("用户名不能为空！");
					return;
				}
				if ($('#password').val() == '' || $('#password').val() == null) {
					$('#hintText').text("密码不能为空！");
					return;
				}
				if ($('#password').val() != $('#passwordRepeat').val()) {
					$('#hintText').text("密码不一致！");
					return;
				}
				if ($('#mobile').val() == '' || $('#mobile').val() == null) {
					$('#hintText').text("手机号不能为空！");
					return;
				}
				if($('#reader-me').is(':checked')) {
					$('#hintText').text("");
					$.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/insert',
						data : {
							username : $('#username').val(),
							password : $('#password').val(),
							mobile : $('#mobile').val(),
							address : $('#address').val()
						},
						dataType : 'json',
						success : function(result) {
							if (result.code == 0) {
								alert("注册成功！")
								window.location.href = 'login';
							} else {
								$('#hintText').text(result.msg);
							}
						}
					});
				}else{
					$('#hintText').text("您未同意商城《服务协议》!");
				}
			}
		</script>
</body>
</html>
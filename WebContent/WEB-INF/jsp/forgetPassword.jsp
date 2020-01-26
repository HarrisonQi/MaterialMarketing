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
<title>忘记密码</title>
</head>
<body>
	<div class="login-boxtitle"></div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/img/big.jpg" style="width:495px;"/>
			</div>
			<div class="login-box">

				<h3 class="title">忘记密码</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form>
						<div class="user-name" id="nameDiv">
							<label for="user"><span
									style="color: red">*</span><span style="font-size: 13px">帐号:</span></label> <input
								type="text" name="" id="username" placeholder="请输入帐号" style="padding-left: 70px">
						</div>
						<div class="user-pass" id="mobileDiv">
							<label for="password"><span
									style="color: red">*</span><span style="font-size: 13px">手机:</span></label> <input
							maxlength=11	type="text" name="" id="mobile" placeholder="请输入手机号" style="padding-left: 70px">
						</div>
						<div class="user-pass" id="passwordDiv">
								<label for="password" style="width: 50px"><span
									style="color: red">*</span><span style="font-size: 13px">密码:
								</span></label><input type="password" name="" id="password" placeholder="设置密码"
									style="padding-left: 70px">
						</div>
						<div class="user-pass" id="passwordRepeatDiv">
								<label for="passwordRepeat" style="width: 70px"><span
									style="color: red">*</span><span style="font-size: 13px">确认密码:</span></label>
								<input type="password" name="" id="passwordRepeat"
									style="padding-left: 70px" placeholder="确认密码">
						</div>
					</form>
				</div>
				<div>
					<span id="hintText" style="color:red"></span>
				</div>

				<div class="login-links">
					<a href="register" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				<div class="am-cf" id="veriftDiv">
					<input id="verifyButton" type="submit" name="" value="验证" onclick="verify()"
						class="am-btn am-btn-primary am-btn-sm"/>
				</div>
				<div class="am-cf" id="submitDiv">
					<input id="submitButton" type="submit" name="" value="提交" onclick="submit()"
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
					2015-2025 Hengwang.com 版权所有. 更多模板 
				</em>
			</p>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$('#passwordDiv').hide();
		$('#passwordRepeatDiv').hide();
		$('#submitDiv').hide();
	})
	function verify(){
		if($('#username').val() == '' || $('#username').val() == null){
			$('#hintText').text("用户名不能为空！");
			return;
		}
		if($('#mobile').val() == '' || $('#mobile').val() == null ){
			$('#hintText').text("手机号不能为空！");
			return;
		}
		$('#hintText').text("");
		 $.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/api/verift',
			data : {
				username : $('#username').val(),
				mobile : $('#mobile').val(),
			},
			dataType : 'json',
			success : function(result) {
				if (result.code == 0) {
					$('#nameDiv').hide();
					$('#mobileDiv').hide();
					$('#veriftDiv').hide();
					$('#passwordDiv').show();
					$('#passwordRepeatDiv').show();
					$('#submitDiv').show();
					$('#hintText').text("验证成功");
				} else {
					$('#hintText').text(result.msg);
					 $('#username').val("");
					 $('#mobileDiv').val("");
				}
			}
		}); 
	}
	function submit(){
		if($('#password').val() == '' || $('#password').val() == null){
			$('#hintText').text("密码不能为空！");
			return;
		}
		if ($('#password').val() != $('#passwordRepeat').val()) {
			$('#hintText').text("密码不一致！");
			return;
		}
		$('#hintText').text("");
		 $.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/api/updatePassword',
			data : {
				username : $('#username').val(),
				password : $('#password').val(),
			},
			dataType : 'json',
			success : function(result) {
				if (result.code == 0) {
					$('#nameDiv').hide();
					$('#mobileDiv').hide();
					$('#veriftDiv').hide();
					$('#passwordDiv').show();
					$('#passwordRepeatDiv').show();
					$('#submitDiv').show();
					alert("修改成功");
					window.location.href = 'login';
				} else {
					$('#hintText').text(result.msg);
					 $('#username').val("");
					 $('#mobileDiv').val("");
				}
			}
		}); 
	}
	</script>
</body>
</html>
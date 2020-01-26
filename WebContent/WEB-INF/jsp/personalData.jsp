<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min1.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app1.css">
<style type="text/css">
.am-container {
	max-width: 1200px;
}

.topMessage {
	padding: 0px 6px;
	height: 35px;
	line-height: 35px;
}

.header, .nav.white {
	padding-right: 40px;
}

.message-l {
	float: left;
}

.message-r {
	float: right;
}

.topMessage {
	float: left;
	padding: 0px 6px;
	height: 35px;
	line-height: 35px;
}
</style>
</head>
<body>
	<div class="am-container header"
		style="font-size: 15px; margin-top: 10px">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<c:choose>
						<c:when test="${user.username==null}">
							<a href="${pageContext.request.contextPath}/system/login"
								target="_top" class="h">亲，请登录</a>
							<a href="register" target="_top">免费注册</a>
						</c:when>
						<c:otherwise>
							<span>${user.username },你好</span>
							<a href="index" target="_top" style="margin-left: 15px"><span
								style="color: red">[安全退出]</span></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="index?username=${user.username}" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="personalCenter?username=${user.username}" target="_top">用户管理</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="shoppingCart?username=${user.username}"
						target="_top"><span>购物车</span><span id="shoppingCartNum"></span></a>
				</div>
			</div>
			<c:choose>
				<c:when test="${user.isadmin==1}">
					<div class="topMessage mini-cart">
						<div class="menu-hd">
							<a id="mc-menu-hd" href="bookControl?username=${user.username }"
								target="_top"><span>商品管理</span><span id="shoppingCartNum"></span></a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div class="tpl-page-container tpl-page-header-fixed"
		style="margin-top: 30px">
		<div class="tpl-left-nav tpl-left-nav-hover" style="margin-top: 12px">
			<div class="tpl-left-nav-list">
				<ul id="ul" class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a
						href="javascript:myOrderItem()" class="nav-link "> <span>我的订单</span>
					</a></li>
					<li class="tpl-left-nav-item"><a
						href="javascript:personalData()"
						class="nav-link tpl-left-nav-link-list"> <span>个人资料</span>
					</a></li>
					<li class="tpl-left-nav-item"><a
						href="javascript:shoppingCart()"
						class="nav-link tpl-left-nav-link-list"> <span>购物车</span>
					</a></li>
					<c:choose>
						<c:when test="${user.isadmin==1}">
							<li class="tpl-left-nav-item"><a
								href="javascript:orderItems()" class="nav-link "> <span>订单配送管理</span>
							</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<div class="tpl-content-wrapper">
			<div class="tpl-portlet-components">
				<div class="portlet-title">个人资料</div>
				<div class="tpl-block">
					<div id="userMsg" class="tabCont" style="display: block;">
						<!--基本配置-->
						<ul class="hypz">
							<li class="clearfix">
								<div class="li_r" style="margin-top: 20px">
									<span>用户名:<input id="username" style="margin-left: 15px"
										name="" type="text" disabled="disabled">
								</div>
							</li>
							<li class="clearfix">
								<div class="li_r" style="margin-top: 20px">
									<span>电话:</span><input id="mobile" style="margin-left: 32px"
										name="" type="text"> <i>*</i>
								</div>
							</li>
							<li class="clearfix">
								<div class="li_r" style="margin-top: 20px">
									<span>地址:</span><input id="address" style="margin-left: 32px"
										name="" type="text"> <i>*</i>
								</div>
							</li>
							<div id="repeating"
								style="margin-left: 70px; margin-top: 8px; color: red">
								<span></span>
							</div>
							<li class="clearfix">
								<div style="margin-top: 30px; margin-left: 70px">
									<button type="button"
										class="am-btn am-btn-default am-btn-success"
										onclick="update()">修改</button>
									<button style="margin-left: 20px" type="button"
										class="am-btn am-btn-default am-btn-success"
										onclick="ShowDiv('MyDiv','fade')">修改密码</button>
								</div>
							</li>
						</ul>
					</div>
					<div id="MyDiv" class="white_content">
						<div class="li_r" style="margin-top: 20px">
							<span>原密码:<input id="passwordCheck"
								style="margin-left: 50px" name="" type="password">
						</div>
						<div class="li_r" style="margin-top: 20px">
							<span>新密码:<input id="newPassword"
								style="margin-left: 50px" name="" type="password">
						</div>
						<div class="li_r" style="margin-top: 20px">
							<span>确认新密码:<input id="newPasswordCheck"
								style="margin-left: 15px" name="" type="password">
						</div>
						<div id="repeatingData"
							style="margin-left: 110px; margin-top: 8px; color: red">
							<span></span>
						</div>
						<div style="margin-left: 110px; margin-top: 18px">
							<button type="button"
								class="am-btn am-btn-default am-btn-secondary" onclick="check()">修改</button>
							<button style="margin-left: 40px" type="button"
								class="am-btn am-btn-default am-btn-danger"
								onclick="returnAgo()">返回</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<script>
			$(function() {
				load();
				CloseDiv('MyDiv', 'fade');
			});
			function load() {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/getUser',
					data : {
						username : "${user.username}"
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							$("#username").val(result.data.username);
							$("#integral").val(result.data.integral);
							$("#mobile").val(result.data.mobile);
							$("#address").val(result.data.address);
							$("#email").val(result.data.eMail);
						}
					}
				});
			}
			function update() {
				if ($("#mobile").val() == null || $("#mobile").val() == '') {
					$('#repeating').text("手机号不能为空！");
					return;
				}
				if ($("#address").val() == null || $("#address").val() == '') {
					$('#repeating').text("地址不能为空！");
					return;
				}
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/update',
							data : {
								username : "${user.username}",
								mobile : $("#mobile").val(),
								eMail : $("#email").val(),
								address : $("#address").val()
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("修改成功！");
									window.location.href = "personalData?username=${user.username}";
								} else {
									alert(result.msg);
								}
							}
						});
			}
			function myOrderItem() {
				window.location.href = "personalCenter?username=${user.username}";
			}
			function personalData() {
				window.location.href = "personalData?username=${user.username}";
			}
			function shoppingCart() {
				window.location.href = "shoppingCart?username=${user.username}";
			}
			function orderItems() {
				window.location.href = "orderManage?username=${user.username}";
			}
			//弹出隐藏层
			function ShowDiv(show_div, bg_div) {
				$('#userMsg').hide();
				document.getElementById(show_div).style.display = 'block';
				var bgdiv = document.getElementById(bg_div);
				$("#" + bg_div).height($(document).height());
			};
			//关闭弹出层
			function CloseDiv(show_div, bg_div) {
				document.getElementById(show_div).style.display = 'none';
			};
			function returnAgo() {
				CloseDiv('MyDiv', 'fade');
				$('#userMsg').show();
			}
			//修改密码
			function check() {
				if ($('#passwordCheck').val() == null
						|| $('#passwordCheck').val() == '') {
					$('#repeatingData').text("原密码不能为空！");
					return;
				}
				if ($('#newPassword').val() == null
						|| $('#newPassword').val() == '') {
					$('#repeatingData').text("新密码不能为空！");
					return;
				}
				if ($('#newPassword').val() != $('#newPasswordCheck').val()) {
					$('#repeatingData').text("新密码与确认密码不一致！");
					return;
				}
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/updatePassword',
							data : {
								username : "${user.username}",
								password : $('#passwordCheck').val(),
								newPassword : $('#newPassword').val()
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("密码修改成功,请重新登录！");
									window.location.href = 'login';
								} else {
									alert(result.msg);
								}
							}
						});
			}
		</script>
</body>
</html>
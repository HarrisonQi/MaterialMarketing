<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>客户服务</title>
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
					<div class="topMessage mini-cart">
						<div class="menu-hd">
							<a id="mc-menu-hd" href="usersControl?username=${user.username }"
								target="_top"><span>会员管理</span><span id="shoppingCartNum"></span></a>
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
						href="javascript:addMessage()" class="nav-link "> <span>投诉建议</span>
					</a></li>
					<c:choose>
						<c:when test="${user.isadmin==1}">
							<li class="tpl-left-nav-item"><a
								href="javascript:messageList()" class="nav-link "> <span>所有投诉</span>
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
				<div class="portlet-title">投诉建议</div>
				<div class="tpl-block" id="shoppingCartApiControllerDiv">
					<table id="table"
						class="am-table am-table-striped am-table-hover table-main">
						<span>请输入您对我们商品或服务的意见:</span>
						<br />
						<textarea id="messageText" style="margin-left: 0px" rows="5"
							cols="65"></textarea>
						<br />
						<br />
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary"
							style="margin-left: 445px" onclick="commit()">提交意见</button>
					</table>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			function commit() {
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/addmessage',
							data : {
								username : "${user.username}",
								message : $("#messageText").val(),
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("提交成功！");
									window.location.href = "customerService?username=${user.username}";
								} else {
									alert(result.msg);
								}
							}
						});
			}

			function addMessage() {
				window.location.href = "customerService?username=${user.username}";
			}
			function messageList() {
				window.location.href = "customerServiceList?username=${user.username}";
			}
		</script>
</body>
</html>
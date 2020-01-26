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
<title>会员管理</title>
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
		style="margin-top: 20px">
		<div class="">
			<div class="tpl-portlet-components">
				<div class="portlet-title">会员管理</div>
				<div id="addButtonDiv">
<!-- 					<button type="button" class="am-btn am-btn-default am-btn-success" -->
<!-- 						onclick="addGoods()">新增</button> -->
				</div>
				<div class="tpl-block" id="goodsDiv">
					<table id="table" style="margin-top: 10px"
						class="am-table am-table-striped am-table-hover table-main">
						<tr>
							<th style="width: 15%">会员用户名</th>
							<th style="width: 15%">密码</th>
							<th style="width: 10%">电话</th>
							<th style="width: 40%">地址</th>
							<th style="width: 10%">消费金额</th>
							<th style="width: 10%">操作</th>
						</tr>
					</table>
				</div>
				<div id="MyDiv" class="white_content">
					<div class="li_r" style="margin-top: 20px">
						<span>商品名称:</span><input id="addGoodsName"
							style="margin-left: 70px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品价格:</span><input id="addGoodsPrice"
							style="margin-left: 70px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品作者:</span><input id="addGoodsAuthor"
							style="margin-left: 70px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品介绍:</span>
						<textarea id="addGoodsIntroduce" style="margin-left: 70px"
							rows="5" cols="65"></textarea>
					</div>
					<div style="margin-left: 140px; margin-top: 18px">
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary" onclick="add()">新增</button>
						<button style="margin-left: 40px" type="button"
							class="am-btn am-btn-default am-btn-danger" onclick="returnAgo()">返回</button>
					</div>
				</div>
				<div id="updateDiv" class="white_content">
					<input id="updateGoodsID" type="hidden">
					<div class="li_r" style="margin-top: 20px">
						<span>商品名称:</span><input id="updateGoodsName"
							style="margin-left: 70px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品价格:</span><input id="updateGoodsPrice"
							style="margin-left: 70px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品来源:</span><input id="updateGoodsAuthor"
							style="margin-left: 68px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品介绍:</span>
						<textarea id="updateGoodsIntroduce" style="margin-left: 70px"
							rows="5" cols="65"></textarea>
					</div>
					<div style="margin-left: 140px; margin-top: 18px">
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary" onclick="update()">更新</button>
						<button style="margin-left: 40px" type="button"
							class="am-btn am-btn-default am-btn-danger" onclick="returnAgo()">返回</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				load();
				CloseDiv('MyDiv', 'fade');
				CloseDiv('updateDiv', 'fade');
			})
			function load() {
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/getAllUser',
							data : {
								username : "${user.username}"
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									for (var i = 0; i < result.data.length; i++) {
										item = "<tr><td>"
												+ result.data[i].username
												+ "</td><td>"
												+ result.data[i].password
												+ "</td><td>"
												+ result.data[i].mobile
												+ "</td><td>"
												+ result.data[i].address
												+ "</td><td>"
												+ result.data[i].totalPay
												+ "</td><td><a href='javascript:detele("
												+ result.data[i].username
												+ ")'>注销</a><br></td></tr>";
										$('#table').append(item);
									}
								} else {
									alert(result.msg);
								}
							}
						});
			}
			//删除数据
			function detele(username) {
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/user/deleteUser',
							data : {
								username : username
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("注销成功！");
									window.location.href = "usersControl?username=${user.username}";
								} else {
									alert(result.msg);
								}
							}
						});
			}
			//添加数据
			function addGoods() {
				ShowDiv('MyDiv', 'fade');
				CloseDiv('updateDiv', 'fade');
				$("#goodsDiv").hide();
				$("#addButtonDiv").hide();
			}
			function add() {
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/book/insert',
							data : {
								title : $("#addGoodsName").val(),
								price : parseInt($("#addGoodsPrice").val()),
								author : $("#addGoodsAuthor").val(),
								introduce : $("#addGoodsIntroduce").val(),
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("添加成功！");
									window.location.href = "bookControl?username=${user.username}";
								} else {
									alert(result.msg);
								}
							}
						});
			}
			function updateGoods(updateGoodsId) {
				ShowDiv('updateDiv', 'fade');
				CloseDiv('MyDiv', 'fade');
				$("#goodsDiv").hide();
				$("#addButtonDiv").hide();
				$("#updateGoodsID").val(parseInt(updateGoodsId));
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/book/getById',
					data : {
						id : parseInt(updateGoodsId)
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							$("#updateGoodsName").val(result.data.title);
							$("#updateGoodsPrice").val(result.data.price);
							$("#updateGoodsIntroduce").val(
									result.data.introduce);
							$("#updateGoodsAuthor").val(result.data.author);
						} else {
							alert(result.msg);
						}
					}
				});
			}
			function update() {
				$
						.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/book/update',
							data : {
								id : parseInt($("#updateGoodsID").val()),
								title : $("#updateGoodsName").val(),
								price : parseInt($("#updateGoodsPrice").val()),
								author : $("#updateGoodsAuthor").val(),
								introduce : $("#updateGoodsIntroduce").val(),
							},
							async : true,
							dataType : 'json',
							success : function(result) {
								if (result.code == 0) {
									alert("更新成功！");
									window.location.href = "bookControl?username=${user.username}";
								} else {
									alert(result.msg);
								}
							}
						});
			}

			function returnAgo() {
				CloseDiv('MyDiv', 'fade');
				CloseDiv('updateDiv', 'fade');
				$("#goodsDiv").show();
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
			}
		</script>
</body>
</html>
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
<title>订单配送管理</title>
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
				<div class="portlet-title">订单配送管理</div>
				<div class="tpl-block" id="myOrderItemDiv">
					<table id="table"
						class="am-table am-table-striped am-table-hover table-main">
						<tr>
							<th>订单编号</th>
							<th>商品名称</th>
							<th>商品总价</th>
							<th>商品数量</th>
							<th>发货者</th>
							<th>发货者联系方式</th>
							<th>发货地址</th>
							<th>收货者</th>
							<th>收货地址</th>
							<th>订单状态</th>
							<th>下单时间</th>
<!-- 							<th>操作</th> -->
						</tr>
					</table>
				</div>
				<div id="MyDiv" class="white_content">
					<input id="bookId" type="hidden"></input> <input
						id="orderItemNoEvaluate" type="hidden"></input> <input
						id="bookStatus" type="hidden"></input> <input id="bookTitle"
						type="hidden"></input>
					<div class="li_r" style="margin-top: 20px">
						好评度：<select name="select" id="grade" class="xla_k">
							<option value="1">1星</option>
							<option value="2">2星</option>
							<option value="3">3星</option>
							<option value="4">4星</option>
							<option value="5">5星</option>
						</select>
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>评价:<textarea id="discription" style="margin: 25px"
								rows="5" cols="65"></textarea>
					</div>
					<div id="repeatingData"
						style="margin-left: 110px; margin-top: 8px; color: red">
						<span></span>
					</div>
					<div style="margin-left: 110px; margin-top: 18px">
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary"
							onclick="submitEvaluate()">提交</button>
						<button style="margin-left: 40px" type="button"
							class="am-btn am-btn-default am-btn-danger" onclick="reset()">重置</button>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				load();
				CloseDiv('MyDiv','fade');
			});
			function myOrderItem() {
				window.location.href = "personalCenter?username=${user.username}";
			}
			function orderItems() {
				window.location.href = "orderManage?username=${user.username}";
			}
			function personalData() {
				window.location.href = "personalData?username=${user.username}";
			}
			function shoppingCart() {
				window.location.href = "shoppingCart?username=${user.username}";
			}
			function load() {
				if(${user.username == null} ){
					alert("您未登录，请登录后查看！");
					window.location.href = 'login';
					return ;
				}
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/orderItem/getAllOrderItem',
					data : {
						username : "${user.username}"
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							var status = '';
							for (var i = 0; i < result.data.length; i++) {
								if (result.data[i].orderItemStatus == 0) {
									status = '付款成功';
								}
								if (result.data[i].orderItemStatus == 1) {
									status = '已接收';
								}
								if (result.data[i].orderItemStatus == 2) {
									status = '已评价';
								}
								if (result.data[i].orderItemStatus == 3) {
									status = '退货';
								}
								item = "<tr><td>"
									 + result.data[i].orderItemNo
									 + "</td><td>"
									 + result.data[i].title
									 + "</td><td>"
									 + result.data[i].price
									 + "</td><td>"
									 + result.data[i].count
									 + "</td><td>"
									 + result.data[i].sender
									 + "</td><td>"
									 + result.data[i].sendMobile
									 + "</td><td>"
									 + result.data[i].sendAddress
									 + "</td><td>"
									 + result.data[i].receiver
									 + "</td><td>"
									 + result.data[i].receiveAddress
									 + "</td><td>"
									 + status
									 + "</td><td>"
									 + crtTimeFtt(result.data[i].createTime, i)
// 									 + "</td><td><a href='javascript:confirmReceipt("+result.data[i].orderItemNo+")'>确认收货</a><br><a href='javascript:evaluate("+result.data[i].bookId+","+result.data[i].orderItemNo+","+result.data[i].orderItemStatus+",\""+result.data[i].title+"\")'>评价</a><br><a href='javascript:salesReturn("+result.data[i].orderItemNo+")'>退货</a></td></tr>";
									 + "</td></tr>";
								$('#table').append(item);
							}
						} else {
							alert(result.msg);
					}
				}
			});
			}
			//申请退货
			function salesReturn(orderItemNo) {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/orderItem/salesReturn',
					data : {
						orderItemNo : parseInt(orderItemNo)
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							alert("申请成功");
							window.location.href = 'personalCenter?username=${user.username}';
							}
						else{
							alert(result.msg);
						}
					}
				});
			}
			//时间格式化
			function crtTimeFtt(val, row) {
				if (val != null) {
					var date = new Date(val);
					return date.getFullYear() + '-' + (date.getMonth() + 1)
							+ '-' + date.getDate() + '    ' + date.getHours()
							+ ':' + date.getMinutes() + ':' + date.getSeconds();
				}
			}
			//评价
			function evaluate(bookId, orderItemNo,bookStatus,title) {
				if(parseInt(bookStatus) < 1 ){
					alert("您未确认收货，请收到宝贝后再来评价！");
					return ;
				}
				ShowDiv('MyDiv','fade');
				$('#bookId').val(bookId);
				$('#orderItemNoEvaluate').val(orderItemNo);
				$('#bookTitle').val(title);
				$('#myOrderItemDiv').hide();
			}
			function reset(){
				$('#discription').val("");
				 $("#grade").find("option[value='1']").attr("selected",true);
			}
			function submitEvaluate(){
				 $.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/evaluate/insert',
					data : {
						bookId : $('#bookId').val(),
						username : "${user.username}",
						grade: $("#grade option:selected").val(),
						discription : $('#discription').val(),
						orderItemNo : parseInt($('#orderItemNoEvaluate').val()),
						title : $('#bookTitle').val(),
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							alert("提交成功");
							window.location.href = 'personalCenter?username=${user.username}';
							}
						else{
							alert(result.msg);
						}
					}
				}); 
			}
			//确认收货
			function confirmReceipt(orderItemNo){
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/orderItem/confirmReceipt',
					data : {
						orderItemNo : parseInt(orderItemNo)
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							alert("操作成功");
							window.location.href = 'personalCenter?username=${user.username}';
							}
						else{
							alert(result.msg);
						}
					}
				});
			}
			//弹出隐藏层
			function ShowDiv(show_div,bg_div){
				$('#userMsg').hide();
				document.getElementById(show_div).style.display='block';
				var bgdiv = document.getElementById(bg_div);
				$("#"+bg_div).height($(document).height());
			};
			//关闭弹出层
			function CloseDiv(show_div,bg_div){
				document.getElementById(show_div).style.display='none';
			};
		</script>
</body>
</html>
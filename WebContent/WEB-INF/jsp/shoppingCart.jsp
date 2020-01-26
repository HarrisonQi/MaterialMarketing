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
<title>用户管理</title>
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
				<div class="portlet-title">购物车</div>
				<div class="tpl-block" id="shoppingCartApiControllerDiv">
					<table id="table"
						class="am-table am-table-striped am-table-hover table-main">
						<tr>
							<th>商品名称</th>
							<th>商品单价</th>
							<th>数量</th>
							<th>商品总价</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
				<div id="MyDiv" class="white_content">
					<div class="li_r" style="margin-top: 20px">
						<span>商品名称:<input id="goodsNameBuy"
							style="margin-left: 70px" name="" type="text" disabled="disabled">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品单价:<input id="goodsPriceBuy"
							style="margin-left: 70px" name="" type="text" disabled="disabled">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>商品数量:<input id="countBuy" style="margin-left: 70px"
							name="" type="text" autoComplete='off'>
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>收货人地址:<input id="receiveAddress"
							style="margin-left: 55px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>收货人姓名:<input id="receiverBuy"
							style="margin-left: 55px" name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>收货人手机号:<input id="receiverMobile"
							style="margin-left: 40px" name="" type="text">
					</div>
					<div id="totalMoney"
						style="margin-left: 140px; margin-top: 10px; color: red; font-size: 20px">
						<span></span>
					</div>
					<div style="margin-left: 140px; margin-top: 18px">
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary"
							onclick="submitEvaluate()">支付</button>
						<button style="margin-left: 40px" type="button"
							class="am-btn am-btn-default am-btn-danger" onclick="returnAgo()">返回</button>
					</div>
				</div>
				<div id="payDiv" class="white_content">
					<div class="li_r" style="margin-top: 20px">
						<span>银行卡号:<input id="payNo" style="margin-left: 70px"
							name="" type="text">
					</div>
					<div class="li_r" style="margin-top: 20px">
						<span>支付密码:<input id="payPassword"
							style="margin-left: 70px" name="" type="password">
					</div>
					<div id="payHint"
						style="margin-left: 140px; margin-top: 10px; color: red; font-size: 20px">
						<span></span>
					</div>
					<div style="margin-left: 140px; margin-top: 18px">
						<button type="button"
							class="am-btn am-btn-default am-btn-secondary"
							onclick="payMoney()">支付</button>
						<button style="margin-left: 40px" type="button"
							class="am-btn am-btn-default am-btn-danger" onclick="returnAgo()">返回</button>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		var totals = 0;
		var goodsIDInsert = 0;
		var shoppingCartID =0;
		var buyBookCount = 0;
		$(function(){
			load();
			CloseDiv('MyDiv','fade');
			CloseDiv('payDiv','fade');
		})
		//加载数据
		function load() {
			if(${user.username == null} ){
				alert("您未登录，请登录后查看！");
				window.location.href = 'login';
				return ;
			}
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/shoppingCart/getByUsername',
				data : {
					username : "${user.username}"
				},
				async : true,
				dataType : 'json',
				success : function(result) {
					if (result.code == 0) {
						for (var i = 0; i < result.data.length; i++) {
							item = "<tr><td>"
								 + result.data[i].title
								 + "</td><td>"
								 + result.data[i].unitPrice
								 + "</td><td>"
								 + result.data[i].count
								 + "</td><td>"
								 + result.data[i].totalPrice
								 + "</td><td><a href='javascript:detele("+result.data[i].id+")'>删除</a><br><a href='javascript:buy(\""+result.data[i].title+"\","+result.data[i].unitPrice+","+result.data[i].count+","+result.data[i].bookId+","+result.data[i].id+")'>购买</a></td></tr>";
							$('#table').append(item);
						}
						}else {
						alert(result.msg);
				}
			}
		});
		}
		//删除购物车商品
		function detele(id){
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/shoppingCart/detele',
				data : {
					id : parseInt(id)
				},
				async : true,
				dataType : 'json',
				success : function(result) {
					if (result.code == 0) {
						alert("删除成功！");
						window.location.href = "shoppingCart?username=${user.username}";
						}else {
						alert(result.msg);
				}
			}
		});
		}
		//购买商品
		function buy(goodsName, goodsPrice, count, goodsId,cartId){
			var price = JSON.stringify(goodsPrice);
			var newCount = JSON.stringify(count);
			var goodsId = JSON.stringify(goodsId);
			var newId = JSON.stringify(cartId);
			$("#shoppingCartApiControllerDiv").hide();
			ShowDiv('MyDiv','fade');
			$('#goodsNameBuy').val(goodsName);
			$('#goodsPriceBuy').val(price);
			$('#countBuy').val(count); 
			$('#receiveAddress').val("${user.address}");
			$("#receiverBuy").val("${user.username}");
			$("#receiverMobile").val("${user.mobile}");
			var agoBookTatolPrice = parseInt(newCount) * parseInt(price);
			$('#totalMoney').text("共计:"+agoBookTatolPrice+"元");
			buyBookCount = parseInt(newCount);
			totals = agoBookTatolPrice
			$(function(){  
				$('#countBuy').bind('input propertychange', function() {  
					totals = price *  parseInt($('#countBuy').val());
					$('#totalMoney').text("共计:"+totals+"元");
					buyBookCount = parseInt($('#countBuy').val());
				});  
			})  
			goodsIDInsert = parseInt(goodsId);
			shoppingCartID = parseInt(newId);
		}
		//支付
		function submitEvaluate(){
			CloseDiv('MyDiv','fade');
			ShowDiv('payDiv','fade');
		}
		//输入银行卡帐号密码
		function payMoney(){
			if($("#payNo").val() == null || $("#payNo").val() ==''){
				$("#payHint").val("银行卡不能为空！");
				return;
			}
			if($("#payPassword").val() == null || $("#payPassword").val() ==''){
				$("#payHint").val("支付密码不能为空！");
				return;
			}
			if($('#payNo').val() == '123456' && $('#payPassword').val() == '123456'){
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/orderItem/insert',
					data : {
						title : $("#goodsNameBuy").val(),
						price : parseInt(totals),
						bookId : parseInt(goodsIDInsert),
						receiveAddress : $("#receiveAddress").val(),
						receiver : $("#receiverBuy").val(),
						receiverMobile : $("#receiverMobile").val(),
						username : "${user.username}",
						shoppingCartID : parseInt(shoppingCartID),
						count : parseInt(buyBookCount)
					},
					async : true,
					dataType : 'json',
					success : function(result) {
						if (result.code == 0) {
							alert("支付成功！");
							window.location.href = "shoppingCart?username=${user.username}";
							}else {
							alert(result.msg);
					}
				}
			});
			}else{
				alert("银行账号密码不正确！");
			}
		} 
		//返回
		function returnAgo(){
			CloseDiv('MyDiv','fade');
			CloseDiv('payDiv','fade');
			$('#shoppingCartApiControllerDiv').show();
		}
		function orderItems() {
			window.location.href = "orderManage?username=${user.username}";
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
		}
		</script>
</body>
</html>
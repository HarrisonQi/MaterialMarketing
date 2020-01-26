<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<link href="${pageContext.request.contextPath}/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/skin.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<!-- 引入百度图标框架 -->
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<style type="text/css">
.tpl-block a {
	display: block;
	width: 20%;
	float: left;
}

.tpl-block a img, .tpl-block a span {
	display: block;
	text-align: center;
}

.tpl-block a img {
	width: 128px;
	height: 128px;
	margin: 0 auto;
}

.tpl-block a span {
	font-size: 14px;
}
.contentbox {
	width: 1200px;
	margin: 0 auto;
	padding: 20px 0;
}
.position {
	padding-bottom: 10px;
	margin-bottom: 10px;
	border-bottom: 2px solid #2B2B2B;
}
.allbook .intwobox dl dd {
	height: 42px;
	overflow: hidden;
}
.intwobox dl dd {
	margin-top: 5px;
}
.twobox, .threebox, .fourbox {
	margin-top: 5px;
	background-color: #FFF;
	border-bottom: 1px solid #D8DDE0;
	padding: 20px;
	overflow: hidden;
}

.intwobox dl {
	float: left;
	margin-top: 10px;
	width: 145px;
	text-align: center;
}

.intwobox dl dd {
	margin-top: 5px;
}
</style>
</head>
<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
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
								<a id="mc-menu-hd" href="bookControl?username=${user.username }" target="_top"><span>商品管理</span><span
									id="shoppingCartNum"></span></a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd" href="usersControl?username=${user.username }" target="_top"><span>会员管理</span><span
									id="shoppingCartNum"></span></a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<!--悬浮搜索框-->
		<div class="nav white">
		<div style="float:left;margin-left:175px;margin-top:20px;height:50px">
			<select name="select" id="selectType"style="height:50px;font-size:15px;border:2px solid #F03726;border-right:0px white">
   				 <option value="0">全部</option>
				<option value="1">物料</option>
<!-- 				<option value="2">作者</option> -->
    		</select>
		</div>
		<div class="search-bar pr" >
				<form>
					<input id="searchInputDiv" type="text"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						onclick="search()" type="button">
				</form>
			</div>
		</div>
	</div>
	<div class="contentbox">
		<div id="recommendBookDiv" class="threebox">
			<h1 class="position fn-clear" >
				<em style="font-size:20px;font-weight:700">新品上市</em>
			</h1>
			<div class="allbook">
				<div class="intwobox blist_1 fn-clear">
					<c:forEach var="book" items="${recommendBook}">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}"
									style="text-decoration: none">
									<div
										style="width: 110px; height: 130px; margin-left: 18px; background: #5C89CD; text-aline: right">
										<hr
											style="height: 130px; width: 0px; color: #090F14; margin-left: 10px;">
										<div
											style="width: 90px; margin-left: 12px; margin-top: -120px;">
											<p style="color: white">${book.title }</p><br>
											<c:if test="${book.author != null }">
											<p style="color: white">${book.author }</p>
											</c:if>
										</div>
									</div>
								</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}">${book.title }</a><br>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}">￥${book.price }</a>
							</dd>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="threebox">
			<h1 class="position fn-clear">
				<em style="font-size:20px;font-weight:700">物料商品展示</em>
			</h1>
			<div class="allbook">
				<div class="intwobox blist_1 fn-clear">
					<c:forEach var="book" items="${bookList}">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}"
									style="text-decoration: none">
									<div
										style="width: 110px; height: 130px; margin-left: 18px; background: #5C89CD; text-aline: right">
										<hr
											style="height: 130px; width: 0px; color: #090F14; margin-left: 10px;">
										<div
											style="width: 90px; margin-left: 12px; margin-top: -120px;">
											<p style="color: white">${book.title }</p><br>
											<c:if test="${book.author != null }">
											<p style="color: white">${book.author }</p>
											</c:if>
										</div>
									</div>
								</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}">${book.title }</a><br>
								<a href="${pageContext.request.contextPath}/system/introduce?id=${book.id}&username=${user.username}">￥${book.price }</a>
							</dd>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
		</div>
		<!--菜单 -->
	<div class=tip>
		<div id="sidebar" style="padding-top: 80px">
			<div id="prof" class="item " style="padding-top: 40px">
				<div id="shopCart " class="item ">
					<div id="shopCart " class="item "">
						<a href="shoppingCart?username=${user.username}"
							style="height: 80px"><span
							style="color: white; writing-mode: tb-rl; height: 70px">购物车<span></a>
					</div>
				</div>
			</div>
			<div id="prof" class="item " style="padding-top: 40px">
				<div id="shopCart " class="item "">
					<a href="personalCenter?username=${user.username}"
						style="height: 80px"><span
						style="color: white; writing-mode: tb-rl; height: 70px">我的订单<span></a>
				</div>
			</div>
			<div id="prof" class="item " style="padding-top: 40px">
				<div id="shopCart " class="item "">
					<a href="customerService?username=${user.username}"
						style="height: 80px"><span
						style="color: white; writing-mode: tb-rl; height: 70px">客户服务<span></a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			if(GetQueryString("flag") != null){
				$("#recommendBookDiv").hide();
			}
		});
		function search(){
			window.location.href = "${pageContext.request.contextPath}/system/index?type="+jQuery("#selectType  option:selected").val()+"&key="+$("#searchInputDiv").val()+"&username=${user.username}&flag="+1;
		}
		function GetQueryString(name)
		{
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);
		     if(r!=null)return  unescape(r[2]); return null;
		}
	</script>
	
	
</body>
</html>
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
<link href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/demo.css"
	rel="stylesheet" type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/optstyle.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
<!-- 引入百度图标框架 -->
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<title>详情</title>
<style type="text/css">
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
		<!--悬浮搜索框-->
		<div class="nav white">
			<div class="search-bar pr"></div>
		</div>
		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">
				<div class="box">
					<div class=" tb-pic tb-s310">
						<div
							style="width: 300px; height: 400px; background: #5C89CD; margin-left: 90px">
							<hr
								style="height: 130px; width: 0px; color: #090F14; margin-left: 10px;">
							<div
								style="width: 398pxpx; height: 400px; text-align: center; margin-top: -120px;">
								<p style="color: white; font-size: 50px; margin-top: 70px">${book.title }</p>
								<br>
								<c:if test="${book.author != null }">
									<p style="color: white; font-size: 35px; margin-top: 40px">${book.author }</p>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfixRight">
				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<p style="font-size: 30px; font-weight: 600">${book.title }</p>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price"
						style="margin-top: 0px; height: 340px; float: left">
						<li class="price iteminfo_price">
							<dt style="font-size: 25px;">价格：</dt>
							<dd style="margin-top: 5px">
								<em style="font-size: 35px; margin-left: 10px">¥</em><b
									class="sys_item_price"
									style="font-size: 35px; margin-left: 5px">${book.price }</b>
							</dd>
						</li>
						<li class="price iteminfo_price" style="margin-top: 30px">
							<dt style="font-size: 25px;">介绍：</dt>
							<dd style="margin-top: 5px">
								<p style="margin-left: 20px; margin-top: 5px; color: black">${book.introduce }</p>
							</dd>
						</li>
						<li class="price iteminfo_price" style="margin-top: 30px">
							<dt style="font-size: 25px;">数量：</dt>
							<dd style="margin-top: 5px">
								<input id="buyCounts" style="width: 90px;" value="1"></input>
							</dd>
						</li>
						<div class="pay" style="margin-top: 30px">
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a href="javascript:buyForNow()">在线订购</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入购物车"
										href="javascript:insertShoppingCart()"><i></i>加入购物车</a>
								</div>
							</li>
						</div>
					</div>
					<div id="echart" class="tb-detail-price"
						style="margin-top: 0px; height: 340px;"></div>
				</div>
			</div>
		</div>
		<!-- introduce-->
		<div class="introduce" style="width: 900px; margin-left: 180px">
			<div class="introduceMain" style="margin-top: 40px">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li id="bookIntroduceLi"><a href="javascript:bookIntroduce()">
								<span class="index-needs-dt-txt">产品详情</span>
						</a></li>
						<li id="bookAllEvaluateLi"><a
							href="javascript:bookAllEvaluate()"> <span
								class="index-needs-dt-txt">全部评价</span></a></li>
					</ul>
					<div class="am-tabs-bd">
						<div id="bookIntroduceDiv"
							class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">
								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;图书类</li>
									<li title="">生产商:&nbsp;XXX生产商</li>
									<li title="">产地:&nbsp;广东</li>
									<li title="">产品标准号:&nbsp;GB/T 22165</li>
									<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
								</ul>
								<div class="clear"></div>
							</div>
						</div>
						<div id="bookAllEvaluateDiv" style="text-align: left"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
		$(function() {
			$("#bookIntroduceLi").css("border-top","2px solid red");
		});
		function returnAgo() {
			window.location.href = "forum?username=${user.username}"
		}
		//查看评论
		function bookAllEvaluate() {
			$("#bookIntroduceDiv").hide();
			$("#bookIntroduceLi").css("border-top","2px solid #F5F5F5");
			$("#bookAllEvaluateLi").css("border-top","2px solid red");
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/evaluate/getByBookId',
				data : {
					bookId : ${book.id}
				},
				async : true,
				dataType : 'json',
				success : function(result) {
					var item="";
					if (result.code == 0) {
						for(var i = 0; i < result.data.length; i++){
							if( result.data.length > 0){
							item = "<div style='margin-top:20px;'>"
							     + "<span style='font-size: 15px; font-weight: 700'>买家："+result.data[i].username+"</span>"
								 + "<span style='font-size: 15px;font-weight: 700;margin-left:20px'>评价等级："+result.data[i].grade+"星</span>"
								 + "</div><div style='margin-left:15px;margin-top:5px;'>"
								 + "<span style='font-size: 15px; font-weight: 500'>"+result.data[i].discription+"</span>"
								 + "</div><br><hr>";
							$('#bookAllEvaluateDiv').append(item);
							}else{
								item ="<span>暂无评价！</span>";
								$('#bookAllEvaluateDiv').append(item);
							}
						}    
					} else {
						alert(result.msg);
					}
				}
			}); 
		}
		//立即购买
		function buyForNow(){
			if(${user.username == null} ){
				alert("您未登录，请登录后操作！");
				window.location.href = 'login';
				return ;
			}
			window.location.href = "payNow?username=${user.username}&bookId=${book.id}&count="+$('#buyCounts').val();
		}
		//添加到购物车
		function insertShoppingCart(){
			if(${user.username == null} ){
				alert("您未登录，请登录后操作！");
				window.location.href = 'login';
				return ;
			}
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/shoppingCart/insert',
				data : {
					title : "${book.title}",
					unitPrice : ${book.price},
					count :  parseInt($("#buyCounts").val()),
					username : "${user.username}",
					bookId : ${book.id}
				},
				async : true,
				dataType : 'json',
				success : function(result) {
					if (result.code == 0) {
						alert("添加成功！");
						window.location.href = "index?username=${user.username}";
					} else {
						alert(result.msg);
					}
				}
			});
		}
		//查看详情
		function bookIntroduce(){
			$("#bookIntroduceDiv").show();
		    $("#bookIntroduceLi").css("border-top","2px solid red");
		    $("#bookAllEvaluateLi").css("border-top","2px solid #F5F5F5");
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
		
		
		
		
	</script>

	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart'));

        // 指定图表的配置项和数据
        var option =  {
        	    title: {
        	        text: '价格走势',
//         	        subtext: '纯属虚构'
        	    },
        	    tooltip: {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross',
        	            label: {
        	                backgroundColor: '#283b56'
        	            }
        	        }
        	    },
        	    legend: {
        	        data:['最新成交价', '销量']
        	    },
        	    toolbox: {
        	        show: true,
        	        feature: {
        	            dataView: {readOnly: false},
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    },
        	    dataZoom: {
        	        show: false,
        	        start: 0,
        	        end: 100
        	    },
        	    xAxis: [
        	        {
        	            type: 'category',
        	            boundaryGap: true,
        	            data: (function (){
        	                var now = new Date();
        	                var res = [];
        	                var len = 10;
        	                while (len--) {
        	                    res.unshift(now.toLocaleDateString().replace(/^\D*/,''));
        	                    now = new Date(now - 86400000);
        	                }
        	                return res;
        	            })()
        	        },
        	        {
        	            type: 'category',
        	            boundaryGap: true,
        	            data: (function (){
        	                var res = [];
        	                var len = 10;
        	                while (len--) {
        	                    res.push(len + 1);
        	                }
        	                return res;
        	            })()
        	        }
        	    ],
        	    yAxis: [
        	        {
        	            type: 'value',
        	            scale: true,
        	            name: '价格',
        	            max: 30,
        	            min: 0,
        	            boundaryGap: [0.2, 0.2]
        	        },
        	        {
        	            type: 'value',
        	            scale: true,
        	            name: '销量',
        	            max: 1200,
        	            min: 0,
        	            boundaryGap: [0.2, 0.2]
        	        }
        	    ],
        	    series: [
        	        {
        	            name:'销量',
        	            type:'bar',
        	            xAxisIndex: 1,
        	            yAxisIndex: 1,
        	            data:(function (){
        	                var res = [];
        	                var len = 10;
        	                while (len--) {
        	                    res.push(Math.round(Math.random() * 1000));
        	                }
        	                return res;
        	            })()
        	        },
        	        {
        	            name:'最新成交价',
        	            type:'line',
        	            data:(function (){
        	                var res = [];
        	                var len = 0;
        	                while (len < 10) {
        	                    res.push((Math.random()*10 + 5).toFixed(1) - 0);
        	                    len++;
        	                }
        	                return res;
        	            })()
        	        }
        	    ]
        	};


        	    myChart.setOption(option);
    </script>

</body>
</html>
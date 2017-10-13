<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>云购物商城-所有分类</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/base.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/front/css/index_style.css" />
 
</head>
<body>
<header id="pc-header">

      <div class="bg_color">
		<div class="top_center">
			<div class="left">
				<span class="wel"> 欢迎来到靓淘！ </span>
			</div>
			<div class="right">
				<ul>
					<c:if test="${user==null}">
						<li><a class="login" href="/Cart/user/logout.shtml"
							target="_blank">请登录</a></li>
						<li><a href="/Cart/user/add.shtml" target="_blank">快速注册</a></li>
					</c:if>
					<c:if test="${user!=null}">
						<li>${user.username}</li>
					</c:if>
					<li><a class="collect" href="">我的收藏</a></li>
					<li><a class="indent" href="">我的订单</a></li>
					<li><a class="phone" href="">手机靓淘</a></li>
					<li><a href="">我的积分</a></li>
					<li><a href="">我的评价</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="pc-header-logo clearfix">
		<div class="pc-fl-logo fl">
			<img class="logo_img" src="${pageContext.request.contextPath}/resources/front/img/img/LOGO.png" />
		</div>
		
		<div class="head-form fl">
			<form class="clearfix">
				<input class="search-text" accesskey="" id="key" autocomplete="off" placeholder="洗衣机" type="text">
				<button class="button" onclick="search('key');return false;">搜索</button>
			</form>
			<div class="words-text clearfix">
			
			<a href="" style="color: pink;">保湿 | </a>
				<a href="">面膜 | </a>
				<a href="">洗面奶 | </a>
				<a href="">补水 | </a>
				<a href="">香水 | </a>
				<a href="">眼霜 | </a>
				<a href="">口红 | </a>
				<a href="">护肤套装 | </a>
				<a href="">BB霜 | </a>
			</div>
		</div>
		<div class="fr pc-head-car">
			<i class="icon-car"></i>
			<a href="#">我的购物车</a>
			<em>10</em>
		</div>
	</div>
	
	<!--  顶部    start-->
	<div class="yHeader"style="background-color: black;">
		<!-- 导航   start  -->
		<div class="menu" >
			<ul class="yMenuIndex" style="margin-left:0;background-color: black;">
				<li><a class="current" href=""> 商城首页 </a></li>
				<li><a href=""> 美妆商城 </a></li>
				<li><a href=""> 服装运动 </a></li>
				<li><a href=""> 家电数码 </a></li>
				<li><a href=""> 家装家纺 </a></li>
				<li><a href=""> 淘遍美食 </a></li>
				<li><a href=""> 国际轻奢 </a></li>
			</ul>
		</div>
	</div>
</header>


	<div class="center" style="background: #fff;">
		<div style="padding: 20px">
			<div class="containers clearfix">
				<div class="pc-nav-item fl">
					<a href="#" class="pc-title">首页</a> &gt;<a href="#"> 所有货架</a>
				</div>
				<div class="fr" style="padding-top: 20px;">
					<a href="#" class="reds">所有品牌&gt;</a>
				</div>
			</div>
			<div class="containers">
				<div>
					<div class="pc-nav-title">
						<h3>手机数码</h3>
					</div>
					<div class="pc-nav-digit clearfix">
						<ul>
							<c:forEach var="productall" items="${productall}">
								<li>
									<div class="digit1">
										<a href=""><img src="${productall.fulUrl}"
											width="100%"></a>
									</div>
									<br>
									<div class="digit2">
										<a
											href="/Cart/productType/selectByid.shtml?id=${productall.id}">${productall.name}</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div style="height:100px"></div>
<script type="text/javascript">
    //hover 触发两个事件，鼠标移上去和移走
    //mousehover 只触发移上去事件
    $(".top-nav ul li").hover(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $(this).find("li .nav a").addClass("hover");
        $(this).find(".con").show();
    },function(){
        //$(this).css("background-color","#f5f5f5");
        $(this).find(".con").hide();
        //$(this).find(".nav a").removeClass("hover");
        $(this).removeClass("hover");
        $(this).find(".nav a").removeClass("hover");
    })
</script>
</body>
</html>
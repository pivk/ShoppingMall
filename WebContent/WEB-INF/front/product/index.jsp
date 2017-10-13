<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>靓淘网</title>
<link rel="stylesheet" href="${ctx}/resources/front/css/index_style.css" />
</head>
<body>
	<!-----------------------1.top-------------------->
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
	
	<!-----------------------2.logo-------------------->
	<div class="logo_center">
		<div class="left">
			<img class="logo_img" src="${ctx}/resources/front/img/img/LOGO.png" />
		</div>
		<div class="center">
			<form action="/Cart/productType/product_detail.shtml">
				<input class="btn1" type="text"  name="name" placeholder="华为手机" />
				 <input class="btn2" type="submit" value="搜索" />
			</form>
			<ul class="nav">
				<li><a href="" style="color: pink;">保湿 | </a></li>
				<li><a href="">面膜 | </a></li>
				<li><a href="">洗面奶 | </a></li>
				<li><a href="">补水 | </a></li>
				<li><a href="">香水 | </a></li>
				<li><a href="">眼霜 | </a></li>
				<li><a href="">口红 | </a></li>
				<li><a href="">护肤套装 | </a></li>
				<li><a href="">BB霜 | </a></li>
			</ul>
		</div>
		<div class="right">
			<div class="car">
				<a class="car_pic" href="/Cart/Cart/turn.shtml" target="_blank">去购物车结算</a>
			</div>
			<div class="narrow"></div>
		</div>
	</div>
	<!-----------------------3.导航栏-------------------->
	<div class="big_menu">
		<div class="menu">
			<ul class="menu_ul">
				<li><a class="current" href=""> 商城首页 </a></li>
				<li><a href=""> 美妆商城 </a></li>
				<li><a href=""> 服装运动 </a></li>
				<li><a href=""> 家电数码 </a></li>
				<li><a href=""> 家装家纺 </a></li>
				<li><a href=""> 淘遍美食 </a></li>
				<li><a href=""> 国际轻奢 </a></li>
				<div class="clearfix"></div>
			</ul>
		</div>
	</div>
	
	
	<!-----------------------4.广告区-------------------->
	<div class="banner_box">
		<img class="banner" src="${ctx}/resources/front/img/img/tu9.png" /> <img
			class="banner" src="${ctx}/resources/front/img/img/tu10.png" /> <img
			class="banner" src="${ctx}/resources/front/img/img/tu11.png" /> <img
			class="banner" src="${ctx}/resources/front/img/img/tu8.png" />
		<div class="banner_center">
			<div class="nav_left">
				<c:forEach var="r1" items="${type}">
					<c:if test="${r1.parent_id==0}">
						<span>  ${r1.name}  </span>
					</c:if>
					<c:forEach var="r2" items="${type}">
						<c:if test="${r1.id==r2.parent_id}">
							<p>
								<a href="/Cart/productType/productAll.shtml?id=${r2.id}">${r2.name}</a>
							<p>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			<div class="nav_right">
				<div class="nav_top">
					<img src="${ctx}/resources/front/img/img/vip.png" />
					<p>主人好！欢迎来逛靓淘~</p>
				</div>
				<div class="nav_down">
					<h2>包治百病</h2>
					<h3>17新款汇</h3>
					<img src="${ctx}/resources/front/img/img/bag.png" />
				</div>
			</div>
		</div>
		<ul class="circle">
			<li class="current"></li>
		
		</ul>
		<div class="left_fix">
			<a class="fix_a"> 购<br /> 物<br /> 车
			</a>
			<div
				style="background-image: url(${ctx}/resources/front/img/img/heart2.png); background-repeat: no-repeat; background-position: center 0;">

			</div>
			<div
				style="background-image: url(${ctx}/resources/front/img/img/shoucang.png); background-repeat: no-repeat; background-position: center 0;">

			</div>
			<div
				style="background-image: url(${ctx}/resources/front/img/img/time.png); background-repeat: no-repeat; background-position: center 0;">

			</div>
			<div
				style="background-image: url(${ctx}/resources/front/img/img/advice.png); background-repeat: no-repeat; border-bottom: 1px solid gray; background-position: center 0; ">

			</div>
			<div
				style="background-image: url(${ctx}/resources/front/img/img/top.png);background-repeat: no-repeat; background-position: center 10%;
					height: 50px;color: white;float: left; padding-top: 20px; text-align: center; ">
				TOP</div>
		</div>
	</div>
	<!-----------------------5.品牌选择区-------------------->
	<div class="select_Brand">
		<div class="select_title">
			<ul>
				<li>推荐品牌</li>
				<li>独家品牌</li>
				<li>欧美品牌</li>
				<li>国货品牌</li>
			</ul>
			<img class="brand_nav" src="${ctx}/resources/front/img/img/43.png" />
		</div>
		<div class="brand">
			<div class="left">
				<img src="${ctx}/resources/front/img/img/41.png" />
			</div>
			<div class="brand_bottom_right">

				<div
					style="background-image: url(${ctx}/resources/front/img/img/1.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>美加净</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/2.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>李医生</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/3.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>自然堂</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/4.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>佳洁士</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/32.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>镖旗男装</p>
				</div>


				<div
					style="background-image: url(${ctx}/resources/front/img/img/33.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>艺元素</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/5.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>泊美</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/6.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>赤道</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/7.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>欧珀莱</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/8.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>玉兰油</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/9.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>丁家宜</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/11.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>露得清</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/12.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>宝洁</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/35.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>波斯兰迪</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/14.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>水芝澳</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/51.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>傲慢季节</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/47.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>丹菲诗</p>
				</div>

				<div
					style="background-image: url(${ctx}/resources/front/img/img/38.png); background-repeat: no-repeat; background-position: center center;color: #808080; text-align: center; ">
					<p>奥利斯</p>
				</div>

			</div>
		</div>
	</div>

	<!-----------------------8.广告条-------------------->

	<!-----------------------9.靓淘服装区-------------------->
	<div class="cloth">
		<div class="c_title">
			<ul>
				<li style="font-size: 16px;">靓淘服饰</li>
				<li class="hot_li">&nbsp;&nbsp;&nbsp;热门搜索：</li>
				<li><a href="">卫衣 |</a></li>
				<li><a href="">风衣 |</a></li>
				<li><a href="">连衣裙 |</a></li>
				<li><a href="">阔腿裤 |</a></li>
				<li><a href="">小脚裤 |</a></li>
				<li><a href="">牛仔裤 |</a></li>
				<a class="all_a"> 查看全部&nbsp;&gt; </a>
			</ul>
		</div>
		<div class="left">
			<p class="bb_p">大牌新品折扣&nbsp;&gt;</p>
			<div class="pink_box">
				<p class="c_p1">牛仔裤潮流趋势</p>
				<p class="c_p2">女装春夏新品5折</p>
			</div>
		</div>
		<div class="right">
			<div class="big">
				<h1
					style="font-size: 20px; margin-top: 18px; margin-left: 20px; color: rgb(51, 51, 51);">
					条纹套装新品首发</h1>
				<h3 style="color: #808080; margin-top: 10px; margin-left: 20px;">
					立即预约享好礼</h3>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					夏季新品 预约爆款</h6>
				<p style="margin-top: 60px; margin-left: 25px;">
					<a
						style="padding: 5px 10px 5px 10px; border: 1px solid rgb(51, 51, 51); color: rgb(51, 51, 51);"
						href=""> 立即查看 </a>
				</p>
			</div>
			<div class="small1">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					雪纺当道</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					一看百变雪纺风采</h6>
			</div>
			<div class="small2">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					帅气黑色连体裤</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					精致细节利落休闲</h6>
			</div>
			<div class="small5">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					Amii工作装</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					百搭显瘦实穿时尚</h6>
			</div>
			<div class="small6">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					初夏时尚T恤</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					新潮出众</h6>
			</div>
			<div class="small3">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					早春时尚新条纹</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					春季新款条纹尖货</h6>
			</div>
			<div class="small4">
				<h2
					style="font-size: 16px; margin-top: 15px; margin-left: 20px; color: rgb(51, 51, 51);">
					春夏型牛仔衬衫</h2>
				<h6
					style="color: rgb(249, 130, 155); margin-left: 20px; margin-top: 5px;">
					OL的完美新姿</h6>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>

	<script type="text/javascript">
		var m = 0;
		$(".banner_box .banner").hide().eq(0).show();
		function changeImg() {
			if (m < 3) {
				m = m + 1
			} else {
				m = 0
			}
			$(".circle li").removeClass("current").eq(m).addClass("current");
			$(".banner_box .banner").hide().eq(m).show();
		}
		t = setInterval(changeImg, 1000);
		$(".banner_box").mouseenter(function() {
			clearInterval(t);
		}).mouseleave(function() {
			t = setInterval(changeImg, 1000);
		})
		$(".circle li").click(function() {
			m = $(this).index();
			$(".circle li").removeClass("current").eq(m).addClass("current");
			$(".banner_box .banner").hide().eq(m).show();
		})

		$(".banner_box .banner").hide().eq(0).show();
		$(".circle li").click(function() {
			var i = 0;
			i = $(this).index();
			$(".banner_box .banner").hide().eq(i).show();

		})
		$(".circle li").click(function() {
			var n = 0;
			n = $(this).index();
			$(".circle li").removeClass("current").eq(n).addClass("current");
		})
	</script>
</body>

</html>
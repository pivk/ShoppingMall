<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../common/head.jsp"%>

<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="renderer" content="webkit">
<title>确认订单-云购物商城</title>
<link rel="shortcut icon" type="image/x-icon"
	href="img/icon/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/front/css/base.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/front/css/home.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/front/css/car/base.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/front/css/car/home.css">

</head>
<body>
	<%@include file="./shipping.jsp"%>
	<div id="checkoutPayment">
		<!-- 支付方式 -->

		<form action="${pageContext.request.contextPath}/Order/addoder.action" method="post">
			<input type="hidden" name="shipping_id" value="${shipping.id}">
			<div class="xm-box">
				<div class="box-hd ">
					<h2 class="title">支付方式</h2>
				</div>
				<div class="box-bd">
					<ul id="checkoutPaymentList"
						class="checkout-option-list clearfix J_optionList">
							<input type="radio" name="payment_type" checked="checked" value="1" >在线支付
						  	<input type="radio" name="payment_type" checked="checked" value="0">线下支付
					</ul>
				</div>
			</div>
			<!-- 支付方式 END-->

			<div class="xm-box">
				<div class="box-hd ">
					<h2 class="title">配送方式</h2>
				</div>
				<div class="box-bd">
					<ul id="checkoutShipmentList"
						class="checkout-option-list clearfix J_optionList">
						
						<input type="radio" data-price="0" hecked="checked" value="1">
								快递配送（免运费） <span></span>
							
					</ul>
				</div>
			</div>
			<!-- 配送方式 END-->
			<!-- 配送方式 END-->
	</div>
	</div>


	<div class="checkout-box-ft">
		<!-- 商品清单 -->
		<div id="checkoutGoodsList" class="checkout-goods-box">
			<div class="xm-box">
				<div class="box-hd">
					<h2 class="title">确认订单信息</h2>
				</div>
				<div class="box-bd">
					<dl class="checkout-goods-list">
						<dt class="clearfix">
							<span class="col col-1">商品名称</span> <span class="col col-2">购买价格</span>
							<span class="col col-3">购买数量</span> <span class="col col-4">小计（元）</span>
						</dt>
						<c:forEach items="${buyCartVO.items}" var="cartItemVO">
							<dd class="item clearfix">
								<div class="item-row">
									<div class="col col-1">
										<div class="g-pic">
											<img src="${cartItemVO.product.fulUrl}" width="40"
												height="40" />
										</div>
										<div class="g-info">
											<a href="#" target="_blank"> ${cartItemVO.product.name} </a>
										</div>
									</div>

									<div class="col col-2">${cartItemVO.product.price}元</div>
									<div class="col col-3">${cartItemVO.amount}</div>
									<div class="col col-4">${cartItemVO.amount*cartItemVO.product.price}元</div>
								</div>
							</dd>
												</c:forEach>
							
					</dl>


					<div class="checkout-count clearfix">

						<!-- checkout-count-extend -->
						<div class="checkout-price">

							<p class="checkout-total">
								应付总额：${buyCartVO.totalPrice}<span><strong id="totalPrice"></strong>元</span>
							</p>
						</div>
						<!--  -->
						<!-- 商品清单 END -->

					</div>
				</div>
			</div>
		</div>


	</div>
	<input type="hidden" name="payment" value="${buyCartVO.totalPrice}">
				<div class="checkout-confirm">

					<a href="#" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
					<button type="submit" class="btn btn-primary">
						立即下单</a>
				</div>
				</form>

			<script src="js/base.min.js"></script>

			<script type="text/javascript" src="js/address_all.js"></script>
			<script type="text/javascript" src="js/checkout.min.js"></script>
		</div>
		<!--收货地址body部分结束-->
	</div>



	<div style="height: 100px"></div>

	<footer>
		<div class="pc-footer-top">
			<div class="center">
				<ul class="clearfix">
					<li><span>关于我们</span> <a href="#">关于我们</a> <a href="#">诚聘英才</a>
						<a href="#">用户服务协议</a> <a href="#">网站服务条款</a> <a href="#">联系我们</a>
					</li>
					<li class="lw"><span>购物指南</span> <a href="#">新手上路</a> <a
						href="#">订单查询</a> <a href="#">会员介绍</a> <a href="#">网站服务条款</a> <a
						href="#">帮助中心</a></li>
					<li class="lw"><span>消费者保障</span> <a href="#">人工验货</a> <a
						href="#">退货退款政策</a> <a href="#">运费补贴卡</a> <a href="#">无忧售后</a> <a
						href="#">先行赔付</a></li>
					<li class="lw"><span>商务合作</span> <a href="#">人工验货</a> <a
						href="#">退货退款政策</a> <a href="#">运费补贴卡</a> <a href="#">无忧售后</a> <a
						href="#">先行赔付</a></li>
					<li class="lss"><span>下载手机版</span>
						<div class="clearfix lss-pa">
							<div class="fl lss-img">
								<img src="img/icon/code.png" alt="">
							</div>
							<div class="fl" style="padding-left: 20px">
								<h4>扫描下载云购APP</h4>
								<p>把优惠握在手心</p>
								<P>把潮流带在身边</P>
								<P></P>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="pc-footer-lin">
				<div class="center">
					<p>友情链接： 卡宝宝信用卡 梦芭莎网上购物 手游交易平台 法律咨询 深圳地图 P2P网贷导航 名鞋库 万表网 叮当音乐网
						114票务网 儿歌视频大全</p>
					<p>京ICP证1900075号 京ICP备20051110号-5 京公网安备110104734773474323
						统一社会信用代码 91113443434371298269B 食品流通许可证SP1101435445645645640352397
					</p>
					<p style="padding-bottom: 30px">版物经营许可证 新出发京零字第朝160018号
						Copyright©2011-2015 版权所有 ZHE800.COM</p>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		//hover 触发两个事件，鼠标移上去和移走
		//mousehover 只触发移上去事件
		$(".top-nav ul li").hover(function() {
			$(this).addClass("hover").siblings().removeClass("hover");
			$(this).find("li .nav a").addClass("hover");
			$(this).find(".con").show();
		}, function() {
			//$(this).css("background-color","#f5f5f5");
			$(this).find(".con").hide();
			//$(this).find(".nav a").removeClass("hover");
			$(this).removeClass("hover");
			$(this).find(".nav a").removeClass("hover");
		})
	</script>


</body>
</html>
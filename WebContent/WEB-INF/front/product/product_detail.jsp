<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品详情</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/resources/front/css/detail_style.css" />
	</head>

	<body>
	 <c:import url="../common/top.jsp"></c:import>
		<div class="menu">
			<div class="menu_center">
				<ul class="menu_ul">
					<li>
						<a class="all_a" href="">全部商品分类</a>
					</li>
					<li>
						<a href="index.html" target="_blank">商城首页</a>
					</li>
					<li>
						<a href="">手机首页</a>
					</li>
					<li>
						<a href="">新机首发</a>
					</li>
					<li>
						<a href="">手机社区</a>
					</li>
					<li>
						<a href="">企业采购</a>
					</li>
			
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
		
		<!--订单插入  -->
		<form  method="post" id="form">
		<input type="hidden" name="user_id" value="${sessionScope.user.id}">
		<input type="hidden" name="product_id" value="${product.id}">
		<input type="hidden" name="total_price" value="${product.price*product.stock}">
		<div class="little_menu_bg">
			<div class="little_menu">
				<ul>
					<li class="little_menu_left">
						&nbsp;&nbsp;&nbsp;&nbsp;${product.productType.productType.name}&nbsp;&gt;&nbsp;&nbsp;${product.productType.name}&nbsp;&gt;&nbsp;&nbsp;
				${product.name}
					</li>
				
					<li class="little_menu_bottom">
						<img src="${ctx}/resources/front/img/img/shoucang2.png" /> 联系供应商
					</li>
				</ul>
			</div>
		</div>
		<div class="banner_center">
			<div class="left">
				<ul>
					<li class="banner_center_left_top">
						<img src="/pic/${product.main_image}" />
					</li>
					<li class="banner_center_left_center">
						<ul>
							<li class="left_right_nav">
							<img src="${ctx}/resources/front/img/img/left.png" />	
						    </li>
						    <c:forEach var="r" items="${product.sub_images}">
						    	<li class="small_shop">
								<img src="r">
								</li>
						    </c:forEach>
			  				<li class="left_right_nav">
								<img src="${ctx}/resources/front/img/img/right.png" />
							</li>
							
						</ul>
					</li>
					<li class="banner_center_left_bottom">
						<img src="${ctx}/resources/front/img/img/xin.png" />&nbsp;关注&nbsp;&nbsp;
						<img src="${ctx}/resources/front/img/img/enjoy.png" />&nbsp;分享&nbsp;&nbsp;
						<img src="${ctx}/resources/front/img/img/duizhao.png" />&nbsp;对比
					</li>
				</ul>				
			</div>
			<div class="right" style="margin-left: -5px">
				<ul>
					<li class="right_1">
						<span class="title">	
							${product.name}
						</span><br />
						<span class="next_title">
							${product.subtitle}
						</span>
						<div class="clear" style="clear: both"></div>
					</li>
					<li class="right_2">
						<ul>
							<li class="right_2_1">
								<img class="img_117" src="${ctx}/resources/front/img/img/117.png" />
								<span class="right_2_1_span">
									&nbsp;&nbsp;&nbsp;全靓淘实物商品通用
								</span>
							</li>
							<li class="right_2_2">
								<span class="right_2_2_span">
									去挂券
								</span>
								<img src="${ctx}/resources/front/img/img/120.png" />
							</li>
							<li class="right_2_3">
								<span class="right_2_3_span">
									促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<span>
									¥ ${product.price}&nbsp;&nbsp;
								</span>
								<span>
									<del>¥ 1999</del>
								</span>
							</li>
							<li class="right_2_4">
								<span class="right_2_4_span">
									支&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;持&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<img src="${ctx}/resources/front/img/img/119.png" />&nbsp;&nbsp;
								<img src="${ctx}/resources/front/img/img/118.png" />
							</li>
							<li class="right_2_5">
								<span class="right_2_5_span">
									本店活动&nbsp;&nbsp;&nbsp;&nbsp;
								</span>
								<span class="right_2_5_span_2">
									满79元，包邮
								</span>
							</li>
							<li class="right_2_6">
								<span class="right_2_6_span">
									更多优惠
								</span>
								<img src="${ctx}/resources/front/img/img/xia.png" />
							</li>
						</ul>
					</li>
					<li class="right_3">
						<span>
									运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费&nbsp;&nbsp;&nbsp;&nbsp;
									广东	深圳&nbsp;至&nbsp;青岛&nbsp;&nbsp;&nbsp;
									<img src="${ctx}/resources/front/img/img/xia.png"/>&nbsp;
									市南区&nbsp;
									<img src="${ctx}/resources/front/img/img/xia.png"/>&nbsp;
									香港中路街道&nbsp;
									<img src="${ctx}/resources/front/img/img/xia.png"/>&nbsp;
									快递：0.00
							</span>

					</li>
					<li class="right_4">
						<ul>
							<li>
								<span class="right_4_1">
									选择颜色
								</span>
								<span class="right_4_2">
									金色
								</span>
								<span class="right_4_3">
									银色
								</span>
								<span class="right_4_4">
									粉色
								</span>
							</li>
							<li class="vision">
								<span class="right_4_1">
									选择版本
								</span>
								<span class="right_4_5">
									普通版
								</span>
								<span class="right_4_6">
									移动定制版
								</span>
							</li>
							<li class="buy_way">
								<span class="right_4_1">
									购买方式
								</span>
								<span class="right_4_7">
									官方标配
								</span>
							</li>
							<li class="safeguard">
								<span class="right_4_1">
									增值保障
								</span>
								<span class="right_4_8">
									屏碎保1年&nbsp;¥66&nbsp;
									<img src="${ctx}/resources/front/img/img/111.png"/>
								</span>
								<span class="right_4_9">
									1年内换新&nbsp;¥86&nbsp;
									<img src="${ctx}/resources/front/img/img/111.png"/>
								</span>
								<span class="right_4_10">
									屏碎保2年&nbsp;¥96&nbsp;
									<img src="${ctx}/resources/front/img/img/111.png"/>
								</span>
							</li>
						</ul>
					</li>
					<li class="right_bottom">
						<span class="right_txt">
							数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
						<input class="right_bottom_text" type="text" id="num" name="quantity" value="1" />
						<ul class="right_bottom_btn">
							<li>
								<input class="right_bottom_substract" type="button" id="sub" value="-" />
								<input class="right_bottom_add" type="button" id="add" value="+" />
							</li>
						</ul>
						库存： ${product.stock}
						
						<input class="right_bottom_addCar" id="car" type="button" value="加入购物车"   />
						<input class="right_bottom_addCar" id="buy" type="button" value="立即购买" />
						
						<span class="right_txt_bottom">
							温馨提示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;·支持7天无理由退货
						</span>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		</form>
		
		<div class="add">
			<div class="add_title">
				<ul class="add_title_ul">
					<li>
						<a class="current" href="">人气配件</a>
					</li>
					<li>
						<a href="">手机贴膜</a>
					</li>
					<li>
						<a href="">手机保护套</a>
					</li>
					<li>
						<a href="">数据线</a>
					</li>
					<li>
						<a href="">充电器</a>
					</li>
					<li>
						<a href="">移动电源</a>
					</li>
					<li>
						<a href="">
							更多
							<img src="${ctx}/resources/front/img/img/111.png" />
						</a>
					</li>
				</ul>
			</div>
			<div class="add_content">
				<ul>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/130.png" />
						</div>
						<div class="title_center_p">
							派滋&nbsp;华为畅享6S钢化膜畅享6S手机贴膜&nbsp;高清透明
						</div>
					</li>
					<li>
						<div class="add_img">
							<img src="${ctx}/resources/front/img/img/jia.png" />
						</div>
					</li>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/131.png" />
						</div>
						<div class="title_center_p">
							机灵猫 畅享6S手机壳女防摔带支架保护套
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;18.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/137.png" />
						</div>
						<div class="title_center_p">
							机灵猫 畅享6S手机壳女防摔带支架保护套
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;26.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/132.png" />
						</div>
						<div class="title_center_p">
							品胜 Type-C/MicroUSB/Lightning接口三个
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;29.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/133.png" />
						</div>
						<div class="title_center_p">
							品胜 iPad充电器 移动电源充电
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;35.00
						</span>
					</li>
					<li>
						<div class="title_center_img">
							<img src="${ctx}/resources/front/img/img/134.png" />
						</div>
						<div class="title_center_p">
							罗马式（POMOSS）LED数显屏 移动
						</div>
						<input type="checkbox" />
						<span>
							¥&nbsp;108.00
						</span>
					</li>
					<li>
						<div class="nav_img">
							<img src="${ctx}/resources/front/img/img/135.png" />
						</div>
					</li>
					<li>
						<div class="eq_img">
							<img src="${ctx}/resources/front/img/img/136.png" />
						</div>
					</li>
					<li>
						<div class="add_all">
							<span class="now_get">
								已选0个配件
							</span>
							<span class="all_money_txt">
								组合价
							</span>
							<span class="all_money">
								&nbsp;¥&nbsp;1499.00
							</span>
							<input class="now_buy" type="button" value="立即购买" />
							<input class="select_buy" type="button" value="配件选购中心" />
						</div>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="detial_info">
			<div class="left">
				<div class="left_top">
					关于手机，您可能再找
				</div>
				<p class="want_content">
					安卓（Android）
				</p>
				<p class="want_content">
					5.0-4.6英寸
				</p>
				<p class="want_content">
					双卡双待
				</p>
				<p class="want_content">
					骁龙芯片
				</p>
				<p class="want_content">
					自拍神器
				</p>
				<p class="want_content">
					3GB
				</p>
				<p class="want_content">
					联通4G
				</p>
				<p class="want_content">
					电信4G
				</p>
				<p class="want_content">
					移动4G/联通4G/电信4G
				</p>
				<p class="want_content">
					移动4G
				</p>
				<p class="want_content">
					32GB
				</p>
				<p class="want_content">
					8核
				</p>
			</div>
		
		
			<br>
			<!--=====================-->
			<div class="right_big">
				<div class="big_img">
					${product.detail}
				</div>
				<div class="right_big_bottom">
					<ul class="right_big_bottom_ul">
						<li class="end_safeguard">
							售后保障
						</li>
						<li class="server_safeguard">
							<span class="server" >
								厂家服务<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							（注：如厂商在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）<br />
							</span>
						</li>
						<li class="server_safeguard">
							<span class="server">
								靓淘服务<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							（注：如厂商在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）<br />
							</span>
						</li>
						<li class="server_safeguard">
							<span class="server">
								全国联保<br />
							</span>
							<span class="server_detial">
							本产品全国联保，享受三包服务，保质期为：一年质保<br />
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
							<span class="end">
								注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，不能确保客户收到的货物与商品图片一致，只能确保为原厂正品货物！<br />
								若本商城没有及时更新，请大家谅解！
							</span>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!------------------------------------------------------------------>

	</body>
		<script type="text/javascript">
			$(function(){
				//- 
				$("#sub").click(function(){
					var num = $("#num").val();
					num--;
					if(num == 0) {
						//alert();
						return;
					}
					//赋值
					$("#num").val(num);
				});
				//+
				$("#add").click(function(){
					var num = $("#num").val();
					num++;
					if(num > '${product.stock}') {
						alert("此商品只能买" + '${product.stock}' + "件");
						return;
					}
					//赋值
					$("#num").val(num);
				});
			});
			
			
			$("#car").click(function(){
				 $("#form").attr('action','/Cart/Cart/insert.shtml');
				this.submit();
			})	
			
			$("#buy").click(function() {
				 $("#form").attr('action','/Cart/orderItem/insert.shtml');
				this.submit();
			})	
		</script>
</html>
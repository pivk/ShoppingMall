<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
	<!--top-->
		<div class="top_big">
			<div class="top_center">
				<div class="left">
					欢迎来到靓淘网！
				</div>
				<div class="right">
					<ul>

						<c:if test="${user==null}">
							<li><a class="login" href="/Cart/user/logout.shtml" target="_blank">请登录</a>
							</li>
		                   <li>
								<a href="/Cart/user/add.shtml" target="_blank">快速注册</a>
						</li>
						</c:if>
						<c:if test="${user!=null}">
							<li>${user.username}
							</li>
						</c:if>
						
						<li>
							<a class="collect" href="">我的收藏</a>
						</li>
						<li>
							<a class="indent" href="">我的订单</a>
						</li>
						<li>
							<a class="phone" href="">手机靓淘</a>
						</li>
						<li>
							<a href="">我的积分</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!---------------logo-------------------->
		<div class="logo_center">
			<div class="left">
				<img src="${ctx}/resources/front/img/img/LOGO.png" />
			</div>
			<div class="center">
				<input class="logo_search" type="text" />
				<input class="logo_btn" type="button" value="搜索" />
				<ul class="logo_ad">
					<li>
						<a href="">值得买 |</a>
					</li>
					<li>
						<a href="">小米6 |</a>
					</li>
					<li>
						<a href="">金立 |</a>
					</li>
					<li>
						<a href="">华为畅享 7P |</a>
					</li>
					<li>
						<a href="">苹果7 |</a>
					</li>
					<li>
						<a href="">1元800M |</a>
					</li>
				</ul>
			</div>
			<div class="right">
				<a style="color: #666666;" href="">去购物车结算</a>
				<div class="logo_nav">

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
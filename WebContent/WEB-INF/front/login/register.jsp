<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<title>登录.云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/front/img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/base.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/home.css">
</head>
<body>

<header id="pc-header">
	<div class="center">
		<div class="pc-fl-logo">
			<h1>
				<a href="index.html"></a>
			</h1>
		</div>
	</div>
</header>
<section>
	<div class="pc-login-bj">
		<div class="center clearfix">
			<div class="fl"></div>
			<div class="fr pc-login-box">
				<div class="pc-login-title"><h2>用户注册</h2></div>
				<form action="/Cart/user/insert.shtml" method="post">
					<div class="pc-sign">
						<input type="text" placeholder="用户名" name="username">
					</div>
					<div class="pc-sign">
						<input type="text" placeholder="邮箱" name="email">
					</div>
					<div class="pc-sign">
						<input type="text" placeholder="手机号" name="phone">
					</div>
					<div class="pc-sign">
						<input type="password" placeholder="请输入您的密码" name="password">
					</div>
						<div class="pc-sign">
                         <select name="question">
	                         <option value="1">你的初恋女友姓名</option>
	                         <option value="2">你的大学姓名</option>
	                         <option value="3">你的小学姓名</option>
                        </select>
                            
					</div>
					<div class="pc-sign">
						<input type="text" placeholder="答案" name="answer">
					</div>
		
					<div class="pc-submit-ss">
						<input type="submit" value="立即注册" placeholder="">
					</div>
				
					<div class="pc-reg">
						<a href="/Cart/user/logout.shtml" class="red">已有账号 请登录</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<footer>
	<div class="center">
		<div class="pc-footer-login">
			<p>关于我们 招聘信息 联系我们 商家入驻 商家后台 商家社区 ©2017 Yungouwu.com 北京云购物网络有限公司</p>
			<p style="color:#999">营业执照注册号：990106000129004 | 网络文化经营许可证：北网文（2016）0349-219号 | 增值电信业务经营许可证：京2-20110349 | 安全责任书 | 京公网安备 99010602002329号 </p>
		</div>
	</div>
</footer>

</body>
</html>
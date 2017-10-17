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
	<title>前台 登录</title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/front/img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/base.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/home.css">
	<script type="text/javascript">
 		function refreshCode() {
			$("#codeImg").attr("src",
					"${pageContext.request.contextPath}/checkImg?" + Math.random());
		}
	</script>
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
				<div class="pc-login-title"><h2>用户登录</h2></div>
				<form action="/Cart/user/login.shtml" method="post">
					<div class="pc-sign">
						<input type="text" name="username" placeholder="用户名">
					</div>
					<div class="pc-sign">
						<input type="password" name="password" placeholder="请输入您的密码">
					</div>
					
					<div class="pc-sign">
						<input type="text" name="checkCode"  style="width: 100px;">
					  <img id="codeImg" src="${pageContext.request.contextPath}/checkImg" width="116" height="36" onclick="refreshCode();" style="margin-left: 50px">
					</div>
					
					<div class="pc-submit-ss">
						<input type="submit" value="登录" placeholder="">
					</div>
					<div class="pc-reg">
						<a href="#">忘记密码</a>
						<a href="/Cart/user/add.shtml" class="red">免费注册</a>
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
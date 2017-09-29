<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文章添加--layui后台管理模板</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
	media="all" />
</head>
<body class="childrenBody">

	<div class="layui-form-item">
		<label class="layui-form-label">文章标题</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input newsName" lay-verify="required"
				placeholder="请输入文章标题">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">自定义属性</label>
			<div class="layui-input-block">
				<input type="checkbox" name="tuijian" class="tuijian" title="推荐">
				<input type="checkbox" name="shenhe" class="newsStatus" title="审核">
				<input type="checkbox" name="show" class="isShow" title="展示">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">文章作者</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input newsAuthor"
					lay-verify="required" placeholder="请输入文章作者">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input newsTime"
					lay-verify="required|date"
					onclick="layui.laydate.render({elem:this})">
			</div>
		</div>


	<div class="layui-form-item">
		<label class="layui-form-label">关键字</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input" placeholder="请输入文章关键字">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">内容摘要</label>
		<div class="layui-input-block">
			<textarea placeholder="请输入内容摘要" class="layui-textarea"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">文章内容</label>
		<div class="layui-input-block">
			<textarea class="layui-textarea layui-hide" name="content"
				lay-verify="content" id="news_content"></textarea>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web//layui/layui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web/js/newsAdd.js"></script>
</body>
</html>
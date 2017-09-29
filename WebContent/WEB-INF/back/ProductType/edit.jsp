<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
	media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form" action="${pageContext.request.contextPath}/ProductType/insert" method="post">
		<div class="layui-inline">
			<label class="layui-form-label">子类商品名称</label>
			<div class="layui-input-inline">
				<input type="text" name="name" class="layui-input newsAuthor"
					lay-verify="required" placeholder="请输入商品类别名称"> </select>
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">父类商品名称</label>
			<div class="layui-input-inline">
				<select name="parentid" class="newsLook" lay-filter="browseLook">
					<option value="0">无上级</option>
					<c:forEach var="r" items="${requestScope.info1}">
					    <option>${r.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web//layui/layui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web/js/newsAdd.js"></script>
</body>
</html>
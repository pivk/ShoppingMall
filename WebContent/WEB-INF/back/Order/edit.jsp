<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
	media="all" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web/css/news.css"
	media="all" />
</head>
<body class="childrenBody">
   
  <table>		
			
				<thead>
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>商品单价</th>
						<th>数量</th>
						<th>小计</th>		
					</tr>
				</thead>

				<tbody class="news_content">
					<c:forEach var="Order" items="${info}">
						<tr>
							<td><img src="${Order.product_image}" width="40px" height="50px"></td>
							<td>${Order.quantity}</td>
							<td>${Order.current_unit_price}</td>
							<td>${Order.total_price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/layui.js"></script>
</body>
</html>
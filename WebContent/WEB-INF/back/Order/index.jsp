<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../common/head.jsp"%>

<!--css  -->
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
	<!-- 顶部开始 -->
	<blockquote class="layui-elem-quote news_search">

		<div class="layui-inline">
			<form
				action="${pageContext.request.contextPath}/Order/searchByCondition.action"
				method="post" id="seachForm">
				<input type="hidden" name="pageIndex" id="pageIndex">
				<div class="layui-input-inline">
					<input type="text" name="name" value="" placeholder="请输入类别名称"
						class="layui-input search_input">
				</div>
				<button class="layui-btn search_btn">查询</button>
			</form>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal" href="javascript:add();">添加</a>
		</div>

		<div class="layui-inline">
			<a class="layui-btn recommend" style="background-color: #5FB878">状态查询</a>
		</div>

		<div class="layui-inline">
			<a onclick="deleteAll();" class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>

	</blockquote>

	<!-- 顶部结束-->


	<!-- 表格开始 -->
	<div class="layui-form news_list">
		<form action="" method="post" id="mainForm">
			<table class="layui-table">
				<colgroup>
					<col width="20">
					<col>
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="15%">
				</colgroup>

				<thead>
					<tr>
						<th><input type="checkbox" lay-skin="primary"
							class="layui-input-block" lay-filter="allChoose"
							onclick="selectall();" id="selectAll"></th>
						<th style="text-align: left;">商品编号</th>
						<th>订单</th>
						<th>用户名</th>
						<th>总金额</th>
						<th>支付方式</th>
					    
						<th>订单详情</th>
					</tr>
				</thead>

				<tbody class="news_content">

					<c:forEach var="Order" items="${list}">
						<tr>
						
							<td>${Order.id}</td>
							<td>${Order.order_no}</td>
							<td>${Order.payment}</td>
								<td>${Order.user.username}</td>
							<c:if test="${Order.status==1}">
								<td><label class="layui-btn ">
									已付款</label></td>
							</c:if>
							<c:if test="${Order.status==0}">
								<td><label class="layui-btn layui-btn-danger">
									未付款</label></td>
							</c:if>
							<c:if test="${Order.postage==1}">
								<td><label class="layui-btn ">
									货到付款</label></td>
							</c:if>
							<c:if test="${Order.postage==0}">
								<td><label class="layui-btn layui-btn-danger">
									在线付款</label></td>
							</c:if>
							<td><fmt:formatDate value="${Order.create_time }"
									pattern='yyyy-MM-dd' /></td>
							<td><a class="layui-btn layui-btn-mini"
								href="javascript:edit(${Order.order_no});"><i
									class="iconfont icon-edit"></i>详情</a> <a
								class="layui-btn layui-btn-danger layui-btn-mini "
								data-id="'+data[i].id+'"
								href="javascript:del(${Order.id});"><i
									class="layui-icon">&#xe640;</i> 删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</form>
	</div>
	<!--表格结束  -->

	<!--分页开始  -->
	<%@include file="../common/page.jsp"%>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/layui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	function goPage(pageIndex) {
		$("#pageIndex1").val(pageIndex);
		$("#seachForm1").submit();
	
	} 


		function edit(orderno) {
			layui.use('layer', function() {
				layer.open({
					type : 2,
					skin : 'layui-layer-rim', //加上边框
					area : [ '800px', '600px' ], //宽高
					content : "/Cart/Order/displayinfo.action?orderno=" +orderno
				});
			});
		}
		function add() {
			layui.use('layer', function() {
				layer.open({
					type : 2,
					skin : 'layui-layer-rim', //加上边框
					area : [ '800px', '600px' ], //宽高
					content : "/Cart/Order/add.action"
				});
			});
		}

		/*批量删除 */
		function selectall() {
			$("input[name=selectIds]").prop("checked",
					$("#selectAll").is(":checked"));
		}

		function deleteAll() {
			var isDel = confirm("您确认要删除吗？");
			if (isDel) {
				//要删除
				$("#mainForm").attr("action",
						"/Cart/Order/deleteAll.action");
				$("#mainForm").submit();
			}
		}

		function del(id) {
			if (confirm("确定删除？")) {
				location.href = "/Cart/Order/delete.action?id=" + id;
			}
		}
	</script>



</body>
</html>
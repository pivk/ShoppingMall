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
				action="${pageContext.request.contextPath}/ProductType/searchByCondition.action"
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
						<th>商品名称</th>
						<th>商品父辈名称</th>
						<th>创建时间</th>
						<th>更新时间</th>
						<th>是否使用</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody class="news_content">

					<c:forEach var="productType" items="${list}">
						<tr>
							<td><input type="checkbox" name="selectIds"
								class="layui-input-block" lay-filter="choose"
								value="${productType.id}"></td>
							<td>${productType.id}</td>
							<td>${productType.name }</td>
							<td>${productType.productType.name }</td>

							<c:if test="${productType.status==1}">
								<td><label class="layui-btn ">
										${productType.status_name}</label></td>
							</c:if>
							<c:if test="${productType.status==0}">
								<td><label class="layui-btn layui-btn-danger">
										${productType.status_name }</label></td>
							</c:if>
							<td><fmt:formatDate value="${productType.update_time }"
									pattern='yyyy-MM-dd' /></td>
							<td><fmt:formatDate value="${productType.create_time }"
									pattern='yyyy-MM-dd' /></td>
							<td><a class="layui-btn layui-btn-mini"
								href="javascript:edit(${productType.id});"><i
									class="iconfont icon-edit"></i> 编辑</a> <a
								class="layui-btn layui-btn-danger layui-btn-mini "
								data-id="'+data[i].id+'"
								href="javascript:del(${productType.id});"><i
									class="layui-icon">&#xe640;</i> 删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</form>
	</div>
	<!--表格结束  -->

	<!--分页开始  -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>显示完整功能</legend>
</fieldset>
 
<div id="demo7"></div>
 

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/layui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"
		type="text/javascript" charset="utf-8"></script>
		
		<script src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/lay/modules/laypage.js" charset="utf-8"></script>
	<script type="text/javascript">
	/* 	function goPage(pageIndex) {
			$("#pageIndex").val(pageIndex);
			$("#seachForm").submit();
		} */
		layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage
			  ,layer = layui.layer;
			  	
		  laypage.render({
			    elem: 'demo7'
			    ,count: '${pageBean.totalPage}'
			    ,layout: ['count', 'count', 'page', 'next', 'limit', 'skip']
			    ,jump: function(obj){
			    	  document.getElementById('biuuu_city_list').innerHTML = function(){
			    	        var arr = []
			    	        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
			    	        layui.each(thisData, function(index, item){
			    	          arr.push('<li>'+ item +'</li>');
			    	        });
			    	        return arr.join('');
			    	      }();
			    }
			  });
		}	)
		
		
		function edit(id) {
			layui.use('layer', function() {
				layer.open({
					type : 2,
					skin : 'layui-layer-rim', //加上边框
					area : [ '400px', '200px' ], //宽高
					content : "/Cart/ProductType/edit.action?id=" + id
				});
			});
		}
		function add() {
			layui.use('layer', function() {
				layer.open({
					type : 2,
					skin : 'layui-layer-rim', //加上边框
					area : [ '400px', '200px' ], //宽高
					content : "/Cart/ProductType/add.action"
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
						"/Cart/ProductType/deleteAll.action");
				$("#mainForm").submit();
			}
		}

		function del(id) {
			if (confirm("确定删除？")) {
				location.href = "/Cart/ProductType/delete.action?id=" + id;
			}
		}
	</script>



</body>
</html>
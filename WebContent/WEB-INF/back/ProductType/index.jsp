<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@include file="../common/head.jsp" %>

	<!--css  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/thirdlib/web/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/thirdlib/web/css/news.css" media="all" />
</head>
<body class="childrenBody">
 <!-- 顶部开始 -->
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    <form action="${pageContext.request.contextPath}/ProductType/select" method="post">
		    	<input type="text" name="name" value="" placeholder="请输入类别名称" class="layui-input search_input">
		    	<input type="hidden" name="ProductType.name" value=""  class="layui-input search_input">
		   </form>
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加商品类别</a>
		</div>
		
	 	<div class="layui-inline">
			<a class="layui-btn recommend" style="background-color:#5FB878">状态查询</a>
		</div>

		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		
	<!-- 	<div class="layui-inline">
			<div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
		</div> -->
		
	</blockquote>
	
	 <!-- 顶部结束-->
	
	
	<!-- 表格开始 -->
	<div class="layui-form news_list">
	<form action="" method="post" id="mainForm"></form>
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
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th style="text-align:left;">商品编号</th>
					<th >商品名称</th>
					<th>商品父辈名称</th>
					<th>创建时间</th>
					<th>更新时间</th>
					<th>是否使用</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    
		    <tbody class="news_content"></tbody>	
		        
		</table>
	</div>
	<!--表格结束  -->
	
	<!--分页开始  -->
	<div id="page"></div>
	<!--分页结束-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/web/js/newsList.js"></script>
	<script type="text/javascript">
	      
	
	
	</script>
	
	
	
</body>
</html>
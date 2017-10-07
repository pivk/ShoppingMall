<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
	media="all" />
</head>
<body class="childrenBody">
	<c:if test="${info.id==null}">
		<form
			action="${pageContext.request.contextPath}/ProductType/insert.action"
			method="post">
			<div class="layui-inline">
				<label class="layui-form-label">子类商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input newsAuthor"
						lay-verify="required" value="${info.name}" placeholder="请输入商品类别名称">
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">父类商品名称</label>
				<div class="layui-input-inline">
					<select name="parent_id" class="newsLook" lay-filter="browseLook" >
						<option value="0">无上级</option>
						<c:forEach var="r" items="${requestScope.info1}">
							<option value="${r.id}">${r.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="submit" class="layui-btn layui-btn-primary">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</c:if>
	
	
	
	
	<c:if test="${info.id!=null}">
		<form
			action="${pageContext.request.contextPath}/ProductType/update.action"
			method="post">
			<input type="hidden" name="id" value="${info.id}">
			<div class="layui-inline">
				<label class="layui-form-label">子类商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input newsAuthor"
						lay-verify="required" value="${info.name}" placeholder="请输入商品类别名称">
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">父类商品名称</label>
				<div class="layui-input-inline">
					<select name=parent_id class="newsLook" lay-filter="browseLook">
						   <c:if test="${info.parent_id==0}">
						     		 <option value="0">无上级</option>
						    </c:if>
						 <c:if test="${info.parent_id!=0}">
						 <c:forEach var="r" items="${requestScope.info1}">
						     <c:if test="${info.parent_id==r.id}">
								<option selected="selected" value="${r.id}">${r.name}</option>
								</c:if>
						     <c:if test="${info.parent_id!=r.productType.id}">
									<option  value="${r.id}">${r.name}</option>
							</c:if>
							</c:forEach>
					</c:if>
					</select>
				</div>
			</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="submit" class="layui-btn layui-btn-primary">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</c:if>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/thirdlib/web//layui/layui.js"></script>

</body>
</html>
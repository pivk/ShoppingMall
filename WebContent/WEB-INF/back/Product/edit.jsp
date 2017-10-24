<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
	media="all" />	

</head>
<body class="childrenBody" style="overflow-y:hidden">
	<c:if test="${info.id==null}">
	<form  id="form-add"  enctype="multipart/form-data"  method="post">
	<input value="1" name="status" type="hidden"> 
	</c:if>
	<c:if test="${info.id!=null}">
	<form action="${pageContext.request.contextPath}/Product/update.action" id="form-add"  enctype="multipart/form-data" method="post">
	   <input type="hidden" name="id" value="${info.id}">
	</c:if>
			<div class="layui-inline">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input newsAuthor"
						lay-verify="required" value="${info.name}" placeholder="请输入商品名称">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品副标题</label>
				<div class="layui-input-inline">
					<input type="text" name="subtitle" class="layui-input newsAuthor"
						lay-verify="required" value="${info.subtitle}" placeholder="请输入商品副标题">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-inline">
					<input type="text" name="price" class="layui-input newsAuthor"
						lay-verify="required" value="${info.price}" placeholder="请输入商品价格">
				</div>
		 </div>
			<div class="layui-inline">
				<label class="layui-form-label">库存数量</label>
				<div class="layui-input-inline">
					<input type="text" name="stock" class="layui-input newsAuthor"
						lay-verify="required" value="${info.stock}" placeholder="请输入商品价格">
				</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label">商品类别</label>
				<div class="layui-input-inline">
					<select name="category_id" style="overflow-y:hidden"> 
						<c:forEach var="r" items="${type}">
							<c:if test="${info.category_id==r.id }">
						       <option selected="selected" value="${r.id}">${r.name}</option>
						     </c:if>
							<c:if test="${info.category_id!=r.id }">
						       <option  value="${r.id}">${r.name}</option>
						     </c:if>
						</c:forEach>	
					</select>
						</div>
			</div>
			
			<div class="layui-inline">
				<label class="layui-form-label">商品状态</label>
				<div class="layui-input-inline">
					<select name="status" class="form-control">
							  	  <c:forEach var="r" items="${statuslist}" varStatus="v">
							  	     <c:if test="${info.status==v.index}">
							  	     	<option selected="selected" value="${info.status}">${r}</option>
							  	      </c:if>
							  	     <c:if test="${info.status!=v.index}">
							  	     	<option value="${info.status}">${r}</option>
							  	      </c:if>
							  	  </c:forEach>
				  	</select>				
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label layui-field-title">商品主图</label>
				<div class="layui-input-inline">
					<img alt="" id="imgId" src="${info.fulUrl}" width="100" height="100">
				  	<input type="hidden" id="mainImage" name="main_image"/>
				  	<input type="file" name="pictureFile" onchange="uploadPic();"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">商品图片</label>			
				<div class="layui-input-inline" >
					 <a href="javascript:void(0)" class="picFileUpload layui-field-title"  id="picFileUpload">上传图片</a>
				   		<input type="hidden" name="sub_images" id="subImages"/>
	                 <div id="J_imageView">
	               	<c:forEach var="r" items="${sub_images}">
						    	<li class="small_shop" style="float: right;">	<img src="${r}"></li>
					</c:forEach>
	                </div>
				</div>
			</div>
			<br>
					
			<div class="layui-inline">
				<label class="layui-form-label">商品详情</label>
				<div class="layui-input-inline">
					<textarea style="width:900px;height:300px;visibility:hidden;" name="detail">
					</textarea>
				</div>
			</div>
						
				<br>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="button" onclick="submitForm()" class="layui-btn layui-btn-primary">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>


<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/thirdlib/web/layui/layui.js"></script>
<script type="text/javascript">

	function uploadPic(){
		//定义参数
		var options = {
				url : "${pageContext.request.contextPath}/upload/uploadPic.action",
				dataType : "json",
				type : "post",
				success : function(data) {
					$("#imgId").attr("src", data.filePath);
					$("#mainImage").val(data.fileName);
				}
		};
		
		 $("#form-add").ajaxSubmit(options);
		}
	
	
	
	
	var myKindEditor;
	KindEditor.ready(function(K) {
		var kingEditorParams = {
				//指定上传文件参数名称
				filePostName  : "pictureFile",
				//指定上传文件请求的url。
				uploadJson : '${pageContext.request.contextPath}/upload/pic.action',
				//上传类型，分别为image、flash、media、file
				dir : "image",
				afterBlur: function () { this.sync(); }
		}
		var editor = K.editor(kingEditorParams);
		//多图片上传
		K('#picFileUpload').click(function() {
			editor.loadPlugin('multiimage', function() {
				editor.plugin.multiImageDialog({
					clickFn : function(urlList) {
						console.log(urlList);
						var div = K('#J_imageView');
						var imgArray = [];
						div.html('');
						K.each(urlList, function(i, data) {
							imgArray.push(data.url);
							div.append('<img src="' + data.url + '" width="80" height="50">');
						});
						$("#subImages").val(imgArray.join(","));
						editor.hideDialog();
					}
				});
			});
		});
		//富文本编辑器
		myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
	});

	function submitForm() {
		var option={
				url:"/Cart/Product/insert.action",
				type:"post",
				data:$("#form-add").serialize(),
				dataType:"json",
				success:function(data){
					if(data.status==0){
					layui.use('layer', function() {
						layer.confirm(
								'添加成功',
		           				{btn:['关闭','跳转到列表界面']},
		           				function(index){
		           					layer.close(index);
		           				},
		           				function(){
		           					window.location.href = "${ctx}/product/findAll.action";
		           				}
						)
					});
					}
					else{
						layui.use('layer', function() {
							layer.msg("添加失败");
						});
						}
						
					}					
				}
					$.ajax(option)
					
		}
		
	
	
	
	</script>
</body>
</html>
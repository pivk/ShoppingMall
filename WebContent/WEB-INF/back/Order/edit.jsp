<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/thirdlib/web//layui/css/layui.css"
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
							<td><img src="${Order.product_image}"></td>
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
	
	
	var myKindEditor ;
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
	
	</script>
</body>
</html>
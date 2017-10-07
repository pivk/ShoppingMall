
	<!-- 分页开始 -->
	<nav aria-label="Page navigation">
		<ul class="pagination pagination-lg">
			<!-- 上一页 开始-->
			<c:if test="${pageBean.pageIndex==1}">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<c:if test="${pageBean.pageIndex!=1}">
				 <a href="javascript:goPage('${pageBean.pageIndex-1}')" aria-label="Previous">
				   <span aria-hidden="true">&laquo;</span>
				</a>
			</c:if>

			<!-- 上一页 结束-->

			<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				<c:if test="${pageBean.pageIndex!=page}">
					<li>
 			   			<a href="javascript:goPage('${page}')">${page}</a>
				</c:if>

				<!-- 遍历的时候page和pageIndex相等，高亮显示 -->
				<c:if test="${pageBean.pageIndex==page }">
						<li class="active"><a href="javascript:goPage('${page}')">${page}</a></li>
				</c:if>
			</c:forEach>


			<!-- 下一页 开始-->

			<c:if test="${pageBean.pageIndex==pageBean.totalPage}">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
			  <a href="javascript:goPage('${pageBean.pageIndex+1}')" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			</a>
			</c:if>
			<!-- 下一页 结束-->
		</ul>
	</nav>
	<!--分页结束-->

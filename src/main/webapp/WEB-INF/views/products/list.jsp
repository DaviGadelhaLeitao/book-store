<%@ include file="/WEB-INF/includes.jsp"%>

<body>
<tags:pageTemplate title="Products list">
	<div class="main">
		<div class="container">
			<h3>Products list</h3>
			<p>${bookAddedMessage}</p>
			<p>${checkoutMessage}</p>
			<table class="table table-striped table-hover table-bordered ">
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Pages</th>
					<th>Published</th>
					<th>Prices</th>
				</tr>
				<c:forEach items="${products }" var="product">
					<tr>
						<td><a href="${s:mvcUrl('PC#detail').arg(0,product.id).build() }">${product.title }</a></td>
						<td>${product.description }</td>
						<td>${product.pages }</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time }" /></td>
						<td>${product.prices }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
</tags:pageTemplate>
</body>
</html>




















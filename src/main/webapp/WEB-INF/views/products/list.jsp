<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<title>List</title>
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp"></c:import>

	<div class="main">
		<div class="container">
			<h3>Products list</h3>
			<p>${confirmationMessage}</p>
			<table class="table table-striped table-hover ">
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Pages</th>
					<th>Published</th>
				</tr>
				<c:forEach items="${products }" var="product">
					<tr>
						<td><a href="${s:mvcUrl('PC#detail').arg(0,product.id).build() }">${product.title }</a></td>
						<td>${product.description }</td>
						<td>${product.pages }</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
<script type="text/javascript" src=""></script>
</html>
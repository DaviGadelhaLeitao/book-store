<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<title>List</title>
</head>
<body>

	<h1>Products list</h1>
	<p> ${confirmationMessage} </p>
	<table class="table table-striped table-hover ">
		<tr>
			<td>Title</td>
			<td>Description</td>
			<td>Pages</td>
			<td>Published</td>
		</tr>
		<c:forEach items="${products }" var="product">
			<tr>
				<td><a href="${s:mvcUrl('PC#detail').arg(0,product.id).build() }" >${product.title }</a></td>
				<td>${product.description }</td>
				<td>${product.pages }</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time }" /> </td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
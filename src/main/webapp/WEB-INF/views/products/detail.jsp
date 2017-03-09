<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${product.title }details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp"></c:import>

	<div class="main">
		<div class="container">
			<h1 class="product-title">${product.title }</h1>
			<p class="book-description">${product.description }</p>

			<form action="/cart/add" method="post">
				<input type="hidden" value="${product.id}" value="productId" />
				<c:forEach items="${types }" varStatus="type">
				</c:forEach>

				<button type="submit" value="Buy now"></button>
			</form>
			<br>
			<p>Publised in: <fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time}" />.</p>
			
		</div>
	</div>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
</body>
<script type="text/javascript" src="/WEB-INF/js/default.js"></script>
</html>
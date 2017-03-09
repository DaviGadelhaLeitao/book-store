<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${product.title }details</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>


	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<ul>
				<li>Home</li>
				<li>Books</li>
				<li>Shopping cart</li>
			</ul>
		</div>
	</nav>

	<div class="">
		<div class="container"></div>
	</div>

	<div class="">
		<div class="container"></div>
	</div>

	<h1 class="product-title">${product.title }</h1>
	<p class="book-description">${product.description }</p>

	<form action="/cart/add" method="post">
		<input type="hidden" value="${product.id}" value="productId" />
		<c:forEach items="${types }" varStatus="type">
		</c:forEach>

		<button type="submit" value="Buy now"></button>
	</form>

	<div class="productInfo">
		<div class="container">

			<fmt:formatDate pattern="dd/MM/yyyy"
				value="${product.published.time}" />
		</div>
	</div>
</body>
</html>
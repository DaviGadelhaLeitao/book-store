<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${product.title } details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp"></c:import>

	<div class="main">
		<div class="container">
			<h1 class="product-title">${product.title }</h1>
			<p class="book-description">Description: ${product.description }</p>
			<p>Published in: <fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time}"/>.</p>

			<form action="/cart/add" method="post">
				<p>Please, select your buying option below:</p>
				<input type="hidden" name="productId" value="${product.id}" >
				<ul>
				
					<c:forEach items="${product.types }" var="price">
						<li class="buy-option">
							<input type="radio" name="type" class="variant-radio" id="type" value="${price.type}" checked="checked" />
							<label class="variant-label"> ${price.type} - $ ${price.value }</label>
						</li>
					</c:forEach>
					
				</ul>
				<button type="submit" class="btn btn-primary" title="Compre Agora${product.title}">Buy now</button>
			</form>

		</div>
	</div>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
<script type="text/javascript" src=""></script>
</html>
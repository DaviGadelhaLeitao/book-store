<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:url value="/resources/css" var="cssPath"></c:url>
	<c:url value="/resources/js" var="jsPath"></c:url>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="${cssPath}/bookStore.css" >
</head>
<body>

	<div class="header">
		<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>

	<div class="main">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Book Cover</h1>
				</div>
				<div class="col-md-6">
					<h1 class="product-title">${product.title }</h1>
					
					<p class="book-description">Description: ${product.description }.</p>
			
					<p>Published in: <fmt:formatDate pattern="dd/MM/yyyy" value="${product.published.time}" />.</p>

					<form:form servletRelativeAction="/cart/add" method="post" cssClass="container">
					<input type="hidden" name="productId" value="${product.id}" />
		
						<p>Please, select your buying option below:</p>
		
						<ul>
							<c:forEach items="${product.prices }" var="price">
								<li class="buy-option">
									<!--  SECOND PARAMETER BEING SENT TO SHOPPING CART CONTROLLER -->
<!-- 									<input type="radio" name="type" class="variant-radio" checked="checked" /> -->
									<input type="radio" name="type" class="variant-radio" value="${price.type}" checked="checked" />
								 	<label class="variant-label">${price.type} - $ ${price.value }</label>
								</li>
							</c:forEach>
						</ul>
						<button type="submit" class="btn btn-primary" title="Compre Agora${product.title}">Buy now</button>
		
					</form:form>
					
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
	<script type="text/javascript" src="${jsPath}/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/npm.js"></script>
	<script type="text/javascript" src="${jsPath}/header.js"></script>
</html>













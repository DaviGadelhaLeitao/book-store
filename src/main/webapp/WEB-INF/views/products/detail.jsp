<%@ include file="/WEB-INF/includes.jsp"%>
<body>

<tags:pageTemplate title="Book description">

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
	</tags:pageTemplate>

</body>
</html>













<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shopping cart detail page</title>
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
				<h2>Cart Items</h2>
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th>Item</th>
								<th>Price</th>
								<th>Qtd</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${shoppingCart.items}" var="item">
								<tr>
									<td>${item.product.title}</td>
									<td>$ ${item.price } - ${item.priceType }</td>
									<td><input type="number" readonly="readonly" name="quantity" value="${shoppingCart.getQuantityOfAnItemInACart(item)}" ></td>
									<td>$ ${shoppingCart.getTotalPriceOfAnItemInCart(item) }</td> <!-- total of this item into the shopping cart  -->  
									<td>
										<form action="${s:mvcUrl('SCC#remove').arg(0,item.product.id).arg(1,item.priceType).build() }" method="POST">
											<input type="image" src="resources/images/trashIcon.png" alt="Excluir" title="Excluir" />
										</form>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
						<tfoot>
							<tr>
								<td>
									<form action="${s:mvcUrl('PC#orderCheckout').build()}" method="POST">
										<input type="submit" name="checkout" value="Checkout">
									</form>
								</td>
								<td></td>
								<td><input type="submit" name="update" value="update"></td>
								<td></td>
								<td><p>$ ${shoppingCart.total}</p></td>
							</tr>
						</tfoot>
					</table>
				
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












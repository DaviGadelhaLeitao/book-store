<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shopping cart detail page</title>
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp"></c:import>

	<div class="main">
		<div class="container">
			<div class="row">
				<h2>Your cart</h2>
				<form action="">
					<table>
						<thead>
							<tr>
								<th></th>
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
									<td></td>
									<td>${item.product.title }</td>
									<td>${item.price }</td>
									<td>
										<input type="number" readonly="readonly" name="quantity" value="${shoppingCart.getQuantityOfAnItemInACart(item) }" />
									</td>
									<td>${shoppingCart.getTotalPriceOfAnItemInCart(item) }</td> <!-- total of this item into the shopping cart  -->  
									<td>
										<form action="" method="POST">
											<input type="button" value="Remove">
										</form>
									</td>
									<td></td>
								</tr>
							</c:forEach>
							
							
							
						</tbody>
						<tfoot>
							<tr>
								<td><input type="submit" value="Checkout" name="checkout"></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<input type="submit" name="update" value="update">
								</td>
								<td>$[shoppingCart.total]</td>
							</tr>
						</tfoot>
					</table>
				</form>
				
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
</html>
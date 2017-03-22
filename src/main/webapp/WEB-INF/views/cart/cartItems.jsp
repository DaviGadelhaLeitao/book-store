<%@ include file="/WEB-INF/includes.jsp"%>
<body>
<tags:pageTemplate title="Cart items">

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
										<form:form action="${s:mvcUrl('SCC#remove').arg(0,item.product.id).arg(1,item.priceType).build() }" method="POST">
											<input type="image" src="${imagesPath}/trashIcon.png" alt="Excluir" title="Excluir" />
										</form:form>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
						<tfoot>
							<tr>
								<td>
									<form:form action="${s:mvcUrl('PC#orderCheckout').build()}" method="POST">
										<input type="submit" name="checkout" value="Checkout">
									</form:form>
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
	
</tags:pageTemplate>
</body>
</html>












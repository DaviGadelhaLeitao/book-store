<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp"></c:import>

	<div class="main">
		<div class="container">
			<div class="row">
				<c:forEach items="${products }" var="product">
					<div class="col-xs-6 col-md-3">
						<a href="${s:mvcUrl('PC#detail').arg(0, product.id).build() }" class="thumbnail"><img src="..." alt="..."></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
<script type="text/javascript" src=""></script>
</html>
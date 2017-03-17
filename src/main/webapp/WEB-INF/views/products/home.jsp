<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<c:url value="/resources/css" var="cssPath"></c:url>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
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
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
	<title>Home</title>
</head>
<body>

	<div class="header">
		<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>

	<div class="main">
		<div class="container">

			<div class="row">
				<c:forEach items="${products }" var="product">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail" id="homeThumbnail">
							<img src="resources/images/bookCover.jpg" alt="">
							<div class="caption">
								<h3>${product.title}</h3>
								<p>
									<a href="${s:mvcUrl('PC#detail').arg(0, product.id).build() }" class="btn btn-default" role="button">See details</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
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
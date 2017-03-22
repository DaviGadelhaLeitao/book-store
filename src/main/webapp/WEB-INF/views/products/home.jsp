<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ include file="/WEB-INF/includes.jsp" %>
<body>

<tags:pageTemplate title="Home">

	<div class="home">
		<div class="container">
			<div class="row">
				<c:forEach items="${products }" var="product">
					<div class="col-md-4">
						<a href="javascript:void(0)" class="consumer thumbnail"><img src="resources/images/bookCover.jpg"></a>
						<div class="row">
							<h3 id="homeH3">${product.title}</h3>
						</div>
						<div class="row">
							<a href="${s:mvcUrl('PC#detail').arg(0, product.id).build() }" class="btn btn-default" role="button" id="bookCoverButton">See details</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
</tags:pageTemplate>
</body>
	
</html>
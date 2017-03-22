<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ include file="/WEB-INF/includes.jsp" %>
<body>

<tags:pageTemplate title="Home">

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
	
</tags:pageTemplate>
</body>
	
</html>
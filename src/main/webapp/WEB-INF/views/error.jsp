<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ include file="/WEB-INF/includes.jsp"%>
<body>

	<tags:pageTemplate title="Home">

		<div class="home">
			<div class="container">
				<div class="row">
					<h1>Sorry !!! :-( Something wrong happened!!</h1>
					<br /> <br /> <br /> <br />
					<!-- Message: ${ exception.message} -->
					<c:forEach items="${exception.stackTrace }" var="stk">
						${stk }
					</c:forEach>
				</div>
			</div>
		</div>

	</tags:pageTemplate>
</body>

</html>
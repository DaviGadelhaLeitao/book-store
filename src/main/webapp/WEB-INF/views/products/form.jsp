<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
			<form:form action="${s:mvcUrl('PC#saveProduct').build() }" method="POST" commandName="product" enctype="multipart/form-data">
				<div class="form-group">
					<label>Title</label>
					<form:input path="title" cssClass="form-control"/>
				</div>
				<div>
					<form:errors path="title"></form:errors>
				</div>
				<div class="form-group">
					<label>Description</label>
					<form:textarea path="description" rows="5" cols="20"  cssClass="form-control"/>		
				</div>
				<div>
					<form:errors path="description"></form:errors>
				</div>
				<div class="form-group">
					<label>Pages:</label>
					<form:input path="pages" cssClass="form-control" />
				</div>
				<div>
					<form:errors path="pages"></form:errors>
				</div>
				
				<div class="form-group">
					<label>Published:</label>
					<form:input path="published" cssClass="form-control" />
				</div>
				<div>
					<form:errors path="published"></form:errors>
				</div>
				
				<c:forEach items="${types}" var="priceType" varStatus="status">
					<div class="form-group">
						<label>${priceType}</label>
						<form:input path="prices[${status.index}].value"  cssClass="form-control"/>
						<form:hidden path="prices[${status.index}].type" value="${priceType}" />
					</div>
				</c:forEach>
				
				<br>
				<div class="form-group">
					<label>Book summary file:</label>
					<input type="file" name="file">
				</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
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
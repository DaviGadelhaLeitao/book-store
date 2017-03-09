<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>

<c:import url="/WEB-INF/views/header.jsp"></c:import>

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
					<form:input path="types[${status.index}].value"  cssClass="form-control"/>
					<form:hidden path="types[${status.index}].type" value="${priceType}" />
				</div>
			</c:forEach>
			<br>
			<div class="form-group">
				<label>Book summary file:</label>
				<input type="file" name="summaryPath">
			</div>
		<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</div>

<c:import url="/WEB-INF/views/footer.jsp"></c:import>

</body>
<script type="text/javascript" src=""></script>
</html>
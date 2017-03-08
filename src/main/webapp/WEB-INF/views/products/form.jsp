<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
</head>
<body>

<form:form action="${s:mvcUrl('PC#saveProduct').build() }" method="POST" commandName="product" enctype="multipart/form-data">

	<div>
		<label>Title</label>
		<form:input path="title" />
	</div>
	<div>
		<form:errors path="title"></form:errors>
	</div>
	
	
	<div>
		<label>Description</label>
		<form:textarea path="description" rows="10" cols="20" />		
	</div>
	<div>
		<form:errors path="description"></form:errors>
	</div>
	
	
	<div>
		<label>Pages:</label>
		<form:input path="pages" />
	</div>
	<div>
		<form:errors path="pages"></form:errors>
	</div>
	
	
	<div>
		<label>Published:</label>
		<form:input path="published" />
	</div>
	<div>
		<form:errors path="published"></form:errors>
	</div>
	
	
	
	<c:forEach items="${types}" var="priceType" varStatus="status">
		<div>
			<label>${priceType}</label>
			<form:input path="prices[${status.index}].value" />
			<form:hidden path="prices[${status.index}].type" value="${priceType}" />
		</div>
	</c:forEach>
	
	
	<br>
	<div>
		<label>Book Content:</label>
		<input type="file" name="summaryPath">
	</div>
	<button type="submit">Submit</button>
	
</form:form>

</body>
</html>
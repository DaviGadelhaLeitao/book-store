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

<form:form action="${s:mvcUrl('PC#saveProduct').build() }" method="POST" commandName="product">
	<div>
		<label>Title</label>
		<input type="text" name="title">
	</div>
	<div>
		<form:errors path="title"></form:errors>
	</div>
	<div>
		<label>Description</label>
		<textarea rows="10" cols="20" name="description"></textarea>		
	</div>
	<div>
		<form:errors path="description"></form:errors>
	</div>
	<div>
		<label>Pages:</label>
		<input type="text" name="pages">
	</div>
	<div>
		<form:errors path="pages"></form:errors>
	</div>
	
	<c:forEach items="${types}" var="priceType" varStatus="status">
		<div>
			<label>${priceType}</label>
			<input type="text" name="prices[${status.index}].value">
			<input type="hidden" name="prices[${status.index}].type" value="${priceType}">
		</div>
	</c:forEach>
	<button type="submit">Submit</button>
</form:form>

</body>
</html>
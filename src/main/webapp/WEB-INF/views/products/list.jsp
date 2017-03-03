<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>

	<h1>Products list</h1>
	<p> ${confirmationMessage} </p>

	<table>
		<tr>
			<td>Title</td>
			<td>Description</td>
			<td>Pages</td>
		</tr>
		<c:forEach items="${products }" var="product">
			<tr>
				<td>${product.title }</td>
				<td>${product.description }</td>
				<td>${product.pages }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Products</title>
</head>
<body>


<form action="/book-store/products" method="POST">
	<div>
		<label>Title</label>
		<input type="text" name="title">
	</div>
	<div>
		<label>Description</label>
		<textarea rows="10" cols="20" name="description"></textarea>		
	</div>
	<div>
		<label>Pages:</label>
		<input type="text" name="pages">
	</div>
	<button type="submit">Submit</button>
</form>

</body>
</html>
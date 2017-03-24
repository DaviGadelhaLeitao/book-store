<%@ include file="/WEB-INF/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:url value="/resources/css" var="cssPath"></c:url>
	<c:url value="/resources/js" var="jsPath"></c:url>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="${cssPath}/bookStore.css" >
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div class="main">
		<div class="container">
			<form:form servletRelativeAction="/login" method="POST">
				<div class="form-group">
					<label>Email:</label>
					<input type="text" name="username" class="form-control"/>
				</div>
				<div>
					<form:errors path="username"></form:errors>
				</div>
				<div class="form-group">
					<label>
						<fmt:message key="login.password"></fmt:message>
					</label>
					<input type="password" name="password" class="form-control"/>
				</div>
				<div>
					<form:errors path="password"></form:errors>
				</div>
				
			<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
	<script type="text/javascript" src="${jsPath}/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/npm.js"></script>
	<script type="text/javascript" src="${jsPath}/header.js"></script>
</html>
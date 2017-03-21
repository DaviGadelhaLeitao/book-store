<%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:url value="/resources/css" var="cssPath"></c:url>
	<c:url value="/resources/js" var="jsPath"></c:url>
	<link type="text/css" rel="stylesheet" href="css/testaJavaScript.css">
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="${cssPath}/bookStore.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function inserirMensagem() {
		document.write("<p>ok deu tudo certo.");
	}
	
</script>
</head>

<body>
<button onclick="inserirMensagem();">Click me</button>
</body>
	<script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/npm.js"></script>
	<script type="text/javascript" src="${jsPath}/jquery-3.2.0.min.js"></script>
</html>
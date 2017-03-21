<%@ include file="/WEB-INF/includes.jsp"%>
<html>
<head>
	<c:url value="/resources/css" var="cssPath"></c:url>
	<c:url value="/resources/js" var="jsPath"></c:url>
	<link type="text/css" rel="stylesheet" href="css/testaJavaScript.css">
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="${cssPath}/bookStore.css" >
</head>
<body>

	<input id="msg" value="">
	<button onclick="meuAlerta()" name="">Clique aqui.</button>
	<div id="msgResposta"></div>


</body>
<script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
<script type="text/javascript" src="${jsPath}/npm.js"></script>
<script type="text/javascript" src="${jsPath}/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${jsPath}/testaJavaScript.js"></script>
</html>
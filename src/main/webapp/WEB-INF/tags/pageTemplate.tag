<%@ include file="/WEB-INF/includes.jsp"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:url value="/resources/css" var="cssPath"></c:url>
	<c:url value="/resources/js" var="jsPath"></c:url>
	<c:url value="/resources/images" var="imagesPath"></c:url>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" >
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="${cssPath}/bookStore.css" >
	<title>${title} - Book Store</title>
</head>

<%@ include file="/WEB-INF/views/header.jsp" %>

<jsp:doBody />

<%@ include file="/WEB-INF/views/footer.jsp" %>

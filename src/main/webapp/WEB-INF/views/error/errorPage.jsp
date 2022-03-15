<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
		<img style="background-size:cover; width: 100%; height: 100%;" src="/resources/images/error/error.jpg"/>
	</c:if>	
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		<img style="background-size:cover; width: 100%; height: 100%;" src="/resources/images/error/error.jpg"/>
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
		<img style="background-size:cover; width: 100%; height: 100%;" src="/resources/images/error/error.jpg"/>	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		<img style="background-size:cover; width: 100%; height: 100%;" src="/resources/images/error/error.jpg"/>	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
		<img style="background-size:cover; width: 100%; height: 100%;" src="/resources/images/error/error.jpg"/>	</c:if>

</body>
</html>
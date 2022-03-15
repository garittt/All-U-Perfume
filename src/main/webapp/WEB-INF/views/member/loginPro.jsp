<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
	<c:if test="${sessionScope.id == null}">
	<script>
		alert("id/pw를 확인하세요");
		history.go(-1);
	</script>
</c:if>

<c:if test="${sessionScope.id != null}">
	<script>
		alert("로그인 되었습니다.");
		window.location="/member/main";
	</script>
</c:if>
	
	
	
</body>
</html>
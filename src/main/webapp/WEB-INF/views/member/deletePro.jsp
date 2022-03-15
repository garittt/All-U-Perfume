<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>

<c:if test="${result == 1}">
	<script>
		alert("탈퇴 되었습니다.");
		window.close();
		opener.parent.location="/member/login";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script>
		alert("비밀번호를 확인하세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
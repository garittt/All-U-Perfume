<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
<c:if test="${result == 1 }">
	<script>
		alert ("글쓰기 완료 ");
		window.close();
		opener.parent.location="/mypage/inquiry";
	
	</script>
</c:if>


</body>
</html>
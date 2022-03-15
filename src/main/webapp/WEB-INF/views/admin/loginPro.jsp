<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
</head>

<body>
	<c:if test="${sessionScope.aid == null}">
	<script>
		alert("id/pw를 확인하세요");
		history.go(-1);
	</script>
</c:if>

<c:if test="${sessionScope.aid != null}">
	<script>
		alert("로그인 되었습니다.");
		window.location="/admin/main";
	</script>
</c:if>
</body>
</html>
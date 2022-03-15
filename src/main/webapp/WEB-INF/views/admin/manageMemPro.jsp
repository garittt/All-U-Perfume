<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
</head>
<body>

<c:if test="${sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/admin/login";
	</script>
</c:if> 

<c:if test="${sessionScope.aid != null}">
	<c:if test="${result == 1}">
		<script type="text/javascript">
		alert('회원 탈퇴가 완료되었습니다.');
		 window.location="/admin/manageMem";
		</script>
	</c:if>
</c:if>

</body>
</html>
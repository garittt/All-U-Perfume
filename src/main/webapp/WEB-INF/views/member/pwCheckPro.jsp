<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
<c:if test="${result ==1}"></c:if>	
	<script type="text/javascript">
		alert("비밀번호가 성공적으로 변경되었습니다!");
		window.close();
	</script>
</body>
</html>
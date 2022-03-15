<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result != null}">
회원님의 비밀번호는 [${result.pw}]입니다.<label id ="findPw"/><br/>
<input type="button" value="로그인 하러가기" onclick="window.location = '/member/login';">
</c:if>

<c:if test="${result = null}">
해당 id로 가입되지 않았습니다. <br/>
<input type="button" value="돌아가기" onclick="window.location = '/member/login';">
</c:if>


</body>
</html>
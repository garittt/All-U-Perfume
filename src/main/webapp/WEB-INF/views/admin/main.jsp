<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/main.css">
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
<div class="bo1"></div>
<c:if test="${sessionScope.aid != null}">
		
	<p style = "font-size :25px;">관리자님, 환영합니다!</p><br/><br/>
	<input type="button" value="메인"  onclick="window.location = '/main/list'"><br/><br/>
	<input type="button" value="공지 게시판"  onclick="window.location = '/notice/list?boardnum=3'"><br/><br/>
	<input type="button" value="향수추천 게시판"  onclick="window.location = '/best/list?boardnum=2'"><br/><br/>
	<input type="button" value="Q&A 게시판"  onclick="window.location = '/q/list?boardnum=1'"><br/><br/>
	<input type="button" value="1:1 문의 게시판"  onclick="window.location = '/admin/inquiry'"><br/><br/>
	<input type="button" value="회원 강제 탈퇴"  onclick="window.location = '/admin/manageMem'"><br/><br/>
	<input type="button" value="로그아웃" onclick="window.location='/admin/logout'" /><br/><br/>
</c:if>



</body>
</html>
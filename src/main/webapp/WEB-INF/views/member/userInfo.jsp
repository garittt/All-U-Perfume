<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>

<c:if test="${sessionScope.id !=null}">
<img src="/resources/images/img/${MemberDTO.img}" width="100" />
<input type="button" value="사진 변경" onclick="window.location='/member/imgUpdate'" />
<br />

	id : ${MemberDTO.id} <br />
	name : ${MemberDTO.name} <br />	
	birth : <fmt:formatDate value="${MemberDTO.birthday}" type="date" /> <br />
	regdate : <fmt:formatDate value="${MemberDTO.regdate}" type="date" /> <br />
	
	<input type="button" value="비밀번호 변경" onclick="window.location='/member/pwCheck?id=${sessionScope.id}'">
	<input type="button" value="탈퇴" onclick="window.location='/member/delete'" />

</c:if>

<c:if test="${sessionScope.kid != null}">
<img src="${MemberDTO.img}" width="100" />
<br />

	id : ${MemberDTO.id} <br />
	name : ${MemberDTO.name} <br />	
	regdate : <fmt:formatDate value="${MemberDTO.regdate}" type="date" /> <br />
	<input type="button" value="탈퇴" onclick="window.location='/member/delete'" />

</c:if>

<c:if test="${sessionScope.id == null && sessionScope.kid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location = "/member/login";
	</script>
</c:if>

</body>
</html>
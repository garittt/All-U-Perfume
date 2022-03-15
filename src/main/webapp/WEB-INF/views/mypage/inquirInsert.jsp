<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/popup.css">
<html>
<style>
.inputsmall{
	
width: 90px; 
height : 30px; 
border :none; 
background-color:#76448A; 
color : white; 
border-radius: 10px; 
font-size : 15px;"

}
</style>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>
<c:if test="${sessionScope.id != null}" >
<form action="/mypage/inquirInsertPro" method="post">

	<input type="hidden" name = "id" value = "${sessionScope.id}" />
	<div class="bo1" style="height:120px;"></div>
	<div style="font-size:20px;">${sessionScope.id } 님 무엇을 도와드릴까요!<br/>
	요청사항을 보내주세요. 최선을 다해 답변드리겠습니다</div> <br/>
	<table>
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="subject" style="width:500; height:30;"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>
				<textarea rows="10" cols="50" name="ms_content"  style="width:500; height:300;"></textarea> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" class="inputsmall"/>
			</td>
		</tr>
	</table>
	
</form>
</c:if>
<c:if test="${sessionScope.kid != null}" >
<form action="/mypage/inquirInsertPro" method="post">

	<input type="hidden" name = "id" value = "${sessionScope.kid}" />
	<div class="bo1" style="height:120px;"></div>
	<div style="font-size:20px;">${sessionScope.kid } 님 무엇을 도와드릴까요!<br/>
	요청사항을 보내주세요. 최선을 다해 답변드리겠습니다</div> <br/>
	<table>
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="subject" style="width:500; height:30;"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>
				<textarea rows="10" cols="50" name="ms_content"  style="width:500; height:300;"></textarea> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" class="inputsmall"/>
			</td>
		</tr>
	</table>
</form>
</c:if>
</body>
</html>
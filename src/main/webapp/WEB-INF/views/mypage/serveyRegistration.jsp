<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/popup.css"> 
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>

<div class = "bo1"></div>
<c:if test="${ content1.size() != 0 }">
	<table >
		<tr>
		<td><b>새로 등록된 향수 입니다.</b></td>
		</tr >
		<c:forEach items="${content1}" var = "content" >
			<tr>
			<td>${content.f_namee}</td>
			</tr>
		</c:forEach>
	</table>
</c:if><br/><br/>
<c:if test="${ content2.size() != 0 }">
	<table >
		<tr >
			<td><b>이미 등록된 향수입니다.</b></td>
		</tr>
		<c:forEach items="${content2}" var = "content" >
			<tr>
			<td>${content.f_namee}</td>
			</tr>
		</c:forEach>
	</table>
</c:if><br/><br/>
	
<input type="button" value="확인" onclick="window.close()" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;">


	
</body>
</html>
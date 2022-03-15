<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
<style>
.ebox {
	text-align:center;
	font-size:1.5em;
	height: 100px;
 	width: 100%;
 	line-height:150px; 	
}

input{
	width:3cm;
	height:1cm; 
	border :none; 
	background-color:#76448A; 
	color : white; 
	border-radius: 10px;
}

</style>

</head>
<body style = "text-align:center; font-size:1.5em;">
<div class = "ebox"></div>
<c:if test="${ check == 1 }" >
	등록 완료!	
</c:if>

<c:if test="${ check == 0 }" >
	이미 등록된 향수입니다!
</c:if>
<br/>
<br/>

<input type="button"  value ="확인" onclick ="window.close()" />


</body>
</html>
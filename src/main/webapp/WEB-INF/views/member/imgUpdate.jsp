<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/popup.css">

<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
	<div class="bo1"></div>
	 <form action="/member/imgUpdatePro" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="id" value="${sessionScope.id}" />
    	<div class="filebox">
    		<label for="ex_file">사진 선택</label> 
    		<input type="file" id="ex_file"name="file">
    	</div>
		<br/><br/>
    	<input class="input" type="submit" value="전송" />
    </form>
</body>


</html>
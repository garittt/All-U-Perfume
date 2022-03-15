<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/login.css">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
	<div class="bo1">관리자만 로그인 할 수 있습니다.</div>
	<div class="bo2"> </div>
	
	<div class="bo3">All U Perfume</div>
		<div >
			<form action="/admin/loginPro" method="post">
				<table></table>
				<b style = "font-size:25px;" >ID :</d> <input type="text" name="aid"  class="st"/> <br/><br/>
				<b style = "font-size:25px;" >PW :</d><input type="password" name="pw" class="st"/> <br/><br/>
				<input type="submit" value="로그인" style = "color : white; font-size:25px; width: 500px; height: 50px; border-radius: 10px; border: none; background: #76448A;"> <br/><br/>
			</form>
		</div>
</body>
</html>
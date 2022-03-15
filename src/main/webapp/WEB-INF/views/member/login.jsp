<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>    
<script src="/resources/js/kakaoLogin.js"></script>
<link rel="stylesheet" href="/resources/css/login.css">
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>

</head>
<body>
	<div class="bo1">10,000개가 넘는 데이터 베이스를 기반으로 한 <b>설문</b>을 통해</div>
	<div class="bo2">당신만의 향기를 찾아 드립니다. </div>
	
	<div class="bo3">All U Perfume</div>
		<div >
			<form action="/member/loginPro" method="post">
				<table></table>
				<b style = "font-size:25px;" >ID :</b> <input type="text" name="id"  class="st"/> <br/><br/>
				<b style = "font-size:25px;" >PW :</b><input type="password" name="pw" class="st"/> <br/><br/>
				<input type="submit" value="로그인" style = "color : white; font-size:25px; width: 500px; height: 50px; border-radius: 10px; border: none; background: #76448A;"> <br/><br/>
			</form>
			<input type="button" value="회원가입" onclick="window.location='/member/register'" style = "color : white; font-size:25px; width: 500px; height: 50px; border-radius: 10px; border: none; background: #76448A;"/><br/><br/>                    
			<input type="button" value="관리자 로그인" onclick="window.location='/admin/login'" style = "color : white; font-size:25px; width: 500px; height: 50px; border-radius: 10px; border: none; background: #76448A;"/><br/><br/>                    
			<a href="javascript:kakaoLogin();"><img src="/resources/images/kakao_login_medium_wide.png" alt="카카오계정 로그인" style="height: 50px;"/></a>

		</div>


</body>
</html>
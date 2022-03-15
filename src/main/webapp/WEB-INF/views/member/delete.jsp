<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>  
<link rel="stylesheet" href="/resources/css/popup.css"> 

<script>
		function ok_button() {
			if(window.confirm('정말 탈퇴하시겠습니까?')){
				$.ajax({
					type : "post" ,
					url : "/member/kakaoDeletePro" ,
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						id : $("#id").val()
					}) , 
					async : false,
					success : function(data){	
						
						alert("탈퇴되었습니다.");
						window.close();
						window.opener.location="/member/login";
					}
				});
			}else{
				//They clicked no
				alert('개인정보 조회 페이지로 이동합니다.');
				window.close();
			}
		}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>



<c:if test="${sessionScope.id != null}">
	<div class="bo1"></div>
	<form action="/member/deletePro" method="post">
 		<input type="hidden" name="id" value="${sessionScope.id}" />
 		 비밀 번호를 입력하세요. <br/><br/>
 		<input type="password" name="pw" style= "width: 500px; height :30px;"/> <br/><br/>
 		<input type="submit" value="탈퇴" id="submitBtn" class = "input"/>
	</form>
</c:if>


<c:if test="${sessionScope.kid != null}">
	<div class="bo1"></div>
	<form action="/member/login" method="post" onsubmit="ok_button();">
   		 <input type="hidden" id="id" name="id" value="${sessionScope.kid}" />
   		 탈퇴를 원하시면 아래 버튼을 눌러 주세요. <br/><br/>
   		 <input type="submit" value="탈퇴" id="submitBtn" class = "input" />
	</form>
</c:if>
	
<c:if test="${sessionScope.id == null && sessionScope.kid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location = "/member/login";
	</script>
</c:if>

</body>
</html>
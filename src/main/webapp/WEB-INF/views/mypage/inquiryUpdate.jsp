<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css"> 

<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
<c:if test="${sessionScope.id == null && sessionScope.kid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>
</head>
<body>
<div class="aa">
	<header>
		<div class="wrapper">
			<h1><a href="/member/main" style="color : white ;">All U Perfume</a></h1>
			<nav>
				<ul class="menu">
					<li>
						<c:if test="${sessionScope.id != null}">
							<a href="/member/logout">로그아웃</a>
						</c:if>
						<c:if test="${sessionScope.kid != null}">
							<a href="kakaoLogout();">로그아웃</a>
						</c:if>
					</li>
					<li><a href="/mypage/main">마이페이지</a></li>
					<li><a href="/q/list?boardnum=1">Q & A</a></li>
					<li><a href="/notice/list?boardnum=3">공지사항</a></li>
					<li><a href="/best/list?boardnum=2">향수 추천</a></li>
					<li><a href="/main/list">메인</a></li>
					<li><a href="/survey/surveyStart">설문</a></li>
				</ul>
			</nav>
		</div>
	</header>
</div> <hr color = "white" size = "2px"/>

<form action="/mypage/inquiryUpdatePro?num=${inquiry.num}" method="post">
	<input type="hidden" name = "id" value = "${sessionScope.id}" />
	<div class="a"> 
		<table class="type04" style = "text-align: center ;">
			<tr>
				<td>등록일</td>
				<td>${inquiry.creat_date}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"  value=" ${inquiry.subject}"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="20" name="ms_content" >${inquiry.ms_content}</textarea></td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type="submit" value="등록"  style="width:90px;height:40px;border :none; background-color:#76448A; color : white; border-radius: 10px;font-size : 15px;"/>
				</td>
			</tr>			
		</table>
	</div>
</form>

<script>
Kakao.init('b39601cdde217504460c15ddd71b1b47');
//카카오로그아웃  
  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      $.ajax({
    	  url: "/member/kLogout",
          type: "POST",
          contentType : "application/json; charset=UTF-8",
          async: false,
          success: function(data){
              alert("로그아웃 되었습니다.");
              window.location="/member/login";
          } 
      });
    })
  }
</script>
</body>
</html>
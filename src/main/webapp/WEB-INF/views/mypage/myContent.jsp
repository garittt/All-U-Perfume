<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<link rel="stylesheet" href="/resources/css/main.css">
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
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
<div class="bo1"></div>
<p style = "font-size :25px;"><b>내 작성글 보러가기<p><br/><br/>
<input type="button" value="Q & A"  onclick="window.location='/mypage/myContentQA'"><br/><br/>
<input type="button" value="향수 추천"  onclick="window.location='/mypage/myContentRecmd'"><br/><br/>
<c:if test="${sessionScope.id != null && sessionScope.kid == null }">
<input type="button" value="내가 쓴 리뷰" onclick="window.location='/main/myReview?writer=${sessionScope.id}'" />
</c:if>
<c:if test="${sessionScope.id == null && sessionScope.kid != null }">
<input type="button" value="내가 쓴 리뷰" onclick="window.location='/main/myReview?writer=${sessionScope.kid}'" />
</c:if>
	

<script>
function a(){
	var url = "/mypage/myContentQA";
	var name = "Q&A";
	var option =  "width = 500, height = 500, top = 100, left = 200, location = no" ; 
	
	window.open(url, name ,option)
}
function b(){
	var url = "/mypage/myContentRecmd";
	var name = "recommend";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no" ; 
	window.open(url, name ,option)
}

</script>
</body>
</html>
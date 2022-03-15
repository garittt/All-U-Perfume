<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<link rel="stylesheet" href="/resources/css/survey.css">
<style>
.aa{
	font-size : 16px;
	height :30px;
	color:#7b7b7b;

}
.textBox {

	border-radius: 1em;
	height: 180px;
 	width: 800px;
 	cursor: pointer;
 	background-color : white;
 	line-height:40px;
 	object-fit: cover;
 	overflow:hidden;
 	margin:0 auto;
 	font-weight: 500;
 	font-size : 20px;
 	text-align : center;
    
}

</style>

<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>

</head>

<body>
<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>

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
						<c:if test="${sessionScope.aid != null}">
							<a href=/admin/logout>로그아웃</a>
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

<div class="header">설문 방식을 선택해 주세요.</div>
    <div class="body">
        <div class="content">
        <div class = "temp2"></div>
			<div class="textBox" onclick="window.location= '/survey/accSurvey'" >
				<br/>
		    	구체적 설문
		    	<p class="aa" >전문가를 대상으로 한 설문으로 열두 가지의 향료 분류 중<br/>
		    	선택하신 세 가지의 향료군을 담고 있는 향수를 추천드리고 있습니다.</p>
		    	
		    </div>
		    <br/>
		    <div class="textBox" onclick="window.location= '/survey/absSurvey'" >
		    	<br/>
		    	추상적 설문
		    	<p class="aa" >초심자를 대상으로 한 설문으로 좋아하는 분위기의 향기와 이미지,<br/>  그리고 키워드를 통해 상상하신 향에 보다 가까운 향수를 추천드리고 있습니다.</p>
		    </div>
   		</div>
    </div>
<div class="footer"></div>

	
</body>
</html>
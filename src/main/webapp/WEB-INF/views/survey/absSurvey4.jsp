<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<link rel="stylesheet" href="/resources/css/survey.css">

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


<div class="header">좋아하는 분위기의 단어를 골라주세요.</div>
    <div class="body">
        <div class="content">
        	<div class = "temp2"></div>
	    		<c:forEach items="${fourth}" var="absSurvey4">	
			           		<div class="imagebox">
			           			<img class="image" src="/resources/images/survey/${absSurvey4.fourth}.jpg" onclick="abs4('${absSurvey4.fourth}')" >
			           		</div>
			           		<br/>
			            <div class = "textBox">${absSurvey4.survey}</div>
			            
				</c:forEach>
		</div>
    </div>
<div class="footer"></div>

<script>
    function abs4(fourth){
        window.location.href="/survey/absSurvey5?gender=${absSurveyDTO.gender}&season=${absSurveyDTO.season}&third=${absSurveyDTO.third}&fourth="+fourth;
    }
</script>

</body>
</html>
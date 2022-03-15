<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div class="header"></div>
    <div class="body">
        <div class="content" style = "font-size:20px" >
        <div class = "temp2"></div>
        	회원님이 고르신 성별은 
			<c:forEach items="${survey1}" var="survey1">
				<b style = "font-size:25px; color:#76448A;">${survey1.survey}</b>
				
	 		</c:forEach>이시군요!<br/><br/>
	
			<c:forEach items="${survey2}" var="survey2">
				<b style = "font-size:25px; color:#76448A;">${survey2.survey}</b>
			</c:forEach>의 정취가 담긴 향수를 찾고 계시네요.<br/><br/>
	 
			<c:forEach items="${survey3}" var="survey3">
				<b style = "font-size:25px; color:#76448A;">${survey3.survey}</b>
	 		</c:forEach>가 담긴 향수,<br/><br/>
	 
	 		<c:forEach items="${survey4}" var="survey4">
				<b style = "font-size:25px; color:#76448A;">${survey4.survey}</b>
	 		</c:forEach>같은 이미지가 그려지는 향수,<br/><br/>
	
	 		<c:forEach items="${survey5}" var="survey5">
				<b style = "font-size:25px; color:#76448A;">${survey5.survey}</b>
	 		</c:forEach>이라는 단어가 어울리는 향수.<br/><br/>
	 
			All U Perfume이 오늘, 당신의 향수를 찾아드릴게요.<br/><br/>
	
			찾으시는 분위기가 맞나요?<br/><br/><br/><br/>
	
			<c:forEach items="${survey5}" var="survey5">
				<div class="textBox4"   onclick="a('${survey5.note}' ,'')" >
				네, 맞아요</div>
			</c:forEach><br/>
			<div class="textBox4"  onclick="b()" >다시 알아볼래요</div>
	
   		</div>
    </div>
<div class="footer"></div>

<script>
    function a(result){
        window.location.href="/survey/absSurveyResult?note="+result+"&gender=${gender}&season=${season}";    
    }
    function b(){
        window.location.href="/survey/absSurvey";   
    }
</script>
</body>
</html>
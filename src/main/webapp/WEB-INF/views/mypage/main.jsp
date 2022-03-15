<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<link rel="stylesheet" href="/resources/css/mypage.css">
<link rel="stylesheet" href="/resources/css/board.css">  
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>

</head>
<body>
<c:if test="${sessionScope.id == null && sessionScope.kid == null}">
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

<c:if test="${sessionScope.id !=null}">
	<div class="bo1"></div>
		<div class = "bo2">
			<div class="bo3">
				<img  class="image" src="/resources/images/img/${MemberDTO.img}" width="100" />
			</div><br/>
			<div >
				<input style="font-size:13px; width: 60px; height: 30px;" type="button" value="사진 변경" onclick="window.open('/member/imgUpdate', 'pop01', 'top=10, left=10, width=500, height=500, status=no, menubar=no, toolbar=no, resizable=no')" /><br/><br/>
				ID : <b> ${MemberDTO.id} </b><br />
				NAME :<b> ${MemberDTO.name}</b> <br />	
				BIRTH : <b> <fmt:formatDate value="${MemberDTO.birthday}" type="date" /> </b><br />
				JOINED DATE :<b> <fmt:formatDate value="${MemberDTO.regdate}" type="date" /> </b><br />
			</div>
		</div>
	<input type="button" value="위시리스트" onclick="window.location ='/mypage/wishList'" /><br/><br/>
	<input type="button" value="1:1 문의" onclick="window.location = '/mypage/inquiry'" /><br/><br/>
	<input type="button" value="내 작성 글" onclick="window.location = '/mypage/myContent'" /><br/><br/>
	<input type="button" value="비밀번호 변경" onclick="window.open('/member/pwCheck?id=${sessionScope.id}', 'pop01', 'top=10, left=10, width=500, height=500, status=no, menubar=no, toolbar=no, resizable=no');"><br/><br/>
	<input type="button" value="탈퇴" onclick="d()" /><br/><br/>
</c:if>

<c:if test="${sessionScope.kid != null}">
<img src="${MemberDTO.img}" width="100" />
<br />

	ID : ${MemberDTO.id} <br />
	NAME : ${MemberDTO.name} <br />	
	JOINED DATE : <fmt:formatDate value="${MemberDTO.regdate}" type="date" /> <br />
	<input type="button" value="위시리스트" onclick="window.location ='/mypage/wishList'" /><br/><br/>
	<input type="button" value="1:1 문의" onclick="window.location = '/mypage/inquiry'" /><br/><br/>
	<input type="button" value="내 작성 글" onclick="window.location = '/mypage/myContent'" /><br/><br/>
	<input type="button" value="탈퇴" onclick="d()" />

</c:if>
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
<script>

function d(){
	var url = "/member/delete";
	var name = "delete" ; 
	var option = "width = 500, height = 500, top = 100, left = 200, location = no" ; 
	window.open(url , name, option);
}

</script>




</body>
</html>
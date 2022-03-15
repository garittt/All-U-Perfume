<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
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

<div class="aaaa"> 내 작성글 보기 </div>
<c:if test="${count == 0 }" >
	<div class = "a">
	<table class = "type04" style="text-align: center; ">
		<tr>
			<th colspan = "2" style = "font-size : 20px; text-align: center;"> 향수 추천 게시판 </th>
		</tr>
		<tr>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<tr>
			<td colspan = "2" style = "text-align: center;">작성글이 없습니다.</td>
		</tr>
	</table>
	</div>
</c:if>
<c:if test="${count > 0 }" >
	<div class="a"> 
	<table class="type04" style="text-align: center; ">
		<tr>
			<th colspan = "2" style = "font-size : 20px; text-align: center;"> 향수 추천 게시판 </th>
		</tr>
		<tr>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${articleList}" var = "r">
			<tr>
				<td><a href="/best/list?boardnum=2">${r.subject}</a></td>
				<td>${r.reg_date}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2" style = " text-align: center;">
				<c:set var="pageCount" value="${count/ pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<c:set var="pageBlock" value="${10 }" />
				<fmt:parseNumber var ="result" value="${currentPage/10}" integerOnly="true"/>
				<c:set var="startPage" value="${result *10 +1}"/>
				<c:set var="endPage" value="${startPage + pageBlock -1 }"/>
				<c:if test="${endPage > pageCount}">
			        <c:set var="endPage" value="${pageCount}"/>
			    </c:if> 
				<c:if test="${ startPage >10}" >
					<a href="/mypage/myContentRecmd?pageNum=${startPage-10}">[이전]</a>
				</c:if>
				<c:forEach var="g" begin="${startPage}" end="${endPage}">
					<a href="/mypage/myContentRecmd?pageNum=${g}">[${g}]</a>
				</c:forEach>
				<c:if test="${ endPage < pageCount}" >
					<a href="/mypage/myContentRecmd?pageNum=${startPage+10}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
	</div>
</c:if>	

</body>
</html>
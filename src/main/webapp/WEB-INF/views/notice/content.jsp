<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  

<title>당신만의 향기, All U Perfume</title>

<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null}">
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
					<li><a href="/best/list?boarednum=2">향수 추천</a></li>
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

<script>
	function contentDelete(number){
		if(window.confirm('게시글을 삭제하시겠습니까?')){
			$.ajax({
				data : { b_number : number },
				url : '/notice/delete',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('삭제되었습니다.');
						window.location='/notice/list';
					}
				}
			});
		} else {
			return false;
		}
	}
</script>

<div class="aaaa">공지사항 게시판</div>

<c:if test="${sessionScope.id != null || sessionScope.kid != null || sessionScope.aid !=null}">
<div class="a" > 
	<table class="type04" style = "text-align : center;">
		<tr>
			<td>
				<td colspan="4" style = "text-align : right;">
				<input type="button" onclick="window.location = '/notice/list'"  value="목록 보기" class="inputsmall" />
				<c:if test="${sessionScope.aid != null}"> 
					<input type="button" onclick="window.location = '/notice/update?b_number=${boardDTO.b_number}'"  value="수정" class="inputsmall" />
					<input type="button" onclick="contentDelete('${boardDTO.b_number}')"  value="삭제" class="inputsmall" /> 
				</c:if>
			</td>
		</tr>
		<tr>
			<th class="active" >제목</th>
			<th class="active"> 작성일 </th>
			<th class="active"> 조회수 </th>
		</tr>
		<tr>
			<td>${boardDTO.subject}</td>
			<td>${boardDTO.reg_date}</td>
			<td>${boardDTO.readcount}</td>
		</tr>
			<tr>
				<th class="active" colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4" style = "height : 300px;">
					<pre>
					${boardDTO.content}
					</pre>
					
				</td>
			</tr>
	</table>
</div>
</c:if>		
		

		
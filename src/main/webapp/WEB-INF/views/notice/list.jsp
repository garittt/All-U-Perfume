<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>당신만의 향기, All U Perfume</title>
<style>
.inputsmall{
	
width: 90px; 
height : 30px; 
border :none; 
background-color:#76448A; 
color : white; 
border-radius: 10px; 
font-size : 15px;"

}
</style>


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
	function valueCheck(){
		if($('#search-category').val() == ''){
			alert('카테고리를 선택하세요.')
			return false;
		}
	}
</script>
    
<div class="aaaa">공지사항 게시판</div>

<c:if test="${count == 0}">
	<div class="a"> 
	<table class="type04" style = "text-align : center;" >
		<tr>
			<td colspan = "5"  style="text-align: right; ">
				<input  class= "inputsmall" type = "button" value = "글 쓰기" onclick="window.location='/notice/write'"/>
			</td>
		</tr>
		<tr>
			<th> 글번호 </th>
			<th> 글제목 </th>
			<th> 작성일 </th>
			<th> 조회수 </th>
		</tr> 
		<tr>
			<td colspan="5" style = "height : 300px;">
				작성된 게시글이 없습니다.
			</td>
		</tr>
	</table>
	</div>
</c:if>

<c:if test="${count > 0}">
	<div class="a"> 
	<table class="type04"  style = "text-align : center;">
		<tr>
			<td colspan = "4" style="text-align: right;">
				<c:if test="${sessionScope.aid != null}">
					<input type = "button" value = "글 쓰기" onclick="window.location='/notice/write'" class="inputsmall"/>
				</c:if>
			</td>
		</tr>
	
		<tr>
			<th> 글번호 </th>
			<th> 글제목 </th>
			<th> 작성일 </th>
			<th> 조회수 </th>
		</tr> 
		<c:forEach items="${list}" var="boardDTO" > 
		<tr>
			<td> ${boardDTO.b_number} </td>
			<td> <a href="/notice/readcountUp?b_number=${boardDTO.b_number}">${boardDTO.subject}</a> </td>
			<td> ${boardDTO.reg_date} </td>
			<td> ${boardDTO.readcount} </td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "4"  style="text-align: center; ">
				<form action="/notice/searchList" method="post" onsubmit="return valueCheck()">
				    <select id="search-category" name="category" style="width: 100px; height : 30px; font-size : 15px;">
				      <option selected value="">선택하세요</option>
				      <option value="subject">제목</option>
				      <option value="content">내용</option>
				    </select>
				  
				    <input type="text" placeholder="검색어를 입력하세요" id="search-input" name="input" style="width: 250px; height : 30px; font-size : 15px;">
				    <button type="submit" id="search-btn" class= "inputsmall">검색</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan = "4"  style="text-align: center; ">
				<c:if test="${pageMaker.prev}">
					<a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
				</c:if>
							
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<a href="${pageMaker.makeQuery(idx)}">${idx}</a>	
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="list${pageMaker.makeQuery(pageMaker.endPage+1)}">다음</a>
				</c:if>
			</td>
		</tr>
		
	</table>
	</div>
</c:if>


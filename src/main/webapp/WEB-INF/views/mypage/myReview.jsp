<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<style>
.type03 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center; 
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
 th {
  width: 200px;
  padding: 10px;
  font-weight: 10px;
  /* vertical-align: top; */
  border-bottom: 1px solid #ccc;
  text-align: center; 
  
}
td {
  width: 200px;
  padding: 10px;
  /* vertical-align: top; */
  border-bottom: 1px solid #ccc;
  text-align: center; 
}
</style>
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





<div class ="a">
<table  class = "type3">
	<tr>
	<th colspan = "7" style = "font-size : 20px; text-align: center;">
		<c:if test="${sessionScope.id != null}">
			${sessionScope.id}님의 리뷰
		</c:if>
		<c:if test="${sessionScope.kid != null}">
			${sessionScope.kid}님의 리뷰
		</c:if>
	</th>
	</tr>
	<tr>
		<td>리뷰 번호</td>
		<td>게시글 번호</td>
		<td>긍정적 리뷰</td>
		<td>부정적 리뷰</td>
		<td>작성 날짜</td>
		<td>좋아요</td>
		<td>싫어요</td>
	</tr>
	<c:forEach items="${myreview}" var="my">
		<tr>
			<td><input type = "checkbox"  name="r_number" value="${my.r_number}"/>${my.r_number}</td>
			<td>${my.p_number}</td>
			<td><a href="/main/reviewRe?r_number=${my.r_number}" 
			onclick="window.open(this.href,'Re', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');return false;">
			${my.like_re}</a></td>
			<td><a href="/main/reviewRe?r_number=${my.r_number}" 
			onclick="window.open(this.href,'Re', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');return false;">
			${my.unlike_re}</a></td>
			<td>${my.reg_date}</td>
			<td>${my.like_re_heart}</td>
			<td>${my.unlike_re_heart}</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan = "7">
			<div id="page">
				<ul>
					<c:if test="${pageMaker.prev}">
						<a href="/main/myReview${pageMaker.makeQuery(pageMaker.startPage - 1)}&writer=${writer}">이전</a>
					</c:if>
						
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<a href="/main/myReview${pageMaker.makeQuery(idx)}&writer=${writer}">${idx}</a>	
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a href="/main/myReview${pageMaker.makeQuery(pageMaker.endPage+1)}&writer=${writer}">다음</a>
					</c:if>
				</ul>
			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan = "7">
			<input type="button" onclick="deleteValue();" value="선택삭제하기" style="width:110px;height:30px;border :none; background-color:#76448A; color : white; border-radius: 10px;font-size : 15px;"/>
		</td>
	</tr>
</table>
</div>	





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
   $(function(){
	   var chkObj = document.getElementsByName("r_number");
	   var rowCnt = chkObj.length;
   });
	function deleteValue(){
		var url = "/admin/reviewDe";
		var valueArr = new Array();
		var rlist = $("input[name='r_number']");
		for (var i = 0; i < rlist.length; i++) {
			if(rlist[i].checked){ 
				valueArr.push(rlist[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm ("정말 삭제하시겠습니까?");
			$.ajax({
				url : url, 
				traditional : true, 
				data : {
					valueArr : valueArr 
				},
				success: function(jdata) {
					console.log(jdata);
					a = parseInt(jdata);
					if(a >= 1) {
						alert("삭제 성공");
						window.location.reload();
					}
					else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
</script>



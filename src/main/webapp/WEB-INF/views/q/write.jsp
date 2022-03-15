<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
					<li><a href="/q/list?boardnum=1">Q&A</a></li>
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


<div class="aaaa">Q & A 게시판</div>
<div class="a"> 
	<form id="writeForm">
		<input type="hidden" name="boardnum" value="${boardDTO.boardnum}">
		<input type="hidden" name="b_number" value="${boardDTO.b_number}">
		<table class="type04" style = "text-align : center; width: 800px; height : 600px; ">
			<tr>
				<td><h3>작성자</h3></td>
				<td>
					<c:if test="${sessionScope.id != null }">
						${sessionScope.id} 님 
						<input type = "hidden" name="writer" value="${sessionScope.id}"/> 
					</c:if>
					<c:if test="${sessionScope.kid != null }">
						${sessionScope.kid} 님 
						<input type = "hidden" name="writer" value="${sessionScope.kid}"/> 
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2"><h3>제 목</h3></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="subject" id="subject" style="width: 800px; height : 30px; font-size : 20px;"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><h3>내 용</h3></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="20" name="content" id="content" style="width: 800px; height : 400px; font-size : 20px;"></textarea> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="글쓰기" onclick="writeSubmit()"  class="inputsmall"/>
				</td>
			</tr>
	    </table>
    </form>
</div>

<script>
// form에 입력된 정보를 json 형태로 파싱해주는 코드
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};

function writeSubmit(){
	
	if($('#subject').val() == ''){
		alert("제목을 입력하세요.");
		document.getElementById('subject').focus();
		return false;
	} else if($('#content').val() == ''){
		alert("내용을 입력하세요.");
		document.getElementById('content').focus();
		return false;
	}
	
	var writeData = JSON.stringify($('form#writeForm').serializeObject());
	
	$.ajax({
		data : writeData,
		url : "/q/writePro",
		type : "POST",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			if(data == 1){
				alert('작성되었습니다.')
				window.location='/q/list?boardnum=1'
			}
		}
	});
	
};
</script>





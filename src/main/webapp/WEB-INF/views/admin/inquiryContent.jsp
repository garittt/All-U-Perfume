<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/board.css">  
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
<c:if test="${sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/admin/login";
	</script>
</c:if>
<script >
function a(num){
	alert ("게시물 삭제 완료");
	window.location="/mypage/inquiryDelete?num="+num;
}

</script>
</head>
<body>
<div class="aa">
	<header>
		<div class="wrapper">
			<h1><a href="/admin/main" style="color : white ;">All U Perfume</a></h1>
			<nav>
				<ul class="menu">
					<li>
						<c:if test="${sessionScope.aid != null}">
							<a href=/admin/logout>로그아웃</a>
						</c:if>
					</li>
					<li><a href="/admin/main">관리자 페이지</a></li>
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

	<div class="a"> 
	<table class="type04" style = "text-align : center; width: 800px; ">
		<tr>
			<td colspan="3">
				<input type="button" value="게시물 삭제" onclick="a(${inquiry.num})" class="inputsmall"/>
			</td>
		</tr>
		<tr>
			<td ><b>제목</b></td>
			<td colspan="2">
				${inquiry.subject}
			</td>
		</tr>
		<tr>
			<td ><b>등록일</b></td>
			<td colspan="2">
			<fmt:formatDate value="${inquiry.creat_date}" pattern="yyyy/MM/dd hh:mm"/>
				
				
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<b>내용</b>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<pre>${inquiry.ms_content}</pre>
			</td>
		</tr>
	</table>

	<c:if test="${inquiry.read_yn == '0'}">
		<form action="/admin/inquiryAnswer"  method="post">
		<input type="hidden" name="num" value="${inquiry.num}">
		<table class="type04" style = "text-align : center; width: 800px;margin : auto; OR  ( margin-rigth : auto; margin-left : auto; )  ">
	  		 <tr>
	  		 	<td colspan="3">
					<b>답변 입력</b>
				</td>
	  		 </tr>
	  		 <tr>
	  		 	<td colspan="3">
					<textarea rows="10" cols="20" name="answer" style="width: 800px; height : 400px; font-size : 20px;"></textarea>
				</td>
  		 	</tr>
  		 	<tr>
	  		 	<td colspan="3">
					<input type="submit" value="등록" class="inputsmall">
				</td>
	  		 </tr>
  		</table>
		</form>
	</c:if>
	<c:if test="${inquiry.read_yn != '0'}">
		<form action="/admin/inquiryAnswer"  method="post">
		<input type="hidden" name="num" value="${inquiry.num}">
		<table class="type04" style = "text-align : center; width: 800px;margin : auto; OR  ( margin-rigth : auto; margin-left : auto; )  ">
	  		 <tr>
	  		 	<td colspan="3">
					<b>답변 내용</b>
				</td>
	  		 </tr>
	  		 <tr>
	  		 	<td colspan="3">
					<pre>${inquiry.answer}</pre>
				</td>
	  		 </tr>
	  		 <tr>
	  		 	<td colspan="3">
					<b>답변 수정</b>
				</td>
	  		 </tr>
	  		 <tr>
	  		 	<td colspan="3">
					<textarea rows="10" cols="20" name="answer" style="width: 800px; height : 400px; font-size : 20px;"></textarea>
				</td>
  		 	</tr>
  		 	<tr>
	  		 	<td colspan="3">
					<input type="submit" value="등록" class="inputsmall">
				</td>
	  		 </tr>
	  	</table>
		</form>
	</c:if>
</div>
	

</body>
</html>
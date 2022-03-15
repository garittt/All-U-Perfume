<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/board.css">
<html>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
<head>
</head>
<body>
<c:if test="${sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>
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
	<table class="type04">
		<tr>
			<td>작성자</td>
			<td>제목</td>
			<td>등록일</td>
			<td>답변 유무</td>
		</tr>
		<c:forEach items="${articleList}" var = "i" >
  		<tr>
  			<td>${i.id}</td>
    		<th scope="row"><a href="/admin/inquiryContent?num=${i.num}">${i.subject}</a></th>
    		<td>
    		<fmt:formatDate value="${i.creat_date}" pattern="yyyy/MM/dd hh:mm"/>
    		</td>
    		<td>
    			<c:if test="${i.read_yn != '0'}">
    			 	<b style="color: red;">	완료</b>
    			</c:if>
    			<c:if test="${i.read_yn == '0'}">
    				미완료
    			</c:if>
  		</tr>
  		</c:forEach>
 	</table>
</div>
<c:if test="${count > 0 }" >
	<c:set var="pageCount" value="${count/ pageSize + (count % pageSize == 0 ? 0 : 1) }" />
	<c:set var="pageBlock" value="${10 }" />
	<fmt:parseNumber var ="result" value="${currentPage/10}" integerOnly="true"/>
	<c:set var="startPage" value="${result *10 +1}"/>
	<c:set var="endPage" value="${startPage + pageBlock -1 }"/>
	<c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
    </c:if> 
	<c:if test="${ startPage >10}" >
		<a href="/admin/inquiry?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	<c:forEach var="g" begin="${startPage}" end="${endPage}">
		<a href="/admin/inquiry?pageNum=${g}">[${g}]</a>
	</c:forEach>
	<c:if test="${ endPage < pageCount}" >
		<a href="/admin/inquiry?pageNum=${startPage+10}">[다음]</a>
	</c:if>
</c:if>


</body>
</html>





















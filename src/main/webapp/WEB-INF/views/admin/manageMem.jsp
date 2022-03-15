<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="/resources/css/board.css">

<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지입니다.</title>
</head>
<body>

<c:if test="${sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/admin/login";
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

<c:if test="${sessionScope.aid != null}">
	
	<c:if test="${count == 0}">
		가입된 회원이 없습니다.
	</c:if>

	<c:if test="${count > 0}">
	<div class="a"> 
		<table class="type02" >
			<tr>
				<th> 아이디 </th>
				<th> 이름 </th>
				<th> 이메일 </th>
				<th> 전화번호 </th>
				<th>생일</th>
				<th>성별</th>
				<th>가입일자</th>
				<th>가입처</th>
				<th>비고</th>
			</tr> 
			<c:forEach items="${list}" var="member" > 
			<tr>
				<td> ${member.id} </td>
				
				<td> ${member.name} </td>
				
				<td>
					<c:if test="${member.email == null}">
					 기입 안함
					</c:if>
					<c:if test="${member.email != null}">
					 ${member.email} 
					</c:if>
				</td>
				<td>
					<c:if test="${member.phone == null}">
					 기입 안함
					</c:if>
					<c:if test="${member.phone != null}">
					 ${member.phone} 
					</c:if>
				 </td>
				<td>
				<c:if test="${member.birthday == null}">
					 기입 안함
					</c:if>
					<c:if test="${member.birthday != null}">
					<fmt:formatDate value="${member.birthday}" pattern="yyyy/MM/dd"/>
					</c:if>
				</td>
				
				<td>
					<c:if test="${member.gender == null}">
					 기입 안함
					</c:if>
					<c:if test="${member.gender != null}">
					 ${member.gender} 
					</c:if>
				</td>
				
				<td><fmt:formatDate value="${member.regdate}" pattern="yyyy/MM/dd hh:mm"/></td>
				
				<td>
					<c:if test="${member.api_token == 'P_TOKEN'}">
					 일반 회원
					</c:if>
					<c:if test="${member.api_token == 'K_Token'}">
					 카카오 회원
					</c:if>
				</td>
				
				<td><input type="button" value="탈퇴처리" onclick="sureToD('${member.id}')" class="inputsmall"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
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
</c:if>



</body>

<script type="text/javascript">
	function sureToD(id){
    	if (confirm(id+'회원을 탈퇴시키시겠습니까?')) {
         location.href="/admin/manageMemPro?id="+id;
	} else {
	       alert("이전 페이지로 돌아갑니다.");
		}
	}
</script>

</html>
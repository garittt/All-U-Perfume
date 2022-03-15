<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

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
						<c:if test="${sessionScope.aid != null}">
							<a href="/admin/logout">로그아웃</a>
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

function updateSubmit(){
	
	if($('#subject').val() == ''){
		alert("제목을 입력하세요.");
		document.getElementById('subject').focus();
		return false;
	} else if($('#content').val() == ''){
		alert("내용을 입력하세요.");
		document.getElementById('content').focus();
		return false;
	}
	
	var updateData = JSON.stringify($('form#updateForm').serializeObject());
	
	$.ajax({
		data : updateData,
		url : "/notice/updatePro",
		type : "POST",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			if(data == 1){
				alert('수정되었습니다.')
				window.location='/notice/content?b_number=' + ${boardDTO.b_number}
			}
		}
	});
	
};
</script>
<div class="aaaa">공지사항 게시판</div>

<c:if test="${sessionScope.aid != null}">
<div class="a"> 
    <form id="updateForm">
    	<input type="hidden" name="boardnum" value="${boardDTO.boardnum}">
		<input type="hidden" name="b_number" value="${boardDTO.b_number}">
		<table class="type04" style = "text-align : center; width: 800px; height : 600px; ">
			<tr>
				<td colspan="2" style="text-align:right;">
					<input type ="button" onclick="window.location='/notice/list'" value="목록 가기" class="inputsmall"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><h3>제 목</h3></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="subject" id="subject" style="width: 800px; height : 30px; font-size : 20px;" value = "${boardDTO.subject}"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><h3>내 용</h3></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="20" name="content" id="content" style="width: 800px; height : 400px; font-size : 20px;">${boardDTO.content}</textarea> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="글 수정" onclick="updateSubmit()" class="inputsmall"/>
				</td>
			</tr>
		</table>
    </form>
</div>
</c:if>

제 목 : <input type="text" name="subject" id="subject" value = "${boardDTO.subject}"/> <br/> 
    	<input type ="hidden" name ="auth" value="${boardDTO.auth}" />  <br />
    	내 용 : <textarea rows="10" cols="20" name="content" id="content">${boardDTO.content}</textarea> <br />
    		   <input type="button" value="글 수정" onclick="updateSubmit()" />

















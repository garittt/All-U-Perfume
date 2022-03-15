<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/popup.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>



<c:forEach items="${reviewGet}" var="get">
<c:if test="${sessionScope.id != null}">
	<div class="bo1" ></div>
	<div id="review" align = "center" >
			<form id="reviewRe" method="post">
				<table>
				<tr>
					<td colspan="2"><h3>${get.writer}님 </h3></td>
				</tr>
				<tr><td>긍정적 리뷰</td><td>부정적 리뷰</td></tr>
				<tr>
					<td><textarea cols="50" rows="10" name="like_re">${get.like_re}</textarea></td>
					<td><textarea cols="50" rows="10" name="unlike_re">${get.unlike_re}</textarea></td>
				</tr>
				
				</table>
				<input type="hidden" name="r_number" value="${get.r_number}"/>
			<input type="button" value="입력"  onclick="reRee('${get.r_number}')" class="inputsmall"/>
			</form>
		</div>
	
</c:if>
</c:forEach>




<c:if test="${sessionScope.kid != null}">
<c:forEach items="${reviewGet}" var="get">
<div class="bo1"  ></div>
	<div id="review" align = "center" >
			<form id="reviewRe" method="post">
				<table>
				<tr>
					<td colspan="2"><h3>${get.writer}님</h3></td>
				</tr>
				<tr><td>긍정적 리뷰</td><td>부정적 리뷰</td></tr>
				<tr>
					<td><textarea cols="50" rows="10" name="like_re">${get.like_re}</textarea></td>
					<td><textarea cols="50" rows="10" name="unlike_re">${get.unlike_re}</textarea></td>
				</tr>
				
				</table>
				<input type="hidden" name="r_number" value="${get.r_number}"/>
			<input type="button" value="입력" id="submit" onclick="reRee('${get.r_number}');" class="inputsmall"/>
			</form>
		</div>
</c:forEach>		
</c:if>

<script>




function reRee(r_number){
	var form = $('#reviewRe')[0];
	var data = new FormData(form);
	$.ajax({
		type: "post",
		url: '/main/reRe',
		data: data,
		dataType: 'json',
		contentType: false,
		processData: false,
		beforeSend: function(){
			alert("수정하시겠습니까?");
		},
		success: function(data){
			a = parseInt(data);
			if(a == 1){
				alert("수정되었습니다");
				window.close();
				opener.location.reload();
			}else{
				alert("수정에 실패 했습니다");
			}
		}
	});

}
</script>


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
  };
</script>



  
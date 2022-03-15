<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<html>
<head>
<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>


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
					<li><a href="/p/list?boardnum=1">Q & A</a></li>
					<li><a href="/notice/list?boardnum=3">공지사항</a></li>
					<li><a href="/best/list?boardnum=2">향수 추천</a></li>
					<li><a href="/main/list">메인</a></li>
					<li><a href="/survey/surveyStart">설문</a></li>
				</ul>
			</nav>
		</div>
	</header>
</div> <hr color = "white" size = "2px"/>


<div class="box"><br/>
<c:if test="${sessionScope.id  != null && sessionScope.kid == null}">
<input id="btnSubmit" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" type="button" value="관심향수 삭제" onclick="d('${sessionScope.id}')"/>
</c:if>
<c:if test="${sessionScope.kid  != null && sessionScope.id == null}">
<input id="btnSubmit" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" type="button" value="관심향수 삭제" onclick="d('${sessionScope.kid}')"/>
</c:if>
</div>
<table style="width: 500px; text-align: center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) ">
<tr>
	<c:forEach items="${content}" var = "content1" varStatus="status">
		 <c:if test="${status.index%5==0}">
		 	<tr></tr>
		 </c:if>
			 <td>
			 	<br/>
			 	<br/>
			 	<input type="checkbox" style="width:0.5cm;height:0.5cm" name="chkBox" value = "${content1.f_number}" ><br/>
				<img src="${content1.f_pic}"><br/>
				<a href="javascript:void(0);" onclick="window.open('/main/sdetail?p_number=${content1.p_number}&f_name=${content1.f_name}', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');">
				${content1.f_namee}</a><br/>
				<c:if test="${sessionScope.id  != null && sessionScope.kid == null}">
				<input type="button" value = "삭제" onclick = "a('${sessionScope.id}','${content1.f_number}')" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" >
				</c:if>
				<c:if test="${sessionScope.kid  != null && sessionScope.id == null}">
				<input type="button" value = "삭제" onclick = "a('${sessionScope.kid}','${content1.f_number}')" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" >
				</c:if>
				<br/>
				<br/>
			</td>
		</c:forEach>
</tr>
</table>


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


	function a(writer,f_number){
		window.location="/mypage/wishListDelete?writer="+writer+"&f_number="+f_number;
		alert("삭제되었습니다");
		window.reload();
	}
	
	function d(writer){
		
		var chk_arr = new Array();
		
		$("input[name=chkBox]:checked").each(function(){
			var chk = $(this).val();
			chk_arr.push(chk);
		})
		window.location= "/mypage/wishListDeleteCk?writer="+writer+"&chk="+chk_arr ; 
		alert("삭제되었습니다");
		window.reload();
	    
		
	}
	
</script>
		
		
	
</body>
</html>
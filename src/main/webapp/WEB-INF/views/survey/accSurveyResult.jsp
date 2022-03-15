<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<style>
.hidden{display:none;}
	
.reviewlist{ display:none; }

.wish{

width:3cm;
height:1cm; 
border :none; 
background-color:#76448A; 
color : white; 
border-radius: 10px;
postion : sticky;
top : 90px;

}
</style>


<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>

<body>
<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
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
					<li><a href="/best/list?boardnum=2">향수 추천</a></li>
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





	<div  style=" position: fixed; text-align : center; width : 100%; height : 60px;"><br/>
	<c:if test="${sessionScope.id  != null && sessionScope.kid == null}">
		<input id="btnSubmit" class="wish" type="button" value="관심향수 등록" onclick="w('${sessionScope.id}')"/>
	</c:if>
	<c:if test="${sessionScope.kid  != null && sessionScope.id == null}">
		<input id="btnSubmit" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" type="button" value="관심향수 등록" onclick="w('${sessionScope.kid}')"/>
	</c:if>
	
	</div>
	<div style ="width : 100%; height : 60px;"></div>
	<table style="text-align: center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) ">
		<tr>
			<c:forEach items="${result}" var="r"  varStatus="status">
				<c:if test="${status.index%5==0}">
				 	<tr></tr>
				</c:if> 
				<td>
				 	<br/>
				 	<br/>
			 		<input type="checkbox"  style="width:0.5cm;height:0.5cm" name="chkBox" value = "${r.f_number}" /><br/>
					<a href="javascript:void(0);" onclick="window.open('/main/sdetail?p_number=${r.p_number}&f_name=${r.f_name}', 'pop01', 'top=10, left=10, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=no');">
						<img src="${r.f_pic}"><br/><br/>
					</a>
			 		<a href="javascript:void(0);" onclick="window.open('/main/sdetail?p_number=${r.p_number}&f_name=${r.f_name}', 'pop01', 'top=10, left=10, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=no');">
			 			${brand[status.index].d_name}<br/><br/>
			 		</a>
			 		<a href="javascript:void(0);" onclick="window.open('/main/sdetail?p_number=${r.p_number}&f_name=${r.f_name}', 'pop01', 'top=10, left=10, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=no');">
			 			${r.f_namee} <br/><br/>
			 		</a>
			 		<br/>
					<br/>
				</td>
			</c:forEach>
		</tr>
	</table>




<script>
function w(writer){
	
	var chk_arr = new Array();
	
	$("input[name=chkBox]:checked").each(function(){
		var chk = $(this).val();
		chk_arr.push(chk);
	})
	if(chk_arr.length == 0){
		alert("향수를 선택해 주세요");
	}else{
		var url = "/mypage/serveyRegistration?writer="+writer+"&chk="+chk_arr ; 
	    var name = "wish";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no" ; 
		window.open( url, name, option);
	}
	
}
</script>

</body>
</html>
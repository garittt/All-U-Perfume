<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  
<link rel="stylesheet" href="/resources/css/survey.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<style>
table{
	height :500px;
	width: 900px; 
	text-align: center; 
	margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) 
	font-size : 25px;
}
td{
	font-size : 20px;
}

.aa{
	font-size : 16px;
	height :30px;
	color:#7b7b7b;
	
	
}


</style>
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

<div class="header">원하는 타입의 향을 3가지 골라주세요.</div>
    <div class="body">
        <div class="content" style = "font-size:20px" >
        <div class = "temp2"></div>
        
		
		<form action="/survey/accSurveyResult" method="post" onsubmit="return noneCheck();">
			<table>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="1" style="width:0.5cm;height:0.5cm"/>
				</td>
				<td>
					<b style = "line-height:55px;">시트러스</b><br/>
					<div class="aa" >감귤류 과일의 향을 의미합니다. 달콤하고 새콤한 향이 주를 이루며, 귤, 오렌지, 자몽, 베르가못 등이 있습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="2" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">과일/채소/견과류</b><br/>
					<div class="aa">시트러스를 제외한 과일, 다양한 채소와 견과류의 향입니다. 일상생활에서 흔히 접할 수 있는 향기입니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="3" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">꽃</b><br/>
					<div class="aa">색채가 강한 꽃의 향입니다. 향수의 향료 중 가장 많은 종류를 차지하며, 장미, 제비꽃 등 매력적인 향기가 많습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="4" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">흰 꽃</b><br/>
					<div class="aa">꽃 중에서도 하얀 꽃의 향입니다. 자스민, 백합, 은방울꽃 등 은은한 향기가 주를 이룹니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="5" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">허브류</b><br/>
					<div class="aa">강렬한 허브 향기입니다. 바질, 로즈마리, 타임과 같이 개개별 향의 색이 독특합니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="6" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">향신료</b><br/>
					<div class="aa">허브만큼 인상적인 향신료의 향입니다. 허브와 비슷하지만 다른 매력이 있습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="7" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">달콤한 디저트향</b><br/>
					<div class="aa">잼, 초콜릿, 카라멜과 같은 달콤한 향기입니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="8" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">나무와 이끼류</b><br/>
					<div class="aa">숲 속에서 맡을 수 있는 무겁고 진한 향입니다. 다양한 나무에서 맡을 수 있는 자연의 향기입니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="9" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">나무 진액</b><br/>
					<div class="aa">예로부터 향수의 원료로 사용되던 나무 진액의 향기입니다. 송진이나 인센스 등 이색적인 원료가 많습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="10" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">동물에게 추출한 향기</b><br/>
					<div class="aa">향유고래, 사향노루 등 동물에서 얻은 향료도 향수에 사용됩니다. 살냄새처럼 은은하게 배어드는 향이 많습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="11" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">술</b><br/>
					<div class="aa">술 또한 종류 별로 다양한 향을 가지고 있습니다. 다양한 주류의 향이 그대로 향수에 담겼습니다.</div>
				</td>
			<tr>
			<tr>
				<td>
					<input onclick="threeCheck(this)" type = "checkbox"  name="note_type_num" value="12" style="width:0.5cm;height:0.5cm"/> 
				</td>
				<td>
					<b style = "line-height:55px;">그 외</b><br/>
					<div class="aa">자연적으로 얻기 힘든 향을 인공적으로 담았습니다. 갓 마른 빨래 향, 계절마다 다른 공기의 향 등이 있습니다.</div>
				</td>
			<tr>
			</table>
			<br/>
			<br/>
			<br/>
			<div class="textBox4"><input type="submit" value="결과 확인" style="border: none; background: transparent; width:800px; height:90px;font-weight: 500; font-size : 20px;"></div>
        </form>	
   		</div>
    </div>
<div class="footer"></div>

<script type="text/javascript">
var maxCount = 3
var count = 0;

	function threeCheck(field) {
		if(field.checked){
			count += 1;
		}else{
			count -= 1;
		}
		
		if(count > maxCount){
			alert("최대 3가지 향만 선택 가능합니다.");
			field.checked = false;
			count -= 1;
		}
	}
</script>	

<script>
	function noneCheck() {
		 var valCheck = false;
	     var userVal = document.getElementsByName("note_type_num");
	        for(var i=0;i<userVal.length;i++){
	            if(userVal[i].checked == true) {
	            	valCheck = true;
	            }
	        }
	        if(valCheck == false){
	        	alert("하나 이상의 향을 선택해주세요");
	        	return false;
	        }
	}
</script>
</body>
</html>
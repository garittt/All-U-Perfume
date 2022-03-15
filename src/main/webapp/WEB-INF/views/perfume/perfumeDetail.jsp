<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">

<style>
input{
	border :none; 
	background-color:#76448A; 
	color : white; 
	border-radius: 10px;
	font-size : 15px;
}

table{
	width: 1000px; 
	text-align: center; 
	margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) 
	border-collapse:collapse;
}
.hidden{display:none;}
	
.reviewlist{ display:none; }
</style>

<title>당신만의 향기, All U Perfume</title>

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

	function wish(writer, f_number){
		var result = confirm("관심향수로 등록하시겠습니까?");
		var url = "/mypage/registration?writer="+writer+"&f_number="+f_number ;
        var name = "wish";
		var option = "width = 400, height = 200, top = 100, left = 200, location = center"
		if(result){
			window.open(url,name, option);	
		}else{	
		}
	}
</script>

<div class="aa"></div>
<table border ="1" style=" border-collapse:collapse;">
	<c:forEach items="${getDetail}" var= "per" > 
	<tr>
    	<td colspan="3" style = "text-align:right;">게시물번호 ${per.p_number}</td>
  	</tr>
  	<tr>
    	<td rowspan = "6"><img src="${per.f_pic}" style = "width: 300px; height:400px;"></td>
    	<c:if test="${sessionScope.id != null && sessionScope.kid == null}">
    	<td colspan="2"  style = "width: 500px;"><input type = "button" value="관심향수 등록" onclick="wish('${sessionScope.id}','${per.f_number}')" style="width:3cm;height:1cm;" /></td>
  		</c:if>
    	<c:if test="${sessionScope.kid != null && sessionScope.id == null }">
    	<td colspan="2"  style = "width: 500px;"><input type = "button" value="관심향수 등록" onclick="wish('${sessionScope.kid}','${per.f_number}')" style="width:3cm;height:1cm;" /></td>
  		</c:if>
  	</tr>
  	<tr>
    	<td>향수 이름</td>
    	<td style = "font-size: 20px;"><b>${per.f_namee}</b></td>
  	</tr>
  	<tr>
    	<td>브랜드 이름</td>
    	<td style = "font-size: 20px;">
    		<img src="${brandP}" ><br/>
    	  	${brand} 
    	</td>
  	</tr>
  	<tr>
    	<td>추천 계절</td>
    	<td>
	    	<c:choose>
				<c:when test="${per.season == '1'}">
				봄
				</c:when>
				<c:when test="${per.season == '2'}">
				여름
				</c:when>
				<c:when test="${per.season == '3'}">
				가을
				</c:when>
				<c:when test="${per.season == '4'}">
				겨울
				</c:when>
				<c:when test="${per.season == '1-2'}">
				봄,여름
				</c:when>
				<c:when test="${per.season == '1-3'}">
				봄,가을
				</c:when>
				<c:when test="${per.season == '1-4'}">
				봄,겨울
				</c:when>
				<c:when test="${per.season == '2-3'}">
				여름,가을
				</c:when>
				<c:when test="${per.season == '2-4'}">
				여름,겨울 
				</c:when>
				<c:when test="${per.season == '3-4'}">
				가을,겨울
				</c:when>
				<c:when test="${per.season == '1-2-3'}">
				봄,여름,가을
				</c:when>
				<c:when test="${per.season == '2-3-4'}">
				여름,가을,겨울
				</c:when>
				<c:when test="${per.season == '1-2-3-4'}">
				봄,여름,가을,겨울
			</c:when>
			</c:choose>
		</td>
  	</tr>
 	<tr>
	    <td>추천 성별</td>
	    <td>
	    	<c:choose>
				<c:when test="${per.gender == '0'}">
				여자
				</c:when>
				<c:when test="${per.gender == '1'}">
				남자
				</c:when>
				<c:when test="${per.gender == '2'}">
				중성
			</c:when>
			</c:choose>
	    </td>
	</tr>
	<tr>
    	<td colspan="2">
    		<c:if test="${sessionScope.kid != null}">
				<input type="button" onclick="perlike('${sessionScope.kid}' , '${per.p_number}' , '${per.f_name}')" value="좋아요" style="width:3cm;height:1cm;"/>${per.f_like_heart}
			</c:if>	
			<c:if test="${sessionScope.id != null}">
				<input type="button" onclick="perlike('${sessionScope.id}' , '${per.p_number}' , '${per.f_name}')" value="좋아요" style="width:3cm;height:1cm;"/>${per.f_like_heart}
			</c:if>	
    	</td>
  	</tr>
	<tr>
	    <td>탑노트</td>
	    <td colspan="2" > 
	    	<table style="width: 250px; text-align: center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) ">
		    	<c:forEach items="${topnote}" var= "note" varStatus="status"> 
		    		<c:if test="${status.index%5==0}">
		    			<tr></tr>
		    		</c:if>
		    			<td>
		    			<img src="${note.n_pic}" /><br/>
			            ${note.note_eng}
		    			</td>
			    </c:forEach>
			</table>
		</td>
	</tr>
  	<tr>
	    <td>하트 노트</td>
	    <td colspan="2">
	    	<table style="width: 250px; text-align: center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) ">
		    	<c:forEach items="${heartnote}" var= "note" varStatus="status"> 
		    		<c:if test="${status.index%5==0}">
		    			<tr></tr>
		    		</c:if>
		    			<td>
		    			<img src="${note.n_pic}" /><br/>
			            ${note.note_eng}
		    			</td>
			    </c:forEach>
			</table>
	    </td>
	</tr>
	<tr>
		<td> 베이스 노트</td>
	    <td colspan="2">
	    	<table style="width: 250px; text-align: center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) ">
		    	<c:forEach items="${basenote}" var= "note" varStatus="status"> 
		    		<c:if test="${status.index%5==0}">
		    			<tr></tr>
		    		</c:if>
		    			<td>
		    			<img src="${note.n_pic}" /><br/>
			            ${note.note_eng}
		    			</td>
			    </c:forEach>
			 </table>
		</td>
	</tr>
	
	</c:forEach>
</table>



<c:forEach items="${getDetail}" var= "per">
	<c:if test="${sessionScope.id != null}">
			<form action="/main/review?writer=${sessionScope.id}&p_number=${per.p_number}&f_name=${per.f_name}" method="post" >
				<table border ="1" style=" border-collapse:collapse;">
				<tr>
					<td colspan="2" style = "font-size: 20px;"><b>${sessionScope.id}님</b></td>
				</tr>
				<tr>
					<td>긍정적 리뷰</td>
					<td>부정적 리뷰</td>
				</tr>
				<tr>
					<td><textarea cols="50" rows="10" name="like_re"></textarea></td>
					<td><textarea cols="50" rows="10" name="unlike_re"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="입력" style="width:3cm;height:1cm; border :none; background-color:#76448A; color : white; border-radius: 10px;" type="button"/></td>
				</tr>
				</table>
			</form>
		
	</c:if>
</c:forEach>

<c:forEach items="${getDetail}" var= "per">
	<c:if test="${sessionScope.kid != null}">
			<form action="/main/review" method="get" >
				<table border ="1" >
				<tr>
					<td colspan="2" style = "font-size: 20px;"><b>${sessionScope.kid}님</b></td>
				</tr>
				<tr>
					<td>긍정적 리뷰</td>
					<td>부정적 리뷰</td>
				</tr>
				<tr>
					<td><textarea cols="50" rows="10" name="like_re"></textarea></td>
					<td><pre><textarea cols="50" rows="10" name="unlike_re"></textarea></pre></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="입력" style="width:3cm;height:1cm" type="button"/></td>
				</tr>
				</table>
			<input type="hidden" name="p_number" value="${per.p_number}"/>
			<input type="hidden" name="writer" value="${sessionScope.kid}"/>
			<input type="hidden" name="f_name" value="${per.f_name}"/>
			</form>
	</c:if>
</c:forEach>

<c:forEach items="${getReview}"  varStatus="status" var="re">
	<div class="reviewlist">
	<table border = "1"  style=" border-collapse:collapse;">
		<tr>
			<td colspan = "2" style = "font-size: 15px;" >작성자 : ${re.writer}</td>
		</tr>
		<tr>
			<td colspan = "2"><fmt:formatDate value="${re.reg_date}" pattern="yyyy/MM/dd hh:mm"/></td>
		</tr>
		<tr>
			<td style = "width:500px">긍정적 리뷰 </td>
			<td style = "width:500px">부정적 리뷰 </td>
		</tr>
		<tr>
			<td>${re.like_re}</td>
			<td>${re.unlike_re}</td>
		</tr>
		<tr>
			<td> 
				<c:if test="${sessionScope.kid != null}">
						<input type="button" onclick="like('${sessionScope.kid}', '${re.p_number}', '${re.r_number}', '${getDetail[status.index].f_name}')" value="좋아요" style="width:2cm;height:0.8cm;"/>
				</c:if>
				<c:if test="${sessionScope.id != null}">
					<input type="button" onclick="like('${sessionScope.id}', '${re.p_number}', '${re.r_number}', '${getDetail[status.index].f_name}')" value="좋아요" style="width:2cm;height:0.8cm;"/>
				</c:if>
				${re.like_re_heart} 
			</td>
			<td>
				<c:if test="${sessionScope.kid != null}">
					<input type="button" onclick="unLike('${sessionScope.kid}', '${re.p_number}', '${re.r_number}', '${getDetail[status.index].f_name}')" value="싫어요" style="width:2cm;height:0.8cm;"/>
				</c:if>
				
				<c:if test="${sessionScope.id != null}">
					<input type="button" onclick="unLike('${sessionScope.id}', '${re.p_number}', '${re.r_number}', '${getDetail[status.index].f_name}')" value="싫어요" style="width:2cm;height:0.8cm;"/>
				</c:if>
				${re.unlike_re_heart}
			</td>
		</tr>
		<tr>
	        <td colspan="2">
	            <c:set var="writer" value="${re.writer}" scope="session"/> 
	            <c:if test="${sessionScope.kid == writer}">
	            <input type="button" value="수정" style="width:2cm;height:0.8cm;" onclick="window.open('/main/reviewRe?r_number=${re.r_number}','Re', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');"/>
	            <input type="button" value="삭제" style="width:2cm;height:0.8cm;" onclick="reDel('${re.r_number}')"/>
	            </c:if>
	            <c:if test="${sessionScope.id == writer}">
	            <input type="button" value="수정" style="width:2cm;height:0.8cm;" onclick="window.open('/main/reviewRe?r_number=${re.r_number}','Re', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');"/>
	            <input type="button" value="삭제" style="width:2cm;height:0.8cm;" onclick="reDel('${re.r_number}')"/>
	            </c:if>
	        </td>
    </tr>
	</table>
	</div>
</c:forEach>

<a href="#" id="load">더 보기</a>
 
<script>

$(".reviewlist").slice(0,5).show();
$("#load").click(function(e){
	e.preventDefault();
	$(".reviewlist:hidden").slice(0,5).show();
	if($(".reviewlist:hidden").length == 0){
		$("#load").css('display','none');
	}
})

</script>
	

<script>
function perlike(id, p_number, f_name){
	$.ajax({
		type : "post" ,
		data : {
			id : id,
			p_number : p_number,
			f_name : f_name
			} , 
		url : "/main/perlike" , 
		success : function(data){	
			a = parseInt(data);
			if(a == 1){
				alert('좋아요 되었습니다');
				window.location.reload();
			}else{
				alert('좋아요는 두번씩 할 수 없습니다');
			}
		}
	});
}

function like(id, p_number, r_number, f_name){
	$.ajax({
		type : "post" ,
		data : {
			id : id,
			p_number : p_number,
			r_number : r_number,
			f_name : f_name
			} , 
		url : "/main/like" , 
		success : function(data){	
			a = parseInt(data);
			if(a == 1){
				alert('좋아요/ 싫어요 되었습니다');
				window.location.reload();
			}else{
				alert('좋아요/ 싫어요는 두번씩 할 수 없습니다');
			}
		}
	});
}
</script>

<script>
	function unLike(id, p_number, r_number, f_name){
		$.ajax({
			type : "post" ,
			data : {
				id : id,
				p_number : p_number,
				r_number : r_number,
				f_name : f_name
				} , 
			url : "/main/unlike" , 
			success : function(data){	
				a = parseInt(data);
				if(a == 1){
					alert('좋아요/ 싫어요 되었습니다');
					window.location.reload();
				}else{
					alert('좋아요/ 싫어요는 두번씩 할 수 없습니다');
				}
			}
		});
	}
	

	
	
</script>

<script>
    function reDel(r_number){
        $.ajax({
            type : "post" ,
            data : {
                r_number : r_number,
                } , 
            url : "/main/reDel" , 
            success : function(data){
                a = parseInt(data);
                if(a == 1){
                    alert('삭제 되었습니다');
                    window.location.reload();
                }else{
                    alert('삭제에 실패했습니다');
                }
            }
        });
    }
</script>

































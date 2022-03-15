<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/board.css">

<title>당신만의 향기, All U Perfume</title>

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



<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>


<script>
	function wish(writer,f_number){
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
</script>



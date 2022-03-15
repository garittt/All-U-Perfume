<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>당신만의 향기, All U Perfume</title>

<c:if test="${sessionScope.aid == null}">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>

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




<div class="a"> 
 <form id="writeForm">
 <input type="hidden" name="b_number" value="${b_number}">
 답변<br/>
 
  <textarea rows="10" cols="20" name="answer" id="answer" style="width: 250px; height :250px; font-size : 15px;"></textarea> <br />
    		   <input type="button" value="글쓰기" onclick="writeSubmit('${b_number}')"  class="inputsmall"/>
 </form>
 </div>
 
 <script>	
 function writeSubmit(b_number){
	 console.log($('#answer').val())
		$.ajax({
			type : "post" ,
			data : {
				b_number : b_number,
				answer : $('#answer').val()
				} , 
			url : "/q/answerIn" , 
			success : function(data){	
				a = parseInt(data);
				if(a == 1){
					alert('작성되었습니다');
					window.close();
					opener.location.reload();
				}else{
					alert('작성에 실패 했습니다');
				}
			}
		});
	}
 </script>
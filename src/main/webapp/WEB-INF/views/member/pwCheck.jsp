<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>  
<link rel="stylesheet" href="/resources/css/popup.css"> 
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
<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>

<script>
function pwCheck(){
	$.ajax({
		 type : "post" ,
		data : {id : $("#id").val(), pw : $("#pw").val(), pw2 : $("#pw2").val()} , 
		url : "/member/pwCheckPro" , 
		success : function(data){
			a = parseInt(data); //컨트롤러의 result
			if(a == 1){
				alert("비밀번호가 변경되었습니다!");
				window.close();
			}else{
				alert("비밀번호가 틀립니다.");
			}
		}
	});	
}
</script>

<body>
	<div class="bo1" style="height:180px;"></div>
	<form>
		<input type="hidden" value="${sessionScope.id}" name="id" id="id" />
	<table>
		<tr>
			<td>현재 비밀번호</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="pw" id="pw" style="width:500; height:30;"/>
			</td>
		</tr>
		<tr>
			<td>변경할 비밀번호</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="pw2" id="pw2" style="width:500; height:30;"/>
			</td>
		</tr>
	</table>
	<br/>
	<input type="button" value="전송" onclick="pwCheck();" class="inputsmall"/>
	</form>
</body>
</html>
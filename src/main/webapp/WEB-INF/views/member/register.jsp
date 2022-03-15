<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/board.css"> 
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>

<style>
.filebox label { 
	width: 90px; 
	height: 30px; 
	display: inline-block; 
	/* padding: .5em .75em;  */
	color: white; 
	font-size:18px;
	text-align : center;
	vertical-align: middle; 
	background-color: #76448A; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: 10px;
	} 
	
.filebox input[type="file"] { 
	/* 파일 필드 숨기기 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
	}
</style>
<script>
    $(document).ready(function(){
        $("#btn").click(function(){
            $.ajax({
                type : "post" ,
                data : {id : $("#id").val()} , 
                url : "/member/idCheck" , 
                success : function(data){
                    a = parseInt(data);
                    if(a == 1){
                        $("#result").html("<font color='red'>중복</font>");
                    }else{
                        $("#result").html("<font color='green'>사용가능</font>");
                    }
                }
            });
        });
    });
    function nullCheck(){

        if($("#id").val() == ""){
            alert("아이디를 입력해주세요.");
            return false;
       }

       if($("#pw").val() == ""){
            alert("비밀번호를 입력해주세요.");
           return false;
       }

       if($("#name").val() == '') {
            alert("이름을 입력해주세요.");
           return false;
       }

       if($("#birthday").val() == ''){
            alert("생일을 입력해주세요.");
           return false;
       }

       if($('input[name=gender]:checked').val() == null){
            alert("성별을 입력해주세요.");
           return false;
       }

   }
</script>



<html>
<head>
<meta charset="UTF-8">
<title>당신만의 향기, All U Perfume</title>
</head>
<body>
    <form action="/member/registerPro" method="post" enctype="multipart/form-data" onsubmit="return nullCheck();">
    <div class="a">
    <table  style = "width : 700px; height :600px; font-size: 20px;  padding : 1em;;">
  		<tr style = " height :100px; ">
  			<td style = " width : 200px; text-align : center; ">아이디</td>
  			<td>
				<input type="text" id="id" name="id" style = "width : 300px; height :30px; font-size: 20px;">
	            <input type="button" value="중복확인" id="btn" class="inputsmall"/><br/>
	            <label id="result" style = " font-size: 18px;"></label>  			
  			</td>
  		</tr>
  		<tr>
  			<td style = " text-align : center; ">비밀번호</td>
  			<td>
				<input type="password" id="pw" name="pw" style = "width : 300px; height :30px; font-size: 20px;"> 
  			</td>
  		</tr>  
  		<tr>
  			<td style = " text-align : center; ">이름</td>
  			<td>
				<input type="text" id="name" name="name" style = "width : 300px; height :30px; font-size: 20px;">
  			</td>
  		</tr> 
  		<tr>
  			<td style = " text-align : center; ">이메일</td>
  			<td>
				<input type="text" id="email" name="email" placeholder="example@example.com" style = "width : 300px; height :30px; font-size: 20px;">
  			</td>
  		</tr> 
  		<tr>
  			<td style = " text-align : center; ">전화번호</td>
  			<td>
				<input type="text" id="phone" name="phone" placeholder="01012345678" style = "width : 300px; height :30px; font-size: 20px;">
  			</td>
  		</tr> 
  		<tr>
  			<td style = " text-align : center; ">생일</td>
  			<td>
				<input type="date" id="birthday" name='birthday2' style = "width : 300px; height :30px; font-size: 20px; ">
  			</td>
  		</tr>  
  		<tr>
  			<td style = " text-align : center; ">성별</td>
  			<td>
				<input type="radio" id="male" name="gender" value="male">남성
                <input type="radio" id="female" name="gender" value="female">여성
  			</td>
  		</tr> 
  		<tr>
  			<td style = " text-align : center; ">프로필 이미지</td>
  			<td>
  				<div class = "filebox">
  				<label for="file" >사진 선택</label> 
				<input type="file" id="file" name="file" >
				</div>
  			</td>
  		</tr> 
  		<tr>
  			<td colspan="2" style = " text-align : center; ">
  				<input type="submit" value="회원가입" class="inputsmall" style = " width : 550px; height: 80px;font-size: 25px; border-radius: 20px; "><br/>
  			</td>
  		</tr>
    </table>
    </div>
    </form>
</body>
</html>
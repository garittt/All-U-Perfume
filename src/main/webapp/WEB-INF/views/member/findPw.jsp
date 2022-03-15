<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	function nullCheck(){
		nameVal = document.getElementsByName("name")[0].value;
		emailVal = document.getElementsByName("email")[0].value;
		idVal = document.getElementsByName("id")[0].value;
		if(nameVal == "" || emailVal =="" || idVal == ""){		
			alert("이름/이메일을 입력해주세요.");
			return false;
		}
	}
</script>

	<form action="/member/findPwPro" method="post" onsubmit="return nullCheck();">
		이름을 입력하세요. : <input type="text" name="name"/><br/>
		이메일을 입력하세요. : <input type="text" name="email"><br/>
		아이디를 입력하세요. :<input type="text" name="id"><br/> 
		<input type="submit" value="아이디 찾기"/>
	</form>
</body>
</html>
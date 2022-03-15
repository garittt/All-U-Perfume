<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script>
    	var msg = "${msg}"
    	alert(msg);
    	window.location="/main/detail?p_number=${p_number}&f_name=${f_name}";
    </script>
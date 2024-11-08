<%@page import="myweb.membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<span style ="color : red; font-size : 1.2em;">
		<%=
			session.getAttribute("loginFail")==null?"":session.getAttribute("loginFail")
		%>
	</span>
	<jsp:include page="../common/link.jsp"/>
	
	<h2>로그인 페이지</h2>
	<script>
		function validation(form){
			if(!form.id.value){
				alert("id 입력");
				return false;
			}
			if(form.pw.value==""){
				alert("pw 입력");
				return false;
			}
		}
	</script>
	<form action="login.do" method = "post" name = "loginForm" onsubmit="return validateion(this)">
		ID : <input type = "text" name = "id"><br>
		PW : <input type = "password" name ="pw"><br>
		<input type ="submit" value = "login">
	</form>
</body>
</html>
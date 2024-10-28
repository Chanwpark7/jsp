<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>
	<h2>login form</h2>
	<%
		String loginErr = request.getParameter("loginErr");
		if(loginErr != null)out.print("login failed");
	%>
	<form method = "post" action = "resLoginProc.jsp">
		아이디 : <input type = "text" name = "id"><br>
		패스워드 : <input type = "password" name = "pw"><br>
		<input type = "submit" value = "login">
	</form>
</body>
</html>
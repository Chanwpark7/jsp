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
	
	<h2>응답 객체를 이용해서 응답헤더 보내기 및 확인 해보기</h2>
	<form action="../day002/resHeaderEx.jsp" method = "get">
		날짜 : <input type = "text" name = "add_date" value = "2024-10-29 10:25"><br>
		숫자 : <input type = "text" name = "add_int" value = "8282"><br>
		문자 : <input type = "text" name = "add_text" value = "babo"><br>
		
		<input type = "submit" value = "응답 헤더 설정하기"> 
	</form>
</body>
</html>
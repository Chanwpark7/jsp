<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입 페이지</h2>
	<form action = "signUp.do" method = "post">
		ID : <input type = "text" name = "id"><br>
		PW : <input type = "password" name = "pw"><br>
		이름 : <input type = "text" name = "name"><br>
		<input type = "submit" value ="가입">
	</form>
</body>
</html>
<%@page import="myweb.jdbc.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//풀러 객체 생성해서 콘솔에 문제없이 메시지가 나오면 성공 or 예외 발생
	DBConnPool pooler = new DBConnPool();
%>
</body>
</html>
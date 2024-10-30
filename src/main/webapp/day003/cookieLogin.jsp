<%@page import="myweb.common.CookieMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이 페이지는 사용자의 정보를 받아서 cookie 에 저장하도록 하는 페이지임
-->
<%
	String loginId = CookieMgr.getCookie(request, "loginId");

	String cookieCheck="";
	if(!loginId.equals("")){
		cookieCheck="checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키로 ID 저장</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action = "idSaveProc.jsp" method = "post">
		ID : <input type = "text" name = "user_id" value = "<%= loginId %>">
		<!-- 만약 로그인 ID 가 없이 처음으로 이 페이지를 열면 null 즉 공백이 value 로 셋업됨. -->
		<input type = "checkbox" name = "save_check" value = "y" <%=cookieCheck %>> 아이디 저장하기<br>
		PW : <input type = "password" name = "user_pw"><br>
		<input type = "submit" value ="로그인하기">
	</form>
</body>
</html>
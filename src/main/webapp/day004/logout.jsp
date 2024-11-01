<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginOk");
	session.removeAttribute("LoginErr");
	session.invalidate();
%>
<script>
	alert("logout");
	location.href="loginForm.jsp";
</script>
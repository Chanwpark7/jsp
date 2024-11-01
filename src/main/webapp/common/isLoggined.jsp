<%@page import="myweb.common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이 페이지는 인증이 필요한 모든 페이지에서 include 한 후 인증여부를 판단하는 조각 페이지입니다.
	session 스콥에 저장된 값이 존재하는지 확인 후 없으면 알럿, 리다이렉트를 합니다.
-->

<%
	if(session.getAttribute("loginOk") == null){
		JSFunction.alertLoc("로그인 후 이용", out, "../day004/loginForm.jsp");
	}
%>
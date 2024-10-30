<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute("member"); //삭제 후 되돌리기
	session.invalidate();
	response.sendRedirect("myPage.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("ad2", "이건 r2.jsp 에서 세팅된 값");
	request.getRequestDispatcher("res.jsp").forward(request, response);
%>
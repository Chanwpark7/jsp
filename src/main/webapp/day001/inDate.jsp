<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LocalDate ld = LocalDate.now();

	LocalDateTime time = LocalDateTime.now().plusDays(1);
%>
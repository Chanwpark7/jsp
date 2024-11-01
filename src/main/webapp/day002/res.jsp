<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getParameter("name")%><br>
<%=request.getParameter("age")%><br>

<%
	Enumeration<String> reqSes = request.getAttributeNames();

	while(reqSes.hasMoreElements()){
		out.println(reqSes.nextElement());%><br><%
		out.println("/hi/");
	}
%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>요청 헤더 정보 보기</h2>
	<ul>
	<%
		Enumeration<String> headerNames = request.getHeaderNames();
	while(headerNames.hasMoreElements()){
			String hNames = headerNames.nextElement();
		%><li><%=hNames %> : <%=request.getHeader(hNames) %></li>
		<%
	}
	%>
	</ul>
</body>
</html>
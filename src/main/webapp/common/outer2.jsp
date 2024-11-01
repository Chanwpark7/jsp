<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이건 포함되는 페이지 내용2</h2>
	<%
		String str2 = "Goodbye World";
	%>
	<ul>
		<li>page scope 속성 : <%=pageContext.getAttribute("a1") %></li>
		<li>request scope 속성 : <%=request.getAttribute("b1") %></li>
	</ul>
</body>
</html>
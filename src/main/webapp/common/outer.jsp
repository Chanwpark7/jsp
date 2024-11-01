<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이건 포함되는 페이지 내용</h2>
	<%
		String str = "Hello World";
		
		pageContext.setAttribute("s1", "hi");
		request.setAttribute("s2", "hi there");
		session.setAttribute("s3", "hi here");
		application.setAttribute("s4", "hi there here");
	%>
	<ul>
		<li>page scope 속성 : <%=pageContext.getAttribute("a1") %></li>
		<li>request scope 속성 : <%=request.getAttribute("b1") %></li>
	</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 객체를 이용한 C/S 환경 확인</title>
</head>
<body>
	<h2>환경정보 확인</h2>
	<ul>
		<li>method : <%=request.getMethod() %></li>
		<li>요청 URL : <%=request.getRequestURL() %></li>
		<li>요청 URI : <%=request.getRequestURI() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버명 : <%=request.getServerName() %></li>
		<li>서버 포트 : <%=request.getServerPort() %></li>
		<li>클라이언트 IP : <%=request.getRemoteAddr() %></li>
		<li>쿼리스트링 : <%=request.getQueryString() %></li>
		<li>요청 파라미터 : <%=request.getParameter("kor")+","+request.getParameter("eng") %></li>
	</ul>
</body>
</html>
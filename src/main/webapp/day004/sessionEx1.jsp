<%@page import="java.text.SimpleDateFormat, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	session : 서버(WAS) 에 저장하는 사용자 정도등을 통틀어 말함. 웹에서 사용하는 정보 저장 방식은 크게 쿠키, 세션으로 구분하는데
	쿠키는 클라이언트 브라우저에 정보를 저장하는 방식이고, session 은 서버에 저장하는 방식임.
	
	세션정보는 기본적으로 로그인/아웃을 적용하는데 많이 사용됨. 필요에 따라서 로그인동안 서버에서 필요한 사용자의 정보를 세션에 담아서
	활용하는 것도 많이 사용됨.
	
	세션의 유지기간(시간)은 서버의 설정에서 할수도 있고, 세션객체를 이용해서 할 수도 있음.
-->
<%
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

	//세션이 생성된 시간
	long createTime = session.getCreationTime();
	String createStr = sdf.format(new Date(createTime));
	
	long lastTime = session.getLastAccessedTime();//마지막 요청 시간
	String lastStr = sdf.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session(HttpSession)의 기본 사용법</title>
</head>
<body>
	<h2>세션의 활성 시간</h2>
	<ul>
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
		<li>세션 ID : <%=session.getId() %></li>
		<li>첫 요청 시간 : <%=createStr %></li>
		<li>마지막 요청 시간 : <%=lastStr %></li>
	</ul>
</body>
</html>
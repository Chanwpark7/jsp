<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Viewer.jsp의 내용</h2>
	<ul>
		<li>${param.p1 }</li>
		<li>${param.p2 }</li>
		<li>${param.p3 }</li>
		<li>${collection }</li>
	</ul>
	<h2>뭐라고? 재형이형이 ${requestScope.jaehyung }라고?</h2>
</body>
</html>